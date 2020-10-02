#ifndef __DEBUG_H__
#define __DEBUG_H__

/**
Copyright (c) 2020 Lucas Martins Mendes.
   All rights reserved.

   Redistribution and use in source and binary forms are permitted
   provided that the above copyright notice and this paragraph are
   duplicated in all such forms and that any documentation,
   advertising materials, and other materials related to such
   distribution and use acknowledge that the software was developed
   by the Lucas M.. The name of the
   Lucas M. may not be used to endorse or promote products derived
   from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
   IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
   WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

   @file debug.h
   @author Lucas Martins Mendes
   @brief debug macros
   @date 2018

 */

/*----- Token Manipulation macros -----*/
#define _TOKENPASTE(a,b,c) a ## b ## c
#define TOKENPASTE(a,b,c) _TOKENPASTE(a,b,c)

#define _STR(x) #x
#define STR(x) _STR(x)

#define DEBUG_OUTPUT_F printf
#define DEBUG_OUTPUT printf



#if !((defined DEBUG_OUTPUT_F) && (defined DEBUG_OUTPUT))
#error "please define a output method"
#endif

#define VAR_DUMP(var,fmt)                       \
	LOGD(#var": "fmt,var);

#define DEBUG(msg)                              \
	DEBUG_OUTPUT(msg)

#define DEBUGF(msg,...)               \
	DEBUG_OUTPUT_F(msg, __VA_ARGS__ );	\
	DEBUG_OUTPUT("\n")

#ifdef ESP_IDF

#define LOGE(...) ESP_LOGE(TAG, __VA_ARGS__)
#define LOGW(...) ESP_LOGW(TAG, __VA_ARGS__)
#define LOGI(...) ESP_LOGI(TAG, __VA_ARGS__)
#define LOGV(...) ESP_LOGV(TAG, __VA_ARGS__)
#define LOGD(...) ESP_LOGD(TAG, __VA_ARGS__)

#define ASSERT(msg,cond)                            \
  if(!(cond)) {}                                    \
  else                                              \
    {                                               \
      LOGW(msg " : at  " STR(__LINE__));            \
    }

#define ASSERT_A(cond)                            \
    if(!(cond)) {}                                \
  else                                            \
  {                                               \
        LOGW(STR(cond) " : at  " STR(__LINE__));  \
    }

#define ASSERT_ERROR(msg,cond,do_err)                                 \
  if(!(cond)) {}                                                      \
  else                                                                \
    {                                                                 \
      LOGE(msg " : at " STR(__LINE__));                               \
      do_err;                                                         \
    }

#define ASSERT_ERROR_A(cond,do_err)          \
  if(!(cond)) {}                                \
  else                                          \
    {                                           \
      LOGE(STR(cond) " : at " STR(__LINE__));       \
      do_err;                                   \
    }

#else

#define ASSERT(msg,cond)                                              \
  if(!(cond)) {}                                                      \
  else                                                                \
   {                                                                 \
      DEBUG_OUTPUT(msg " at " STR(__LINE__)); \
    }

#define ASSERT_ERROR(msg,cond,do_err)                                  \
  if(!(cond)) {}                                                       \
  else                                                                 \
    {                                                                  \
      DEBUG_OUTPUT(msg " at " STR(__LINE__));  \
      do_err;                                                          \
    }

#endif /* ESP_IDF */
#endif /* __DEBUG_H__*/
