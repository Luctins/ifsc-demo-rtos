/**
   -----------------------------------------------------------------------------
   Copyright (c) 2020 Lucas Martins Mendes.
   All rights reserved.

   Redistribution and use in source and binary forms are permitted
   provided that the above copyright notice and this paragraph are
   duplicated in all such forms and that any documentation,
   advertising materials, and other materials related to such
   distribution and use acknowledge that the software was developed
   by Lucas Martins Mendes.
   The name of the Lucas Martins Mendes may not be used to endorse or
   promote products derived from this software without specific
   prior written permission.
   THIS SOFTWARE IS PROVIDED ''AS IS'' AND WITHOUT ANY EXPRESS OR
   IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
   WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

   @author Lucas Martins Mendes
   @file   main.c
   @date   10/02/20
   @brief RTOS usage demo with TCP server and blinker
   -----------------------------------------------------------------------------
*/


/*--------- includes ---------*/
/*STD lib*/
#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <math.h>

/*FreeRTOS*/
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "freertos/task.h"
#include "freertos/event_groups.h"

/*ESP lib*/
#include "sdkconfig.h"
#include "esp_system.h"
#include "esp_spi_flash.h"
#include "esp_wifi.h"
#include "esp_event.h"
#include "esp_netif.h"
#include "nvs_flash.h"

#include "driver/gpio.h"
#include "driver/uart.h"
#include "driver/adc.h"

#include "lwip/err.h"
#include "lwip/sys.h"
#include "lwip/err.h"
#include "lwip/sockets.h"
#include "lwip/sys.h"
#include "lwip/netdb.h"
#include "lwip/tcp.h"

#define LOG_LOCAL_LEVEL ESP_LOG_VERBOSE
#include "esp_log.h"

#define ESP_IDF
#include "util.h"


/*--------- Constants ----------*/
static const char * TAG = "app_main"; // used to tag where a debug msg comes from

#define LED_RED_GPIO (19)
#define LED_GRN_GPIO (23)

#define TCP_QUEUE_LEN 3
#define TCP_BUFF_LEN 256
#define TCP_QUEUE_TIMEOUT pdMS_TO_TICKS(500)
#define TCP_PORT 80

/*--- task priority table ---*/
/*  higher number == greater priority.  when main is idle, the tcp task should
    run
*/
#define MAIN_TASK_PRIO 2
#define TCP_TASK_PRIO 2
#define BLINK_TASK_PRIO 1

/*--------- Macros ---------*/
#define GPIO_CONFIG(GPIO, MODE)                               \
  gpio_pad_select_gpio(GPIO); gpio_set_direction(GPIO, MODE)
#define abort() LOGE("Critical error, abort."); return;
#define PRINT_FREE() LOGI("available heap: \t %d", xPortGetFreeHeapSize())

/*--------- Functions ---------*/
void wifi_init_softap(const char * ssid, const char * pwd);
static void wifi_event_handler(void* , esp_event_base_t, int32_t , void* );

/*--- Tasks ---*/
void tcp_server_task(void * pvParameters);
void blink_task(void * message);

/*--------- Globals -------*/
static TaskHandle_t main_handle; /*!< used to set app_main's priority*/

static xQueueHandle tcp_queue_in;
static xQueueHandle tcp_queue_out;
static xQueueHandle * tcp_queues[2] = { &tcp_queue_in, &tcp_queue_out};

char * test_argument = "Deu certo!";
short led_state = 0;

