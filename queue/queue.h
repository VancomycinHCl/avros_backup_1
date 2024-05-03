/**
* @file        queue.h
* @brief		FIFO array definition
* @details	    NULL
* @author		Xuanzhi Liu
* @date		2024/04/03 00:12:49
* @version	    v1.0
*/


#ifndef QUEUE_H_
#define QUEUE_H_



#include "thread.h"
#include "memory.h"
#include "list.h"
#include "avros.h"


// kjhgjkghjkhgjh
typedef LIST LIST_THREAD;


typedef struct
{
    uint8_t*            queue_array;                 //< actual fifo array in memory
    uint16_t            queue_depth;                 //< depth in fifo element
    uint8_t             queue_element_size;          //< size of each elements in the queue
    uint16_t            queue_used_cnt;              //< how many elements in the current FIFO
    uint8_t*            queue_head_ptr;              //< head element ptr in fifo memory
    uint8_t*            queue_tail_ptr;              //< next free element block ptr in fifo memory
    bool                queue_is_FIFO_bool;          //< determine FIFO or LIFO
    LIST_THREAD*        queue_tx_threads_list;       //< TX thread linklist
    LIST_THREAD*        queue_rx_threads_list;       //< RX thread linklist
}queue;


#define QUEUE_IS_FULL(THIS_PTR) ( ((THIS_PTR)->queue_used_cnt) >= ((THIS_PTR)->queue_depth) )
#define GET_QUEUE_ARRAY_END_PTR(THIS_PTR) ( (((THIS_PTR)->queue_array) + ((THIS_PTR)->queue_element_size * (THIS_PTR)->queue_element_size)) - 1 )

// adsfasdfasdf
/**																	
    * @brief		Construct a queue instance
    * @details	    A queue will be constructed in the heap memory. 
    *               Besides prerequesties will be filled in the struct, include queue depth, element size in Bytes
    * @param[in]	queue_depth         Depth of queue.
    * @param[in]	queue_element_size  Size of elements in the queue
    * @param[in]	queue_is_FIFO_bool  Determine the queue is FIFO or LIFO
    * @return 		Ptr of a queue
    * @retval		!NULL		CONSTRUCTION SUCCEEDED
    * @retval		NULL	    CONSTRUCTION FAILED
    * @par Changed log
    * 		Build at 2024/04/03
*/
queue* queue_init(const uint16_t queue_depth, const uint8_t queue_element_size, const bool queue_is_FIFO_bool);\

int queue_push(queue* this_ptr, const void* data_in_ptr);

BASE_RET queue_deinit();





#endif /* QUEUE_H_ */