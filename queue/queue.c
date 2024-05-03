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

// 这个函数应该在临界区内被执行
// 这个函数如果面对的是FIFO队列，那么就是先进先出，如果面对的是LIFO，那就是先进后出
// 在Lifo的状态下，如果要压栈且压到限制的时候，会强制栈顶指针指向数组最后一个没有越界的地址
int queue_push(queue* this_ptr, const void* data_in_ptr)
{
    if(this_ptr->queue_is_FIFO_bool)
    {
        if (!QUEUE_IS_FULL(this_ptr))
        {
            this_ptr->queue_used_cnt++;
            memcpy(this_ptr->queue_tail_ptr, data_in_ptr, this_ptr->queue_element_size);
            if (this_ptr->queue_tail_ptr + this_ptr->queue_element_size >= GET_QUEUE_ARRAY_END_PTR(this_ptr))
                this_ptr->queue_tail_ptr = this_ptr->queue_array;
            else
                this_ptr->queue_tail_ptr = this_ptr->queue_tail_ptr+this_ptr->queue_element_size;
        }
        else
            return -1;
    }

    else
    {
        if (!QUEUE_IS_FULL(this_ptr))
        {
            this_ptr->queue_used_cnt++;
            memcpy(this_ptr->queue_tail_ptr, data_in_ptr, this_ptr->queue_element_size);
            if (this_ptr->queue_tail_ptr + this_ptr->queue_element_size >= GET_QUEUE_ARRAY_END_PTR(this_ptr))
                this_ptr->queue_tail_ptr = GET_QUEUE_ARRAY_END_PTR(this_ptr);
            else
                this_ptr->queue_tail_ptr = this_ptr->queue_tail_ptr+this_ptr->queue_element_size;
        }
        else
            return -1;
    }
}

