	.file	"thread.c"
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
	.section	.text.setup_threads,"ax",@progbits
.global	setup_threads
	.type	setup_threads, @function
setup_threads:
.LFB6:
	.file 1 "../thread/thread.c"
	.loc 1 14 0
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
	sbiw r28,10
.LCFI3:
	.cfi_def_cfa_offset 15
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 10 */
/* stack size = 12 */
.L__stack_usage = 12
	std Y+4,r25
	std Y+3,r24
	std Y+6,r23
	std Y+5,r22
	std Y+8,r21
	std Y+7,r20
	std Y+10,r19
	std Y+9,r18
	.loc 1 19 0
	ldd r24,Y+5
	ldd r25,Y+6
	subi r24,1
	sbci r25,-2
	std Y+2,r25
	std Y+1,r24
	.loc 1 20 0
	ldd r24,Y+5
	ldd r25,Y+6
	ldi r20,0
	ldi r21,lo8(2)
	ldi r22,lo8(-125)
	ldi r23,0
	call memset
	.loc 1 21 0
	ldd r24,Y+1
	ldd r25,Y+2
	movw r30,r24
	st Z,__zero_reg__
	.loc 1 22 0
	ldd r24,Y+1
	ldd r25,Y+2
	sbiw r24,1
	movw r30,r24
	st Z,__zero_reg__
	.loc 1 23 0
	ldd r24,Y+1
	ldd r25,Y+2
	sbiw r24,2
	movw r30,r24
	st Z,__zero_reg__
	.loc 1 24 0
	ldd r24,Y+1
	ldd r25,Y+2
	sbiw r24,3
	std Y+2,r25
	std Y+1,r24
	.loc 1 25 0
	ldd r24,Y+7
	ldd r25,Y+8
	mov r18,r24
	ldd r24,Y+1
	ldd r25,Y+2
	movw r30,r24
	st Z,r18
	.loc 1 26 0
	ldd r24,Y+1
	ldd r25,Y+2
	sbiw r24,1
	ldd r18,Y+7
	ldd r19,Y+8
	mov r18,r19
	clr r19
	movw r30,r24
	st Z,r18
	.loc 1 27 0
	ldd r24,Y+1
	ldd r25,Y+2
	sbiw r24,2
	movw r30,r24
	st Z,__zero_reg__
	.loc 1 28 0
	ldd r24,Y+1
	ldd r25,Y+2
	sbiw r24,3
	std Y+2,r25
	std Y+1,r24
	.loc 1 31 0
	ldd r24,Y+1
	ldd r25,Y+2
	sbiw r24,33
	ldi r20,lo8(33)
	ldi r21,0
	ldi r22,0
	ldi r23,0
	call memset
	.loc 1 33 0
	ldd r24,Y+1
	ldd r25,Y+2
	movw r18,r24
	subi r18,33
	sbc r19,__zero_reg__
	ldd r24,Y+3
	ldd r25,Y+4
	movw r30,r24
	std Z+1,r19
	st Z,r18
	.loc 1 34 0
	ldd r24,Y+3
	ldd r25,Y+4
	ldi r18,lo8(1)
	movw r30,r24
	std Z+5,r18
	.loc 1 35 0
	ldd r18,Y+9
	ldd r24,Y+3
	ldd r25,Y+4
	movw r30,r24
	std Z+4,r18
	.loc 1 36 0
	ldd r24,Y+3
	ldd r25,Y+4
	movw r30,r24
	std Z+7,__zero_reg__
	std Z+6,__zero_reg__
	.loc 1 37 0
	nop
/* epilogue start */
	adiw r28,10
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	ret
	.cfi_endproc
.LFE6:
	.size	setup_threads, .-setup_threads
	.comm	threadList,16,1
.global	currentThread
	.section	.bss.currentThread,"aw",@nobits
	.type	currentThread, @object
	.size	currentThread, 2
currentThread:
	.zero	2
	.section	.text.scheduling_thread,"ax",@progbits
.global	scheduling_thread
	.type	scheduling_thread, @function
