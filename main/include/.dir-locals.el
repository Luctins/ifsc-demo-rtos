((c-mode . ((eval . (setq flycheck-clang-include-path (list
                                                    "/home/luctins/repo/macnica/celesc_identificador/sw/esp32/wifi_connector/main/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/newlib/platform_include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/freertos/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/freertos/xtensa/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/heap/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/log/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/lwip/include/apps/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/lwip/include/apps/sntp/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/lwip/lwip/src/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/lwip/port/esp32/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/lwip/port/esp32/include/arch/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/soc/src/esp32/./"
                                                    "/home/luctins/repo/macnica/esp-idf/components/soc/src/esp32/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/soc/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/esp_rom/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/esp_common/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/esp_system/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/xtensa/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/xtensa/esp32/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/esp32/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/driver/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/driver/esp32/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/esp_ringbuf/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/efuse/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/efuse/esp32/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/espcoredump/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/esp_timer/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/soc/soc/esp32/./"
                                                    "/home/luctins/repo/macnica/esp-idf/components/soc/soc/esp32/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/soc/soc/esp32/../include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/vfs/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/esp_wifi/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/esp_wifi/esp32/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/esp_event/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/esp_netif/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/esp_eth/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/tcpip_adapter/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/app_trace/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/mbedtls/port/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/mbedtls/mbedtls/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/mbedtls/esp_crt_bundle/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/bootloader_support/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/app_update/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/spi_flash/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/wpa_supplicant/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/wpa_supplicant/port/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/wpa_supplicant/include/esp_supplicant/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/nvs_flash/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/pthread/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/perfmon/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/asio/asio/asio/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/asio/port/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/cbor/port/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/coap/port/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/coap/port/include/coap/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/coap/libcoap/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/coap/libcoap/include/coap2/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/console/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/nghttp/port/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/nghttp/nghttp2/lib/includes/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/esp-tls/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/esp_adc_cal/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/esp_gdbstub/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/tcp_transport/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/esp_http_client/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/esp_http_server/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/esp_https_ota/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/protobuf-c/protobuf-c/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/protocomm/include/common/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/protocomm/include/security/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/protocomm/include/transports/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/mdns/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/esp_local_ctrl/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/sdmmc/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/esp_serial_slave_link/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/esp_websocket_client/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/expat/expat/expat/lib/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/expat/port/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/wear_levelling/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/fatfs/diskio/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/fatfs/vfs/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/fatfs/src/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/freemodbus/common/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/idf_test/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/idf_test/include/esp32/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/jsmn/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/json/cJSON/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/libsodium/libsodium/src/libsodium/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/libsodium/port_include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/mqtt/esp-mqtt/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/openssl/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/spiffs/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/ulp/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/unity/include/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/unity/unity/src/"
                                                    "/home/luctins/repo/macnica/esp-idf/components/wifi_provisioning/include/")))
            (eval . (setq company-clang-arguments (list
                                        "-I/home/luctins/repo/macnica/celesc_identificador/sw/esp32/wifi_connector/main/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/newlib/platform_include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/freertos/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/freertos/xtensa/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/heap/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/log/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/lwip/include/apps/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/lwip/include/apps/sntp/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/lwip/lwip/src/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/lwip/port/esp32/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/lwip/port/esp32/include/arch/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/soc/src/esp32/./"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/soc/src/esp32/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/soc/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/esp_rom/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/esp_common/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/esp_system/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/xtensa/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/xtensa/esp32/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/esp32/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/driver/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/driver/esp32/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/esp_ringbuf/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/efuse/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/efuse/esp32/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/espcoredump/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/esp_timer/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/soc/soc/esp32/./"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/soc/soc/esp32/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/soc/soc/esp32/../include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/vfs/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/esp_wifi/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/esp_wifi/esp32/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/esp_event/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/esp_netif/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/esp_eth/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/tcpip_adapter/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/app_trace/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/mbedtls/port/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/mbedtls/mbedtls/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/mbedtls/esp_crt_bundle/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/bootloader_support/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/app_update/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/spi_flash/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/wpa_supplicant/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/wpa_supplicant/port/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/wpa_supplicant/include/esp_supplicant/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/nvs_flash/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/pthread/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/perfmon/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/asio/asio/asio/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/asio/port/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/cbor/port/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/coap/port/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/coap/port/include/coap/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/coap/libcoap/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/coap/libcoap/include/coap2/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/console/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/nghttp/port/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/nghttp/nghttp2/lib/includes/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/esp-tls/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/esp_adc_cal/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/esp_gdbstub/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/tcp_transport/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/esp_http_client/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/esp_http_server/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/esp_https_ota/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/protobuf-c/protobuf-c/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/protocomm/include/common/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/protocomm/include/security/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/protocomm/include/transports/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/mdns/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/esp_local_ctrl/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/sdmmc/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/esp_serial_slave_link/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/esp_websocket_client/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/expat/expat/expat/lib/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/expat/port/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/wear_levelling/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/fatfs/diskio/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/fatfs/vfs/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/fatfs/src/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/freemodbus/common/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/idf_test/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/idf_test/include/esp32/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/jsmn/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/json/cJSON/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/libsodium/libsodium/src/libsodium/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/libsodium/port_include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/mqtt/esp-mqtt/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/openssl/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/spiffs/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/ulp/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/unity/include/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/unity/unity/src/"
                                        "-I/home/luctins/repo/macnica/esp-idf/components/wifi_provisioning/include/" ))))))