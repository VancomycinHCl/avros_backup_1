/**
* @file        avros.h
* @brief		This is a brief description.
* @details	    This is the detail description.
* @author		Xuanzhi Liu
* @date		2024/02/12 18:32:10
* @version	    v1.0
*/

#ifndef AVROS_H_
#define AVROS_H_



#include ".\user_func\user_func.h"
#include "stdbool.h"

#define USING_THREAD_SCHEDULDING 1
#define USING_HEAP_MEMORY        1


#if (USING_THREAD_SCHEDULDING != 0)
#include ".\thread\thread.h"
#endif

#if (USING_HEAP_MEMORY != 0)
#include ".\memory\memory.h"
#endif

#define BASE_RET uint8_t

#ifdef BASE_RET
#define RET_OK       0x00
#define RET_ERROR    0xFF
#endif

#endif