scheduling_thread:
.LFB7:
	.loc 1 44 0
	.cfi_startproc
	push r28
.LCFI4:
	.cfi_def_cfa_offset 4
	.cfi_offset 28, -3
	push r29
.LCFI5:
	.cfi_def_cfa_offset 5
	.cfi_offset 29, -4
	in r28,__SP_L__
	in r29,__SP_H__
.LCFI6:
	.cfi_def_cfa_register 28
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	.loc 1 46 0
	lds r24,currentThread
	lds r25,currentThread+1
	ldi r18,lo8(1)
	cp __zero_reg__,r24
	cpc __zero_reg__,r25
	brge .L3
	ldi r18,0
.L3:
	mov r24,r18
	ldi r25,0
	sts currentThread+1,r25
	sts currentThread,r24
	.loc 1 47 0
	nop
/* epilogue start */
	pop r29
	pop r28
	ret
	.cfi_endproc
.LFE7:
	.size	scheduling_thread, .-scheduling_thread
	.section	.text.get_thread_by_pid,"ax",@progbits
.global	get_thread_by_pid
	.type	get_thread_by_pid, @function
get_thread_by_pid:
.LFB8:
	.loc 1 60 0
	.cfi_startproc
	push r28
.LCFI7:
	.cfi_def_cfa_offset 4
	.cfi_offset 28, -3
	push r29
.LCFI8:
	.cfi_def_cfa_offset 5
	.cfi_offset 29, -4
	push __zero_reg__
	push __zero_reg__
.LCFI9:
	.cfi_def_cfa_offset 7
	in r28,__SP_L__
	in r29,__SP_H__
.LCFI10:
	.cfi_def_cfa_register 28
/* prologue: function */
/* frame size = 2 */
/* stack size = 4 */
.L__stack_usage = 4
	std Y+2,r25
	std Y+1,r24
	.loc 1 61 0
	ldd r24,Y+1
	ldd r25,Y+2
	lsl r24
	rol r25
	lsl r24
	rol r25
	lsl r24
	rol r25
	subi r24,lo8(-(threadList))
	sbci r25,hi8(-(threadList))
/* epilogue start */
	.loc 1 62 0
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	ret
	.cfi_endproc
.LFE8:
	.size	get_thread_by_pid, .-get_thread_by_pid
	.section	.text.delay_thread_ms,"ax",@progbits
.global	delay_thread_ms
	.type	delay_thread_ms, @function
delay_thread_ms:
.LFB9:
	.loc 1 65 0
	.cfi_startproc
	push r28
.LCFI11:
	.cfi_def_cfa_offset 4
	.cfi_offset 28, -3
	push r29
.LCFI12:
	.cfi_def_cfa_offset 5
	.cfi_offset 29, -4
	rcall .
	push __zero_reg__
.LCFI13:
	.cfi_def_cfa_offset 9
	in r28,__SP_L__
	in r29,__SP_H__
.LCFI14:
	.cfi_def_cfa_register 28
/* prologue: function */
/* frame size = 4 */
/* stack size = 6 */
.L__stack_usage = 6
	std Y+4,r25
	std Y+3,r24
	.loc 1 66 0
/* #APP */
 ;  66 "../thread/thread.c" 1
	cli
 ;  0 "" 2
	.loc 1 67 0
/* #NOAPP */
	lds r24,currentThread
	lds r25,currentThread+1
	call get_thread_by_pid
	std Y+2,r25
	std Y+1,r24
	.loc 1 68 0
	ldd r24,Y+1
	ldd r25,Y+2
	ldi r18,lo8(3)
	movw r30,r24
	std Z+5,r18
	.loc 1 70 0
	ldd r18,Y+3
	ldd r19,Y+4
	ldd r24,Y+1
	ldd r25,Y+2
	movw r30,r24
	std Z+7,r19
	std Z+6,r18
	.loc 1 71 0
	ldi r24,lo8(-124)
	ldi r25,0
	.loc 1 71 0
	ldi r18,lo8(-71)
	ldi r19,lo8(9)
	movw r30,r24
	std Z+1,r19
	st Z,r18
	.loc 1 73 0
