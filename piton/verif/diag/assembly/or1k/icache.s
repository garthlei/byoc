# 1 "openrisc-asm6.s.h"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "openrisc-asm6.s.h"






# 1 "or1k-asm.h" 1
# 8 "openrisc-asm6.s.h" 2
# 1 "or1k-sprs.h" 1
# 9 "openrisc-asm6.s.h" 2
# 1 "board.h" 1
# 10 "openrisc-asm6.s.h" 2
# 36 "openrisc-asm6.s.h"
 .section .vectors, "ax"



        .org 0x100
 l.movhi r0, 0

 l.ori r1, r0, 0x00000001
 l.mtspr r0, r1, 0x0011U

 l.mtspr r0, r0, 0x5000U
# 56 "openrisc-asm6.s.h"
 .global _start
 l.movhi r4, hi(_start)
 l.ori r4, r4, lo(_start)
 l.jr r4
 l.nop

 .section .text



 .global _start
_start:
 l.jal _cache_init
 l.nop

 l.jal _main
 l.nop



_main:
 ; l.mfspr r31, r0, 0x0011U ; l.ori r31, r31, 0x00000010 ; l.mtspr r0, r31, 0x0011U

    l.addi r1,r0,0x1
    l.addi r2,r1,0x2
    l.addi r3,r2,0x4
    l.addi r4,r3,0x8
    l.addi r5,r4,0x10
    l.addi r6,r5,0x20
    l.addi r7,r6,0x40
    l.addi r8,r7,0x80
    l.addi r9,r8,0x100
    l.addi r10,r9,0x200
    l.addi r11,r10,0x400
    l.addi r12,r11,0x800
    l.addi r13,r12,0x1000
    l.addi r14,r13,0x2000
    l.addi r15,r14,0x4000
    l.addi r16,r15,0x8000

    l.sub r31,r0,r1
    l.sub r30,r31,r2
    l.sub r29,r30,r3
    l.sub r28,r29,r4
    l.sub r27,r28,r5
    l.sub r26,r27,r6
    l.sub r25,r26,r7
    l.sub r24,r25,r8
    l.sub r23,r24,r9
    l.sub r22,r23,r10
    l.sub r21,r22,r11
    l.sub r20,r21,r12
    l.sub r19,r20,r13
    l.sub r18,r19,r14
    l.sub r17,r18,r15
    l.sub r16,r17,r16


    l.movhi r3, 0x0
pass:
    l.nop 0x1
    l.nop
    l.nop

.global _cache_init
.type _cache_init,@function
_cache_init:


 l.mfspr r3,r0,0x0001U
 l.andi r4,r3,0x00000004
 l.sfeq r4,r0
 l.bf .L8; l.nop


 l.mfspr r6,r0,0x0011U
 l.addi r5,r0,-1
 l.xori r5,r5,0x00000010
 l.and r5,r6,r5
 l.mtspr r0,r5,0x0011U






 l.mfspr r3,r0,0x0006U
 l.andi r4,r3,0x00000080
 l.srli r5,r4,7
 l.ori r6,r0,16
 l.sll r14,r6,r5





 l.andi r4,r3,0x00000078U
 l.srli r5,r4,3
 l.ori r6,r0,1
 l.sll r7,r6,r5


 l.addi r6,r0,0
 l.sll r5,r14,r5

.L7:
 l.mtspr r0,r6,0x2002U
 l.sfne r6,r5
 l.add r6,r6,r14; l.bf .L7; l.nop





 l.mfspr r6,r0,0x0011U
 l.ori r6,r6,0x00000010
 l.mtspr r0,r6,0x0011U
 l.nop
 l.nop
 l.nop
 l.nop
 l.nop
 l.nop
 l.nop
 l.nop

.L8:


        l.mfspr r3,r0,0x0001U
        l.andi r4,r3,0x00000002
        l.sfeq r4,r0
        l.bf .L10; l.nop

        l.mfspr r6,r0,0x0011U
        l.addi r5,r0,-1
        l.xori r5,r5,0x00000008
 l.and r5,r6,r5
        l.mtspr r0,r5,0x0011U





        l.mfspr r3,r0,0x0005U
        l.andi r4,r3,0x00000080
        l.srli r5,r4,7
        l.ori r6,r0,16
        l.sll r14,r6,r5




 l.andi r4,r3,0x00000078U
 l.srli r5,r4,3
        l.ori r6,r0,1
        l.sll r7,r6,r5

        l.addi r6,r0,0
        l.sll r5,r14,r5
.L9:
        l.mtspr r0,r6,0x1803U
        l.sfne r6,r5
        l.add r6,r6,r14; l.bf .L9; l.nop




        l.mfspr r6,r0,0x0011U
        l.ori r6,r6,0x00000008
        l.mtspr r0,r6,0x0011U

.L10:

 l.jr r9; l.nop
 .global _main
