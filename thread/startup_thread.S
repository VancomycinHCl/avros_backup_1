
/*
 * startup_thread.S
 *
 * Created: 19/01/2024 16.57.58
 *  Author: Adin
 */ 


.section .text
.global startup_thread

.extern currentThread
.extern threadList

.equ SPH,0x3E
.equ SPL,0x3D
.equ MAX_THREADS,2
.equ SREG,0x3F
.equ TLB_SIZE,0x04

startup_thread:
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
	sei;    恢复中断使能
    ; ... 恢复其他寄存器 ...
    ret