/* #APP */
 ;  73 "../thread/thread.c" 1
	sei
 ;  0 "" 2
	.loc 1 74 0
/* #NOAPP */
	nop
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	ret
	.cfi_endproc
.LFE9:
	.size	delay_thread_ms, .-delay_thread_ms
	.text
.Letext0:
	.file 2 "d:\\program files\\atstudio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\stdint.h"
	.file 3 "../thread/thread.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x26f
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF35
	.byte	0xc
	.long	.LASF36
	.long	.LASF37
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
	.uleb128 0xb
	.byte	0x1
	.long	.LASF24
	.byte	0x1
	.byte	0xd
	.byte	0x1
	.long	.LFB6
	.long	.LFE6
	.long	.LLST0
	.byte	0x1
	.long	0x16e
	.uleb128 0xc
	.long	.LASF20
	.byte	0x1
	.byte	0xd
	.long	0x16e
	.byte	0x2
	.byte	0x8c
	.sleb128 3
	.uleb128 0xc
	.long	.LASF21
	.byte	0x1
	.byte	0xd
	.long	0xfc
	.byte	0x2
	.byte	0x8c
	.sleb128 5
	.uleb128 0xc
	.long	.LASF22
	.byte	0x1
	.byte	0xd
	.long	0x174
	.byte	0x2
	.byte	0x8c
	.sleb128 7
	.uleb128 0xc
	.long	.LASF23
	.byte	0x1
	.byte	0xd
	.long	0x42
	.byte	0x2
	.byte	0x8c
	.sleb128 9
	.uleb128 0xd
	.long	.LASF27
	.byte	0x1
	.byte	0x13
	.long	0xfc
	.byte	0x2
	.byte	0x8c
	.sleb128 1
	.byte	0
	.uleb128 0x9
	.byte	0x2
	.long	0x102
	.uleb128 0xe
	.byte	0x2
	.uleb128 0xf
	.byte	0x1
	.long	.LASF38
	.byte	0x1
	.byte	0x2b
	.byte	0x1
	.long	.LFB7
	.long	.LFE7
	.long	.LLST1
	.byte	0x1
	.uleb128 0x10
	.byte	0x1
	.long	.LASF39
	.byte	0x1
	.byte	0x3b
	.byte	0x1
	.long	0x16e
	.long	.LFB8
	.long	.LFE8
	.long	.LLST2
	.byte	0x1
	.long	0x1b9
	.uleb128 0x11
	.string	"pid"
	.byte	0x1
	.byte	0x3b
	.long	0x42
	.byte	0x2
	.byte	0x8c
	.sleb128 1
	.byte	0
	.uleb128 0xb
	.byte	0x1
	.long	.LASF25
	.byte	0x1
	.byte	0x40
	.byte	0x1
	.long	.LFB9
	.long	.LFE9
	.long	.LLST3
	.byte	0x1
	.long	0x1f0
	.uleb128 0xc
	.long	.LASF26
	.byte	0x1
	.byte	0x40
	.long	0x42
	.byte	0x2
	.byte	0x8c
	.sleb128 3
	.uleb128 0xd
	.long	.LASF28
	.byte	0x1
	.byte	0x43
	.long	0x16e
	.byte	0x2
	.byte	0x8c
	.sleb128 1
	.byte	0
	.uleb128 0x12
	.long	.LASF30
	.byte	0x1
	.byte	0x28
	.long	0x42
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	currentThread
	.uleb128 0x13
	.long	0x102
	.long	0x212
	.uleb128 0x14
	.long	0x212
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF29
	.uleb128 0x12
	.long	.LASF31
	.byte	0x1
	.byte	0x27
	.long	0x202
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	threadList
	.uleb128 0x13
	.long	0x30
	.long	0x23c
	.uleb128 0x15
	.long	0x212
	.word	0x1ff
	.byte	0
	.uleb128 0x12
	.long	.LASF32
	.byte	0x3
	.byte	0x41
	.long	0x22b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	thread_stack_0
	.uleb128 0x12
	.long	.LASF33
	.byte	0x3
	.byte	0x42
	.long	0x22b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	thread_stack_1
	.uleb128 0x12
	.long	.LASF34
	.byte	0x3
	.byte	0x43
	.long	0x22b
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
	.byte	0x1
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
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x5
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
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB6
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
	.long	.LCFI3
	.word	0x2
	.byte	0x8c
	.sleb128 5
	.long	.LCFI3
	.long	.LFE6
	.word	0x2
	.byte	0x8c
	.sleb128 15
	.long	0
	.long	0
