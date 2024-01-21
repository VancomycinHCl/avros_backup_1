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
	.section	.bss.i,"aw",@nobits
	.type	i, @object
	.size	i, 2
i:
	.zero	2
	.section	.text.timer_init,"ax",@progbits
.global	timer_init
	.type	timer_init, @function
timer_init:
.LFB12:
	.file 1 ".././main.c"
	.loc 1 18 0
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
	.loc 1 20 0
	ldi r24,lo8(-127)
	ldi r25,0
	ldi r18,lo8(-127)
	ldi r19,0
	movw r30,r18
	ld r18,Z
	ori r18,lo8(8)
	movw r30,r24
	st Z,r18
	.loc 1 22 0
	ldi r24,lo8(-120)
	ldi r25,0
	.loc 1 22 0
	ldi r18,lo8(26)
	ldi r19,lo8(6)
	movw r30,r24
	std Z+1,r19
	st Z,r18
	.loc 1 24 0
	ldi r24,lo8(-127)
	ldi r25,0
	ldi r18,lo8(-127)
	ldi r19,0
	movw r30,r18
	ld r18,Z
	ori r18,lo8(4)
	movw r30,r24
	st Z,r18
	.loc 1 26 0
	ldi r24,lo8(111)
	ldi r25,0
	ldi r18,lo8(111)
	ldi r19,0
	movw r30,r18
	ld r18,Z
	ori r18,lo8(2)
	movw r30,r24
	st Z,r18
	.loc 1 28 0
/* #APP */
 ;  28 ".././main.c" 1
	sei
 ;  0 "" 2
	.loc 1 29 0
/* #NOAPP */
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
	.loc 1 34 0
	.cfi_startproc
/* prologue: naked */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 35 0
/* #APP */
 ;  35 ".././main.c" 1
	rjmp switch_threads

 ;  0 "" 2
	.loc 1 36 0
/* #NOAPP */
	nop
/* epilogue start */
	.cfi_endproc
.LFE13:
	.size	__vector_17, .-__vector_17
	.section	.text.thread0,"ax",@progbits
.global	thread0
	.type	thread0, @function
thread0:
.LFB14:
	.loc 1 41 0
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
.L4:
	.loc 1 44 0 discriminator 1
	ldi r24,lo8(37)
	ldi r25,0
	movw r30,r24
	ld r24,Z
	ldi r24,lo8(37)
	ldi r25,0
	ldi r18,lo8(-1)
	movw r30,r24
	st Z,r18
	.loc 1 45 0 discriminator 1
	rjmp .L4
	.cfi_endproc
.LFE14:
	.size	thread0, .-thread0
	.section	.text.thread1,"ax",@progbits
.global	thread1
	.type	thread1, @function
thread1:
.LFB15:
	.loc 1 49 0
	.cfi_startproc
	push r28
.LCFI6:
	.cfi_def_cfa_offset 4
	.cfi_offset 28, -3
	push r29
.LCFI7:
	.cfi_def_cfa_offset 5
	.cfi_offset 29, -4
	in r28,__SP_L__
	in r29,__SP_H__
.LCFI8:
	.cfi_def_cfa_register 28
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
.L6:
	.loc 1 53 0 discriminator 1
	ldi r24,lo8(37)
	ldi r25,0
	movw r30,r24
	ld r24,Z
	ldi r24,lo8(37)
	ldi r25,0
	movw r30,r24
	st Z,__zero_reg__
	.loc 1 54 0 discriminator 1
	rjmp .L6
	.cfi_endproc
.LFE15:
	.size	thread1, .-thread1
	.section	.text.main,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB16:
	.loc 1 59 0
	.cfi_startproc
	push r28
.LCFI9:
	.cfi_def_cfa_offset 4
	.cfi_offset 28, -3
	push r29
.LCFI10:
	.cfi_def_cfa_offset 5
	.cfi_offset 29, -4
	in r28,__SP_L__
	in r29,__SP_H__
.LCFI11:
	.cfi_def_cfa_register 28
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	.loc 1 62 0
	call timer_init
	.loc 1 63 0
	ldi r24,lo8(36)
	ldi r25,0
	ldi r18,lo8(36)
	ldi r19,0
	movw r30,r18
	ld r18,Z
	ori r18,lo8(-128)
	movw r30,r24
	st Z,r18
	.loc 1 64 0
	ldi r24,lo8(33)
	ldi r25,0
	ldi r18,lo8(33)
	ldi r19,0
	movw r30,r18
	ld r18,Z
	ori r18,lo8(2)
	movw r30,r24
	st Z,r18
	.loc 1 65 0
	ldi r24,lo8(37)
	ldi r25,0
	movw r30,r24
	ld r24,Z
	ldi r24,lo8(37)
	ldi r25,0
	ldi r18,lo8(-1)
	movw r30,r24
	st Z,r18
	.loc 1 66 0
	ldi r24,lo8(34)
	ldi r25,0
	movw r30,r24
	ld r24,Z
	ldi r24,lo8(34)
	ldi r25,0
	ldi r18,lo8(-1)
	movw r30,r24
	st Z,r18
	.loc 1 68 0
	ldi r20,lo8(gs(thread0))
	ldi r21,hi8(gs(thread0))
	ldi r22,lo8(thread_stack_0)
	ldi r23,hi8(thread_stack_0)
	ldi r24,lo8(threadList)
	ldi r25,hi8(threadList)
	call setup_threads
	.loc 1 69 0
	ldi r20,lo8(gs(thread1))
	ldi r21,hi8(gs(thread1))
	ldi r22,lo8(thread_stack_1)
	ldi r23,hi8(thread_stack_1)
	ldi r24,lo8(threadList+4)
	ldi r25,hi8(threadList+4)
	call setup_threads
	.loc 1 70 0
	call startup_thread
