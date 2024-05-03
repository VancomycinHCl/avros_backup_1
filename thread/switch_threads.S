
/*
 * switch_threads.S
 *
 * Created: 11/01/2024 17.20.46
 *  Author: Adin
 */ 




.section .text
.global switch_threads
.global save_prev_thread
.global restore_next_thread

.extern currentThread
.extern threadList
.extern scheduling_thread

.equ SPH,0x3E
.equ SPL,0x3D
.equ MAX_THREADS,2
.equ SREG,0x3F
.equ TLB_SIZE,0x10

switch_threads:
	rjmp save_prev_thread
save_prev_thread:
    ; 保存当前线程的栈指针
	cli
    push r0
    in r0, SREG
    push r0
    ; ... 保存其他寄存器 ...
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r18
	push r19
	push r20
	push r21
	push r22
	push r23
	push r24
	push r25
	push r26
	push r27
	push r28
	push r29
	push r30
	push r31

    ; 保存当前栈指针到 threadList[currentThread].stackPointer
	lds r16, currentThread   ; 加载 currentThread 的值到 r16
	ldi r17, TLB_SIZE		 ; 加载 TCB 的大小到 r17 (4 字节)
	mul r16, r17			 ; r0:r1 = r16 * r17 (结果在 r0:r1)
	in r18, SPL
	in r19, SPH
	ldi r30, lo8(threadList) ; 加载 threadList 的低位地址到 Z 寄存器 (r30)
	ldi r31, hi8(threadList) ; 加载 threadList 的高位地址到 Z 寄存器 (r31)
	add r30, r0				 ; 将乘法结果的低位加到 Z 寄存器的低位
	adc r31, r1				 ; 将乘法结果的高位加到 Z 寄存器的高位，考虑进位
	st Z+, r18
	st Z+, r19

	
	rcall scheduling_thread  ;

restore_next_thread:
    ; 恢复下一个线程的栈指针
	lds r16, currentThread       ; 加载 currentThread 的值到 r16
    ldi r17, TLB_SIZE            ; 加载 TCB 的大小到 r17 (4 字节)
    mul r16, r17                 ; r0:r1 = r16 * r17 (结果在 r0:r1)
    ldi r30, lo8(threadList)     ; 加载 threadList 的低位地址到 Z 寄存器 (r30)
    ldi r31, hi8(threadList)     ; 加载 threadList 的高位地址到 Z 寄存器 (r31)
    add r30, r0                  ; 将乘法结果的低位加到 Z 寄存器的低位
    adc r31, r1                  ; 将乘法结果的高位加到 Z 寄存器的高位，考虑进位
    clr r1                       ; 清除 r1，因为 mul 指令会使用到它
	ld  r16, Z+
	ld  r17, Z
    out SPL, r16
    out SPH, r17
	pop r31 
	pop r30 
	pop r29 
	pop r28 
	pop r27 
	pop r26 
	pop r25 
	pop r24 
	pop r23 
	pop r22 
	pop r21 
	pop r20 
	pop r19 
	pop r18 
	pop r17 
	pop r16 
	pop r15 
	pop r14 
	pop r13 
	pop r12 
	pop r11 
	pop r10 
	pop r9 
	pop r8 
	pop r7 
	pop r6 
	pop r5 
	pop r4 
	pop r3 
	pop r2 
	pop r1 
    ; ... 恢复其他寄存器 ...
    pop r0
    out SREG, r0
    pop r0
    ; ... 恢复其他寄存器 ...

	sei
	ret


/*
thread_scheduling:
    lds r16, currentThread
    inc r16
    cpi r16, MAX_THREADS
    brlo not_max
    clr r16
	sts currentThread, r16
	ret
not_max:
    sts currentThread, r16
	ret
*/