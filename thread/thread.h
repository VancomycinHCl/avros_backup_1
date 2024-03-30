/*
 * thread.h
 * Description: 线程的创建与调度，目前已经完成线程的切换，调度算法是顺序轮询
 * ToDo : 完成线程状态切换/优先级调度，状态切换以实现delay这样的挂起逻辑为主
 * Created: 11/01/2024 12.30.37
 *  Author: Adin
 */ 


#ifndef THREAD_H_
#define THREAD_H_

#include <stdint.h>
#include "avr/io.h"
#include <avr/interrupt.h>
#include <avr/delay.h>
#include <string.h>

//typedef struct {
	//uint8_t* stackPointer; // 指向线程栈顶的指针
	//uint8_t* stack_bottom_Pointer; // 指向线程栈底的指针 （留着备用）
//} TCB;

typedef enum 
{
	TCB_STATUS_RUN,							// 运行中的线程
	TCB_STATUS_REDAY,						// 就绪线程
	TCB_STATUS_BLOCK,						// IO、事件的阻塞
	TCB_STATUS_SUSPENED,					// delay等主动让渡的挂起
	TCB_STATUS_END							// 死亡（意味着可复用它的栈空间）
} TCB_STATUS;

typedef struct // 当前size 16字节
{
	uint8_t*	 tcb_stackPointer;			// 指向线程栈顶的指针
	uint8_t*	 tcb_stack_bottom_Pointer;	// 指向线程栈底的指针 （留着备用）
	uint8_t		 tcb_pid;					// 线程PID
	TCB_STATUS   tcb_status;				// 线程状态（就绪、在运行、delay挂起、IO阻塞、死亡）
	// uint16_t	 tcb_stack_usage;			// 栈空间使用情况，防止爆栈
	uint16_t     tcb_delay_cyc_cnt;			// 挂起tick计数，block（IO阻塞）状态下0xFFFF是永久等待
	uint8_t		 tcb_priority;				// 线程优先级，0-255
	char*		 tcb_name_ptr;				// 线程名字指针
	uint8_t		 tcb_reserved[5];			// 线程保留字段，用作填充或日后使用
} TCB;

#define MAX_THREADS 3
#define THREAD_TIME_INTERVAL_1MS 1
#define PERMNANT_BLOCKED_THREAD_CYC_CNT 0xFFFF 


#ifdef THREAD_TIME_INTERVAL_1MS
#define THREAD_TIME_INTERVAL_MS 1
#define  THREAD_TIMER_TRIG_REG OCR1A 
#define THREAD_TIMER_TRIG_CNT 2499 // 2499
#define  THREAD_TIMER_CNT_REG TCNT1
//#define  THREAD_YIELD() THREAD_TIMER_TRIG_REG = THREAD_TIMER_CNT_REG+50
#endif // end THREAD_TIME_INTERVAL_1MS



// define which schedulding strategy is configured
#define THREAD_SCHEDULING_ROUND_ROBIN 0
#define THREAD_SCHEDULING_PRIORITY    1

// define thread stack initiation info 
#define STACK_BOTTOM(STACK_PTR) STACK_PTR-STACK_SIZE 
#define STACK_INIT_DATA 0x83

// externed value, used for thread swap in both C code and AVR ASM code 
extern int currentThread;
extern TCB threadList[MAX_THREADS]; // 线程列表

// idle task(system task when free)
#define STACK_SIZE 			 512
#define IDLE_TASK_STACK_SIZE 64
#define IDLE_TASK_PID		 0x00
#define IDLE_TASK_PRIORITY   0x00

// Declare for user-defined stacks
extern uint8_t thread_stack_idle[IDLE_TASK_STACK_SIZE];
extern uint8_t thread_stack_0[STACK_SIZE];
extern uint8_t thread_stack_1[STACK_SIZE];
extern uint8_t thread_stack_2[STACK_SIZE];


void setup_threads(TCB* tcb_ptr, 
				   uint8_t* stack_bottom_ptr,
				   void* thread_function, 
				   int thread_pid, 
				   const uint8_t thread_priority, 
				   const char* thread_name_ptr);

extern void startup_thread(void);
// extern void switch_thread_new(void);
extern void scheduling_thread(void);
extern void delay_us(uint16_t delay_interval_us);
extern void delay_us_atom(uint16_t delay_interval_us);
void delay_thread_ms(int delay_interval_ms);

void thread_delay_cyc_cnt_dec(void);
void thread_idle(void);

// 在不禁用中断的情况下，禁用线程调度，保护现场
// need to complete
// void suspend_threads_all(void);
// void resume_threads_all(void);
// void panic();

#endif /* THREAD_H_ */