.LLST1:
	.long	.LFB7
	.long	.LCFI4
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI4
	.long	.LCFI5
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI5
	.long	.LCFI6
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI6
	.long	.LFE7
	.word	0x2
	.byte	0x8c
	.sleb128 5
	.long	0
	.long	0
.LLST2:
	.long	.LFB8
	.long	.LCFI7
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI7
	.long	.LCFI8
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI8
	.long	.LCFI9
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI9
	.long	.LCFI10
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI10
	.long	.LFE8
	.word	0x2
	.byte	0x8c
	.sleb128 7
	.long	0
	.long	0
.LLST3:
	.long	.LFB9
	.long	.LCFI11
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI11
	.long	.LCFI12
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI12
	.long	.LCFI13
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI13
	.long	.LCFI14
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 9
	.long	.LCFI14
	.long	.LFE9
	.word	0x2
	.byte	0x8c
	.sleb128 9
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x34
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.LFB6
	.long	.LFE6-.LFB6
	.long	.LFB7
	.long	.LFE7-.LFB7
	.long	.LFB8
	.long	.LFE8-.LFB8
	.long	.LFB9
	.long	.LFE9-.LFB9
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LFB6
	.long	.LFE6
	.long	.LFB7
	.long	.LFE7
	.long	.LFB8
	.long	.LFE8
	.long	.LFB9
	.long	.LFE9
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF15:
	.string	"tcb_stackPointer"
.LASF11:
	.string	"TCB_STATUS_BLOCK"
.LASF21:
	.string	"stack_bottom_ptr"
.LASF26:
	.string	"delay_interval_ms"
.LASF31:
	.string	"threadList"
.LASF35:
	.string	"GNU C11 5.4.0 -mn-flash=4 -mno-skip-bug -mrelax -mmcu=avr6 -g2 -O0 -funsigned-char -funsigned-bitfields -ffunction-sections -fdata-sections -fpack-struct -fshort-enums"
.LASF23:
	.string	"thread_pid"
.LASF16:
	.string	"tcb_stack_bottom_Pointer"
.LASF30:
	.string	"currentThread"
.LASF22:
	.string	"thread_function"
.LASF1:
	.string	"unsigned char"
.LASF25:
	.string	"delay_thread_ms"
.LASF28:
	.string	"current_thread_ptr"
.LASF6:
	.string	"long unsigned int"
.LASF13:
	.string	"TCB_STATUS_END"
.LASF32:
	.string	"thread_stack_0"
.LASF34:
	.string	"thread_stack_2"
.LASF27:
	.string	"stack_top_ptr"
.LASF24:
	.string	"setup_threads"
.LASF33:
	.string	"thread_stack_1"
.LASF4:
	.string	"unsigned int"
.LASF8:
	.string	"long long unsigned int"
.LASF2:
	.string	"uint8_t"
.LASF18:
	.string	"tcb_status"
.LASF36:
	.string	"../thread/thread.c"
.LASF10:
	.string	"TCB_STATUS_REDAY"
.LASF38:
	.string	"scheduling_thread"
.LASF9:
	.string	"TCB_STATUS_RUN"
.LASF20:
	.string	"tcb_ptr"
.LASF7:
	.string	"long long int"
.LASF29:
	.string	"sizetype"
.LASF19:
	.string	"tcb_delay_cyc_cnt"
.LASF14:
	.string	"TCB_STATUS"
.LASF39:
	.string	"get_thread_by_pid"
.LASF37:
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