/*--------- Main Task ---------*/
void app_main(void)
{
    /*--------- Setup ---------*/
    //debug_uart_setup();

    PRINT_FREE();

    /* Configura  GPIO */
    GPIO_CONFIG(LED_RED_GPIO, GPIO_MODE_OUTPUT); //Set the GPIO as a push/pull output
    gpio_set_level(LED_RED_GPIO, 0);
    GPIO_CONFIG(LED_GRN_GPIO, GPIO_MODE_OUTPUT); //Set the GPIO as a push/pull output
    gpio_set_level(LED_RED_GPIO, 0);

    PRINT_FREE();

    /* cria fila de mensagens TCP */
    tcp_queue_in = xQueueCreate(TCP_QUEUE_LEN, TCP_BUFF_LEN);
    ASSERT_ERROR_A(tcp_queue_in == NULL, abort());
    LOGV("created tcp_queue");
    tcp_queue_out = xQueueCreate(TCP_QUEUE_LEN, TCP_BUFF_LEN);
    ASSERT_ERROR_A(tcp_queue_out == NULL, abort());
    LOGV("created tcp_queue");

    vTaskPrioritySet(main_handle, MAIN_TASK_PRIO);
    LOGV("set main's priority");

    /*--- create tasks ----------*/
    PRINT_FREE();


    LOGI("creating tasks");
    /**
       Cria task TCP e passa como argumento para ela uma fila
    */
    xTaskCreate(tcp_server_task, "tcp_server", 4096, tcp_queues, TCP_TASK_PRIO, NULL);
    LOGV("created tcp_server task");


    xTaskCreate(blink_task, "blink", 4096, test_argument, BLINK_TASK_PRIO, NULL);
    LOGV("created blink task");

    PRINT_FREE();

    LOGI("\n\n\tRTOS Demo -- last build " __DATE__ " " __TIME__ "\n");

    while(1) {
        char msg_buffer[TCP_BUFF_LEN];

        if (xQueueReceive(tcp_queue_out, msg_buffer, portMAX_DELAY) == pdPASS ) {

            LOGV("received: %s", msg_buffer);

            if (strncmp(msg_buffer, "LED", 3) == 0) {
                gpio_set_level(LED_RED_GPIO, led_state);
                led_state = !led_state;
                strcpy(msg_buffer, "OK\n"); //copia resposta no buffer

            }
            else {
                strcpy(msg_buffer, "ERRO\n"); //copia resposta no buffer
            }

            /* envia resposta ao socket TCP */
            if (xQueueSendToBack(tcp_queue_in, msg_buffer, TCP_QUEUE_TIMEOUT) != pdPASS) {
                LOGE("unable to send response cmd, queue full");
            }
            //taskYIELD();
        }
    }
}

/*--------- Functions ---------*/

/*--- Blink ----------*/
void blink_task(void * message)
{
    static const char * TAG = "blink";
    LOGI("debug task created, msg: %s", (char *) message);
    while(1) {
        LOGI("on");
        //flash the green led every time the debug task runs
        gpio_set_level(LED_GRN_GPIO, 0);
        vTaskDelay(pdMS_TO_TICKS(750));
        LOGI("off");
        gpio_set_level(LED_GRN_GPIO, 1);
        vTaskDelay(pdMS_TO_TICKS(750));
    }
}

/*--- TCP ----------*/
void tcp_server_task(void * pvParameters)
{
    static const char * TAG = "tcp_task";

    char wifi_base_ssid[20] = "demo";
    char wifi_base_pwd[20] = "demodemo";

    QueueHandle_t ** queues = (QueueHandle_t **) pvParameters;

    char addr_str[128];
    int addr_family = AF_INET; // address family is IPv4
    int ip_protocol = IPPROTO_IP;
    struct sockaddr_in dest_addr;

    //Initialize NVS - needed for wifi parameter storage
    nvs_flash_init();

    ESP_ERROR_CHECK(esp_netif_init()); //init network interface
    ESP_ERROR_CHECK(esp_event_loop_create_default()); //start event loop

    LOGI("initializing softap");
    wifi_init_softap(wifi_base_ssid,wifi_base_pwd); //init acess point

    dest_addr.sin_addr.s_addr = htonl(INADDR_ANY); // dest address is any
    dest_addr.sin_family = AF_INET;
    dest_addr.sin_port = htons(TCP_PORT);
    ip_protocol = IPPROTO_IP;

    int listen_sock = socket(addr_family, SOCK_STREAM, ip_protocol);
    ASSERT_ERROR_A(listen_sock < 0,
                   LOGE("socket: errno %d", listen_sock);
                   vTaskDelay(10); abort());

    LOGI("Socket created");

    int err = bind(listen_sock, (struct sockaddr *)&dest_addr, sizeof(dest_addr));
    if (err != 0) {
        LOGE("Socket unable to bind: errno %d", err);
        LOGE("IPPROTO: %d", addr_family);
        close(listen_sock);
        abort();
    }
    LOGI("Socket bound, port %d", TCP_PORT);

    err = listen(listen_sock, 1);

    if (err != 0) {
        LOGE("Error occurred during listen: errno %d", err);
        close(listen_sock);
        abort();
    }

    while(1) {
        LOGI("Socket listening");
        struct sockaddr_in source_addr;
        uint addr_len = sizeof(source_addr);
        int sock = accept(listen_sock, (struct sockaddr *)&source_addr, &addr_len);
        if (sock < 0) {
            LOGE( "Unable to accept connection: errno %d", errno);
            break;
        }

        //print incoming address into string
        inet_ntoa_r(source_addr.sin_addr.s_addr, addr_str, sizeof(addr_str) - 1);

        LOGI("Socket accepted ip address: %s", addr_str);
        send(sock, "Hello, there :-)\n", 17, 0);

        int len;
        char msg_buffer[TCP_BUFF_LEN];

        do {
            // Read up to sizeof rx buffer bytes
            len = recv(sock, msg_buffer, sizeof(msg_buffer), 0);
            if (len < 0) {
                LOGE("Error occurred during receiving: errno %d", errno);
            }
            else if (len == 0) {
                LOGI( "Connection closed");
                gpio_set_level(LED_RED_GPIO, 0);
            }
            //send message to other tasks and read back result
            else {
                //test message too long
                if (len >= sizeof(msg_buffer)) {
                    LOGE("incoming message too long (> %d)", sizeof(msg_buffer));
                    strncpy(msg_buffer, "TCP ERROR: msg too long", sizeof(msg_buffer));
                }
                else {

                    //Null-terminate whatever is received and treat it like a string
                    msg_buffer[len] = 0;

                    LOGV("received: %s", msg_buffer);

                    ASSERT_ERROR("inc_msg_queue timeout",
                                 xQueueSendToBack(*queues[1], msg_buffer, TCP_QUEUE_TIMEOUT) == errQUEUE_FULL, abort());
                    LOGD("message in queue");

                    taskYIELD();

                    /* read response*/
                    ASSERT_ERROR("out_queue_timeout",
                                 xQueueReceive(*queues[0], msg_buffer, portMAX_DELAY) != pdPASS,
                                 strcat(msg_buffer," tcp: queue timeout") );
                }
                LOGV("to send: '%s'", msg_buffer);
                /**
                   send() can return less bytes than supplied length.
                   Walk-around for robust implementation.
                */
                len  = strnlen(msg_buffer,TCP_BUFF_LEN);
                int to_write = len;
                while (to_write > 0)
                    {
                        int written = send(sock, msg_buffer + (len - to_write), to_write, 0);
                        if ( written < 0 ) {
                            //close socket on error
                            LOGE("Error occurred during sending, errno %d", errno);
                            written = 0;
                            to_write = 0;
                            len  = 0;
                            break;
                        }

                        to_write -= written;
                    }
            }
        } while (len > 0);

        shutdown(sock, 0);
        close(sock);
    }
}