.L8:
	.loc 1 75 0 discriminator 1
	rjmp .L8
	.cfi_endproc
.LFE16:
	.size	main, .-main
	.text
.Letext0:
	.file 2 "d:\\program files\\atstudio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\stdint.h"
	.file 3 ".././thread.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x199
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF22
	.byte	0xc
	.long	.LASF23
	.long	.LASF24
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
	.byte	0x4
	.byte	0x3
	.byte	0x12
	.long	0x9c
	.uleb128 0x6
	.long	.LASF9
	.byte	0x3
	.byte	0x13
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF10
	.byte	0x3
	.byte	0x14
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0
	.uleb128 0x7
	.byte	0x2
	.long	0x30
	.uleb128 0x8
	.string	"TCB"
	.byte	0x3
	.byte	0x15
	.long	0x77
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF11
	.uleb128 0x9
	.byte	0x1
	.long	.LASF12
	.byte	0x1
	.byte	0x12
	.long	.LFB12
	.long	.LFE12
	.long	.LLST0
	.byte	0x1
	.uleb128 0xa
	.byte	0x1
	.long	.LASF15
	.byte	0x1
	.byte	0x21
	.byte	0x1
	.long	.LFB13
	.long	.LFE13
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.byte	0x1
	.uleb128 0x9
	.byte	0x1
	.long	.LASF13
	.byte	0x1
	.byte	0x28
	.long	.LFB14
	.long	.LFE14
	.long	.LLST1
	.byte	0x1
	.uleb128 0x9
	.byte	0x1
	.long	.LASF14
	.byte	0x1
	.byte	0x30
	.long	.LFB15
	.long	.LFE15
	.long	.LLST2
	.byte	0x1
	.uleb128 0xb
	.byte	0x1
	.long	.LASF16
	.byte	0x1
	.byte	0x3b
	.long	0x42
	.long	.LFB16
	.long	.LFE16
	.long	.LLST3
	.byte	0x1
	.uleb128 0xc
	.string	"i"
	.byte	0x1
	.byte	0xf
	.long	0x42
	.byte	0x5
	.byte	0x3
	.long	i
	.uleb128 0xd
	.long	0xa2
	.long	0x141
	.uleb128 0xe
	.long	0x141
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF17
	.uleb128 0xf
	.long	.LASF18
	.byte	0x3
	.byte	0x3a
	.long	0x131
	.byte	0x1
	.byte	0x1
	.uleb128 0xd
	.long	0x30
	.long	0x166
	.uleb128 0x10
	.long	0x141
	.word	0x1ff
	.byte	0
	.uleb128 0x11
	.long	.LASF19
	.byte	0x3
	.byte	0x3d
	.long	0x155
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	thread_stack_0
	.uleb128 0x11
	.long	.LASF20
	.byte	0x3
	.byte	0x3e
	.long	0x155
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	thread_stack_1
	.uleb128 0x11
	.long	.LASF21
	.byte	0x3
	.byte	0x3f
	.long	0x155
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x11
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
.LLST2:
	.long	.LFB15
	.long	.LCFI6
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI6
	.long	.LCFI7
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI7
	.long	.LCFI8
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI8
	.long	.LFE15
	.word	0x2
	.byte	0x8c
	.sleb128 5
	.long	0
	.long	0
.LLST3:
	.long	.LFB16
	.long	.LCFI9
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI9
	.long	.LCFI10
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI10
	.long	.LCFI11
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI11
	.long	.LFE16
	.word	0x2
	.byte	0x8c
	.sleb128 5
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x3c
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
	.long	.LFB15
	.long	.LFE15-.LFB15
	.long	.LFB16
	.long	.LFE16-.LFB16
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
	.long	.LFB15
	.long	.LFE15
	.long	.LFB16
	.long	.LFE16
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF23:
	.string	".././main.c"
.LASF18:
	.string	"threadList"
.LASF13:
	.string	"thread0"
.LASF14:
	.string	"thread1"
.LASF15:
	.string	"__vector_17"
.LASF12:
	.string	"timer_init"
.LASF1:
	.string	"unsigned char"
.LASF6:
	.string	"long unsigned int"
.LASF10:
	.string	"stack_bottom_Pointer"
.LASF19:
	.string	"thread_stack_0"
.LASF21:
	.string	"thread_stack_2"
.LASF16:
	.string	"main"
.LASF20:
	.string	"thread_stack_1"
.LASF4:
	.string	"unsigned int"
.LASF24:
	.string	"C:\\\\Users\\\\Adin\\\\Documents\\\\Atmel Studio\\\\7.0\\\\2024_avros_ver0\\\\2024_avros_ver0\\\\Release"
.LASF8:
	.string	"long long unsigned int"
.LASF2:
	.string	"uint8_t"
.LASF9:
	.string	"stackPointer"
.LASF17:
	.string	"sizetype"
.LASF7:
	.string	"long long int"
.LASF11:
	.string	"char"
.LASF22:
	.string	"GNU C99 5.4.0 -mn-flash=4 -mno-skip-bug -mrelax -mmcu=avr6 -g2 -O0 -std=gnu99 -funsigned-char -funsigned-bitfields -ffunction-sections -fdata-sections -fpack-struct -fshort-enums"
.LASF3:
	.string	"uint16_t"
.LASF5:
	.string	"long int"
.LASF0:
	.string	"signed char"
	.ident	"GCC: (AVR_8_bit_GNU_Toolchain_3.6.2_1778) 5.4.0"
.global __do_clear_bss
