# 1 "openrisc-asm4.s.h"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "openrisc-asm4.s.h"
# 1 "or1k_asm.h" 1
# 2 "openrisc-asm4.s.h" 2



    .section .vectors, "ax"


        .org 0x100


    .global _main
    l.movhi r4, hi(_main)
    l.ori r4, r4, lo(_main)
    l.jr r4
    l.nop


    .section .text

 .global _main

_main:
 l.addi r8,r0,0

 l.addi r8,r8,1; l.j _T1; l.nop




 _T2:l.addi r8,r8,1; l.jr r9; l.nop




 _T1:l.addi r8,r8,1; l.jal _T2; l.nop




 l.sfeqi r0,0
 l.addi r8,r8,1; l.bf _T3; l.nop




 _T3:l.sfeqi r0,1
 l.addi r8,r8,1; l.bf _T4; l.nop




 l.addi r8,r8,1

 _T4:l.sfeqi r0,0
 l.addi r8,r8,1; l.bnf _T5; l.nop




 l.addi r8,r8,1

 _T5:l.sfeqi r0,1
 l.addi r8,r8,1; l.bnf _T6; l.nop




 l.addi r8,r8,1

 _T6:l.movhi r3,hi (_T7)
 l.ori r3,r3,lo (_T7)
 l.mtspr r0,r3,32
 l.mfspr r5,r0,17
 l.mtspr r0,r5,64
 l.rfe
 l.addi r8,r8,1

 l.addi r8,r8,1
/* r8 Should be 0x000000009  */

    _T7:



    l.movhi r3, 0x0
pass:
    l.nop 0x1
    l.nop
    l.nop