void wifi_init_softap( const char * _ssid,  const char * _pwd)
{
    LOGI("WIFI AP init");
    esp_netif_create_default_wifi_ap();
    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT(); //load wifi default config
    ESP_ERROR_CHECK(esp_wifi_init(&cfg));
    ESP_ERROR_CHECK(esp_event_handler_register(WIFI_EVENT, ESP_EVENT_ANY_ID,
                                               &wifi_event_handler, NULL));
    LOGI("registed wifi events");

    uint8_t mac[6]; //mac is 6 bytes long
    ESP_ERROR_CHECK(esp_efuse_mac_get_default(mac));
    LOGV("efuse MAC: "MACSTR, MAC2STR(mac));

    wifi_config_t wifi_config = {
                                 .ap = {
                                        .ssid_len = strlen(_ssid),
                                        .max_connection = 3,
                                        .authmode = WIFI_AUTH_WPA_WPA2_PSK
                                        },
    };

    strcpy((char *)wifi_config.ap.ssid, _ssid);
    strcpy((char *)wifi_config.ap.password, _pwd);

    ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_AP));
    ESP_ERROR_CHECK(esp_wifi_set_config(ESP_IF_WIFI_AP, &wifi_config));
    ESP_ERROR_CHECK(esp_wifi_start());

    LOGI("wifi_init_softap finished. SSID:%s pass:%s", _ssid, _pwd);
}

static void wifi_event_handler(void* arg,
                               esp_event_base_t event_base,
                               int32_t event_id,
                               void* event_data)
{
    switch(event_id)
        {
        case WIFI_EVENT_AP_STACONNECTED:
            LOGI("station "MACSTR" join, AID=%d",\
                 MAC2STR(((wifi_event_ap_staconnected_t*)event_data)->mac),  \
                 ((wifi_event_ap_staconnected_t*)event_data)->aid);
            break;
        case WIFI_EVENT_AP_STADISCONNECTED:
            LOGI("station "MACSTR" leave, AID=%d",\
                 MAC2STR(((wifi_event_ap_stadisconnected_t*)event_data)->mac), \
                 ((wifi_event_ap_stadisconnected_t*)event_data)->aid);
            break;
        case WIFI_EVENT_AP_START:
            LOGI("wifi ap started");
            break;
        case WIFI_EVENT_AP_STOP:
            LOGV("wifi ap stoppped");
            break;
        case WIFI_EVENT_AP_PROBEREQRECVED:
            LOGV("WIFI_EVENT_AP_PROBEREQRECVED");
            break;
        default:
            LOGE("unhandled wifi event: %d",event_id);
        }
}
/*---EOF-----------------------------------------------------------------------*/
