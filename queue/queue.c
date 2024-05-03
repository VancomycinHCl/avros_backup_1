/*
 * queue.c
 *
 * Created: 31/03/2024 17.35.13
 *  Author: Adin
 */ 


#include "queue.h"


queue* queue_init(const uint16_t queue_depth, const uint8_t queue_element_size, const bool queue_is_FIFO_bool)
{
    
    #if USING_HEAP_MEMORY == 1

    queue* return_queue_ptr = (queue*) malloc_memory( (size_t) sizeof(queue) );
    if (!return_queue_ptr)
        return NULL;
    
    uint8_t* queue_array = (uint8_t*) malloc_memory( (size_t) (queue_element_size*queue_depth) );
    if (!queue_array)
    {
        free_memory(return_queue_ptr);
        return_queue_ptr = NULL;
        return;
    }

    return_queue_ptr->queue_array           = queue_array;
    return_queue_ptr->queue_depth           = queue_depth;
    return_queue_ptr->queue_element_size    = queue_element_size;
    return_queue_ptr->queue_is_FIFO_bool    = queue_is_FIFO_bool;
    return_queue_ptr->queue_used_cnt        = 0;
    return_queue_ptr->queue_head_ptr        = (uint16_t*) queue_array;
    return_queue_ptr->queue_tail_ptr        = (uint16_t*) queue_array;
    return_queue_ptr->queue_rx_threads_list = (LIST_THREAD*) NULL;
    return_queue_ptr->queue_tx_threads_list = (LIST_THREAD*) NULL;

    return return_queue_ptr;

    #else
    #error "HEAP ALLOCATION UNIT IS MANDATORY IN THIS COMPILATION UNIT."
    #endif
}


int queue_push(queue* this_ptr, const void* data_in_ptr)
{
    if(this_ptr->queue_is_FIFO_bool)
    {
        if (!QUEUE_IS_FULL(this_ptr))
        {
            this_ptr->queue_used_cnt++;
            memcpy(this_ptr->queue_tail_ptr, data_in_ptr, this_ptr->queue_element_size);
            if (this_ptr->queue_tail_ptr + this_ptr->queue_element_size >= this_ptr->queue_array + this_ptr->queue_element_size * this_ptr->queue_element_size)
            {
                this_ptr->queue_tail_ptr = this_ptr->queue_array;
            }
            
        }
        else
            return -1;
        
    }
    else
    {

    }
}