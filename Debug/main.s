	.file	"main.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.comm	thread_stack_0,512,1
	.comm	thread_stack_1,512,1
	.comm	thread_stack_2,512,1
	.section	.text.timer_init,"ax",@progbits
.global	timer_init
	.type	timer_init, @function
timer_init:
.LFB12:
	.file 1 ".././main.c"
	.loc 1 19 0
	.cfi_startproc
	push r28
.LCFI0:
	.cfi_def_cfa_offset 4
	.cfi_offset 28, -3
	push r29
.LCFI1:
	.cfi_def_cfa_offset 5
	.cfi_offset 29, -4
	in r28,__SP_L__
	in r29,__SP_H__
.LCFI2:
	.cfi_def_cfa_register 28
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	.loc 1 21 0
	ldi r24,lo8(-127)
	ldi r25,0
	ldi r18,lo8(-127)
	ldi r19,0
	movw r30,r18
	ld r18,Z
	ori r18,lo8(8)
	movw r30,r24
	st Z,r18
	.loc 1 23 0
	ldi r24,lo8(-120)
	ldi r25,0
	.loc 1 23 0
	ldi r18,lo8(16)
	ldi r19,lo8(122)
	movw r30,r24
	std Z+1,r19
	st Z,r18
	.loc 1 25 0
	ldi r24,lo8(-127)
	ldi r25,0
	ldi r18,lo8(-127)
	ldi r19,0
	movw r30,r18
	ld r18,Z
	ori r18,lo8(4)
	movw r30,r24
	st Z,r18
	.loc 1 27 0
	ldi r24,lo8(111)
	ldi r25,0
	ldi r18,lo8(111)
	ldi r19,0
	movw r30,r18
	ld r18,Z
	ori r18,lo8(2)
	movw r30,r24
	st Z,r18
	.loc 1 30 0
	nop
/* epilogue start */
	pop r29
	pop r28
	ret
	.cfi_endproc
.LFE12:
	.size	timer_init, .-timer_init
	.section	.text.__vector_17,"ax",@progbits
.global	__vector_17
	.type	__vector_17, @function
__vector_17:
.LFB13:
	.loc 1 35 0
	.cfi_startproc
/* prologue: naked */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 36 0
/* #APP */
 ;  36 ".././main.c" 1
	rjmp switch_threads

 ;  0 "" 2
	.loc 1 37 0
/* #NOAPP */
	nop
/* epilogue start */
	.cfi_endproc
.LFE13:
	.size	__vector_17, .-__vector_17
	.section	.text.main,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB14:
	.loc 1 42 0
	.cfi_startproc
	push r28
.LCFI3:
	.cfi_def_cfa_offset 4
	.cfi_offset 28, -3
	push r29
.LCFI4:
	.cfi_def_cfa_offset 5
	.cfi_offset 29, -4
	in r28,__SP_L__
	in r29,__SP_H__
.LCFI5:
	.cfi_def_cfa_register 28
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	.loc 1 44 0
	call timer_init
	.loc 1 45 0
	ldi r24,lo8(36)
	ldi r25,0
	ldi r18,lo8(36)
	ldi r19,0
	movw r30,r18
	ld r18,Z
	ori r18,lo8(-128)
	movw r30,r24
	st Z,r18
	.loc 1 46 0
	ldi r24,lo8(33)
	ldi r25,0
	ldi r18,lo8(33)
	ldi r19,0
	movw r30,r18
	ld r18,Z
	ori r18,lo8(2)
	movw r30,r24
	st Z,r18
	.loc 1 47 0
	ldi r24,lo8(37)
	ldi r25,0
	movw r30,r24
	ld r24,Z
	ldi r24,lo8(37)
	ldi r25,0
	ldi r18,lo8(-1)
	movw r30,r24
	st Z,r18
	.loc 1 48 0
	ldi r24,lo8(34)
	ldi r25,0
	movw r30,r24
	ld r24,Z
	ldi r24,lo8(34)
	ldi r25,0
	ldi r18,lo8(-1)
	movw r30,r24
	st Z,r18
	.loc 1 50 0
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(gs(thread0_main))
	ldi r21,hi8(gs(thread0_main))
	ldi r22,lo8(thread_stack_0)
	ldi r23,hi8(thread_stack_0)
	ldi r24,lo8(threadList)
	ldi r25,hi8(threadList)
	call setup_threads
	.loc 1 51 0
	ldi r18,lo8(1)
	ldi r19,0
	ldi r20,lo8(gs(thread1_main))
	ldi r21,hi8(gs(thread1_main))
	ldi r22,lo8(thread_stack_1)
	ldi r23,hi8(thread_stack_1)
	ldi r24,lo8(threadList+8)
	ldi r25,hi8(threadList+8)
	call setup_threads
	.loc 1 52 0
	call startup_thread
.L4:
	.loc 1 57 0 discriminator 1
	rjmp .L4
	.cfi_endproc
.LFE14:
	.size	main, .-main
	.text
