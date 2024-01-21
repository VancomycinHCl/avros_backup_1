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

//typedef struct {
	//uint8_t* stackPointer; // 指向线程栈顶的指针
	//uint8_t* stack_bottom_Pointer; // 指向线程栈底的指针 （留着备用）
//} TCB;

typedef enum {
	TCB_STATUS_RUN,
	TCB_STATUS_REDAY,
	TCB_STATUS_BLOCK,
	TCB_STATUS_SUSPENED,
	TCB_STATUS_END
} TCB_STATUS;

typedef struct {
	uint8_t*	 tcb_stackPointer;			// 指向线程栈顶的指针
	uint8_t*	 tcb_stack_bottom_Pointer;	// 指向线程栈底的指针 （留着备用）
	uint8_t		 tcb_pid;					// 线程PID
	TCB_STATUS   tcb_status;				// 线程状态（就绪、运行、delay挂起、IO阻塞、空）
	// uint16_t	 tcb_stack_usage;			// 栈空间使用情况，防止爆栈
	uint16_t     tcb_delay_cyc_cnt;
} TCB;

#define MAX_THREADS 2
#define THREAD_TIME_INTERVAL_1MS 1


#ifdef THREAD_TIME_INTERVAL_1MS
#define THREAD_TIME_INTERVAL_MS 1
#define  THREAD_TIMER_TRIG_REG OCR1A 
#define THREAD_TIMER_TRIG_CNT 2499
#define  THREAD_TIMER_CNT_REG TCNT1
#define  THREAD_YIELD() THREAD_TIMER_CNT_REG=THREAD_TIMER_TRIG_CNT-10
#endif // end THREAD_TIME_INTERVAL_1MS




#define THREAD_SCHEDULING_ROUND_ROBIN 1
#define THREAD_SCHEDULING_PRIORITY    0

#define STACK_BOTTOM(STACK_PTR) STACK_PTR-STACK_SIZE 
#define STACK_INIT_DATA 0x83

extern int currentThread;
extern TCB threadList[MAX_THREADS]; // 线程列表

#define STACK_SIZE 512
uint8_t thread_stack_0[STACK_SIZE];
uint8_t thread_stack_1[STACK_SIZE];
uint8_t thread_stack_2[STACK_SIZE];


void setup_threads(TCB* tcb_ptr, uint8_t* stack_bottom_ptr,void* thread_fuction,int thread_pid);
extern void startup_thread(void);
// extern void switch_thread_new(void);
extern void scheduling_thread(void);
extern void delay_us(uint16_t delay_interval_us);
extern void delay_us_atom(uint16_t delay_interval_us);
void delay_thread_ms(int delay_interval_ms);

#endif /* THREAD_H_ */