.Letext0:
	.file 2 "d:\\program files\\atstudio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\stdint.h"
	.file 3 "../././thread/thread.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1c0
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF28
	.byte	0xc
	.long	.LASF29
	.long	.LASF30
	.long	.Ldebug_ranges0+0
	.long	0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x2
	.byte	0x7e
	.long	0x3b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF3
	.byte	0x2
	.byte	0x80
	.long	0x54
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF5
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0x5
	.byte	0x1
	.long	0x3b
	.byte	0x3
	.byte	0x17
	.long	0xa2
	.uleb128 0x6
	.long	.LASF9
	.byte	0
	.uleb128 0x6
	.long	.LASF10
	.byte	0x1
	.uleb128 0x6
	.long	.LASF11
	.byte	0x2
	.uleb128 0x6
	.long	.LASF12
	.byte	0x3
	.uleb128 0x6
	.long	.LASF13
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.long	.LASF14
	.byte	0x3
	.byte	0x1d
	.long	0x77
	.uleb128 0x7
	.byte	0x8
	.byte	0x3
	.byte	0x1f
	.long	0xfc
	.uleb128 0x8
	.long	.LASF15
	.byte	0x3
	.byte	0x20
	.long	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.long	.LASF16
	.byte	0x3
	.byte	0x21
	.long	0xfc
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x8
	.long	.LASF17
	.byte	0x3
	.byte	0x22
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.long	.LASF18
	.byte	0x3
	.byte	0x23
	.long	0xa2
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x8
	.long	.LASF19
	.byte	0x3
	.byte	0x25
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.byte	0
	.uleb128 0x9
	.byte	0x2
	.long	0x30
	.uleb128 0xa
	.string	"TCB"
	.byte	0x3
	.byte	0x26
	.long	0xad
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF20
	.uleb128 0xb
	.byte	0x1
	.long	.LASF31
	.byte	0x1
	.byte	0x13
	.long	.LFB12
	.long	.LFE12
	.long	.LLST0
	.byte	0x1
	.uleb128 0xc
	.byte	0x1
	.long	.LASF21
	.byte	0x1
	.byte	0x22
	.byte	0x1
	.long	.LFB13
	.long	.LFE13
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.byte	0x1
	.uleb128 0xd
	.byte	0x1
	.long	.LASF22
	.byte	0x1
	.byte	0x2a
	.long	0x42
	.long	.LFB14
	.long	.LFE14
	.long	.LLST1
	.byte	0x1
	.uleb128 0xe
	.long	0x102
	.long	0x168
	.uleb128 0xf
	.long	0x168
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF23
	.uleb128 0x10
	.long	.LASF24
	.byte	0x3
	.byte	0x3e
	.long	0x158
	.byte	0x1
	.byte	0x1
	.uleb128 0xe
	.long	0x30
	.long	0x18d
	.uleb128 0x11
	.long	0x168
	.word	0x1ff
	.byte	0
	.uleb128 0x12
	.long	.LASF25
	.byte	0x3
	.byte	0x41
	.long	0x17c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	thread_stack_0
	.uleb128 0x12
	.long	.LASF26
	.byte	0x3
	.byte	0x42
	.long	0x17c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	thread_stack_1
	.uleb128 0x12
	.long	.LASF27
	.byte	0x3
	.byte	0x43
	.long	0x17c
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	thread_stack_2
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB12
	.long	.LCFI0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI0
	.long	.LCFI1
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI1
	.long	.LCFI2
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI2
	.long	.LFE12
	.word	0x2
	.byte	0x8c
	.sleb128 5
	.long	0
	.long	0
.LLST1:
	.long	.LFB14
	.long	.LCFI3
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI3
	.long	.LCFI4
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI4
	.long	.LCFI5
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI5
	.long	.LFE14
	.word	0x2
	.byte	0x8c
	.sleb128 5
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.LFB12
	.long	.LFE12-.LFB12
	.long	.LFB13
	.long	.LFE13-.LFB13
	.long	.LFB14
	.long	.LFE14-.LFB14
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LFB12
	.long	.LFE12
	.long	.LFB13
	.long	.LFE13
	.long	.LFB14
	.long	.LFE14
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF29:
	.string	".././main.c"
.LASF15:
	.string	"tcb_stackPointer"
.LASF11:
	.string	"TCB_STATUS_BLOCK"
.LASF24:
	.string	"threadList"
.LASF28:
	.string	"GNU C11 5.4.0 -mn-flash=4 -mno-skip-bug -mrelax -mmcu=avr6 -g2 -O0 -funsigned-char -funsigned-bitfields -ffunction-sections -fdata-sections -fpack-struct -fshort-enums"
.LASF16:
	.string	"tcb_stack_bottom_Pointer"
.LASF21:
	.string	"__vector_17"
.LASF31:
	.string	"timer_init"
.LASF1:
	.string	"unsigned char"
.LASF6:
	.string	"long unsigned int"
.LASF13:
	.string	"TCB_STATUS_END"
.LASF25:
	.string	"thread_stack_0"
.LASF27:
	.string	"thread_stack_2"
.LASF22:
	.string	"main"
.LASF26:
	.string	"thread_stack_1"
.LASF4:
	.string	"unsigned int"
.LASF8:
	.string	"long long unsigned int"
.LASF2:
	.string	"uint8_t"
.LASF18:
	.string	"tcb_status"
.LASF10:
	.string	"TCB_STATUS_REDAY"
.LASF23:
	.string	"sizetype"
.LASF9:
	.string	"TCB_STATUS_RUN"
.LASF7:
	.string	"long long int"
.LASF19:
	.string	"tcb_delay_cyc_cnt"
.LASF20:
	.string	"char"
.LASF14:
	.string	"TCB_STATUS"
.LASF30:
	.string	"C:\\\\Users\\\\Adin\\\\Documents\\\\Atmel Studio\\\\7.0\\\\2024_avros_ver0\\\\2024_avros_ver0\\\\Debug"
.LASF3:
	.string	"uint16_t"
.LASF17:
	.string	"tcb_pid"
.LASF5:
	.string	"long int"
.LASF0:
	.string	"signed char"
.LASF12:
	.string	"TCB_STATUS_SUSPENED"
	.ident	"GCC: (AVR_8_bit_GNU_Toolchain_3.6.2_1778) 5.4.0"
.global __do_clear_bss
