.include "user_define.h"
.globl _start
.section .text
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x24, h0_start
jalr x0, x24, 0
h0_start:
                  li x30, 0x40001104
                  csrw 0x301, x30
kernel_sp:        
                  la x5, kernel_stack_end

trap_vec_init:    
                  la x30, mtvec_handler
                  ori x30, x30, 0
                  csrw 0x305, x30 # MTVEC

mepc_setup:       
                  la x30, init
                  csrw 0x341, x30

init_machine_mode:
                  li x30, 0x1c00
                  csrw 0x300, x30 # MSTATUS
                  li x30, 0x0
                  csrw 0x304, x30 # MIE
                  mret
init:             
                  li x0, 0x7
                  li x1, 0x0
                  li x2, 0x6d77a7af
                  li x3, 0x0
                  li x4, 0x0
                  li x6, 0xf701ba6e
                  li x7, 0x4
                  li x8, 0x5
                  li x9, 0xf5a05bd2
                  li x10, 0xa6aea13a
                  li x11, 0xd
                  li x12, 0x80000000
                  li x13, 0x8
                  li x14, 0x80000000
                  li x15, 0x3
                  li x16, 0x0
                  li x17, 0xb
                  li x18, 0x7616563a
                  li x19, 0xfa441551
                  li x20, 0x0
                  li x21, 0x0
                  li x22, 0x810836ba
                  li x23, 0x8a7f6604
                  li x24, 0x9
                  li x25, 0x0
                  li x26, 0x490322cc
                  li x27, 0x0
                  li x28, 0x80000000
                  li x29, 0xf2b5b6a8
                  li x30, 0x80000000
                  la x31, user_stack_end
main:             li         t5, 0x1 #start riscv_int_numeric_corner_stream_8
                  li         t4, 0x0
                  li         t3, 0x0
                  li         tp, 0x7915d0a1
                  li         s2, 0x0
                  li         gp, 0x0
                  li         s5, 0x0
                  li         a3, 0x0
                  li         a2, 0x1
                  li         s4, 0x1
                  addi        t3, t2, 911
                  c.addi4spn  a2, sp, 576
                  c.add       a6, a1
                  mul         s2, t3, s10
                  auipc       s4, 759031
                  sub         s9, a1, zero
                  c.addi16sp  sp, -16
                  divu        sp, t4, gp
                  lui         t4, 42323
                  c.addi      a6, -1
                  c.addi      s9, -1
                  nop
                  rem         zero, ra, s4
                  lui         s10, 888815
                  mul         t2, t6, t2
                  lui         t4, 651664
                  rem         zero, tp, s3
                  divu        s4, s3, sp
                  c.sub       a2, a1
                  c.li        s6, -1
                  auipc       s1, 257268
                  addi        ra, s1, 540
                  mulhsu      s0, t0, a5
                  c.mv        t2, a0
                  li         t5, 0x1 #start riscv_int_numeric_corner_stream_10
                  li         t4, 0x1
                  li         t3, 0x0
                  li         a3, 0x1
                  li         s4, 0x1
                  li         s9, 0x0
                  li         a2, 0x0
                  li         t2, 0x1
                  li         s0, 0x0
                  li         a4, 0x1
                  addi        s0, a5, 90
                  c.addi4spn  a0, sp, 32
                  divu        s3, t2, s3
                  c.sub       a0, a1
                  c.sub       s1, a2
                  divu        a2, a3, t3
                  c.addi16sp  sp, -16
                  c.nop
                  mulh        zero, s11, t2
                  c.li        a6, 16
                  nop
                  divu        s2, tp, s9
                  lui         a1, 414319
                  lui         t1, 147515
                  add         a7, t3, s6
                  c.add       t3, t0
                  mulhu       a3, t0, s6
                  lui         s3, 834402
                  c.addi4spn  a3, sp, 304
                  c.lui       ra, 7
                  addi        a5, t6, -244
                  c.nop
                  sub         ra, t5, a2
                  c.li        ra, 5
                  c.mv        a6, t0
                  addi        s7, t1, 44
                  rem         s2, s5, s7
                  c.sub       a3, a2
                  li         s2, 0x0 #start riscv_int_numeric_corner_stream_2
                  li         s4, 0x0
                  li         t5, 0x0
                  li         t4, 0x0
                  li         t3, 0x1
                  li         tp, 0x0
                  li         a3, 0x5d8e4c3
                  li         s9, 0x4d951248
                  li         a5, 0x0
                  li         a2, 0x1
                  nop
                  divu        t3, sp, s8
                  lui         a5, 441295
                  div         gp, a5, t0
                  sub         s10, a1, s7
                  mulh        a6, a7, sp
                  c.addi      s5, 8
                  div         a4, s11, a2
                  rem         a4, t1, s2
                  c.li        ra, -1
                  c.li        s11, 9
                  mulhu       s9, tp, s5
                  c.lui       s3, 15
                  addi        s1, s4, -1290
                  c.add       s1, t1
                  mul         gp, s3, a4
                  mul         s11, s5, s11
                  c.sub       a0, a3
                  rem         gp, ra, t6
                  c.addi      s1, 20
                  c.add       s1, s11
                  li         s0, 0x4c8b41 #start riscv_int_numeric_corner_stream_7
                  li         a1, 0x1
                  li         t5, 0x1
                  li         t4, 0x1
                  li         s10, 0x0
                  li         s1, 0x4e788504
                  li         t3, 0x7a2aa1c8
                  li         a4, 0x0
                  li         a2, 0x228a431f
                  li         a3, 0x1
                  c.sub       a0, a1
                  auipc       ra, 596202
                  c.addi16sp  sp, -16
                  c.nop
                  rem         s3, t1, t3
                  auipc       a0, 561911
                  nop
                  c.addi4spn  a3, sp, 272
                  c.add       a2, ra
                  lui         zero, 281744
                  mulhu       a6, s1, a1
                  c.lui       ra, 21
                  c.nop
                  c.addi      a6, -1
                  add         s3, t4, s10
                  mulhu       s2, s10, a7
                  c.lui       t3, 16
                  addi        a3, s2, 619
                  c.addi      t5, 30
                  div         s2, s4, sp
                  c.addi      ra, 31
                  c.add       a2, a3
                  c.or        a0, a4
                  srl         a4, s11, a4
                  sub         sp, s0, s0
                  slti        a6, tp, -1036
                  andi        t3, s6, 1466
                  c.li        s9, 24
                  mulh        s6, tp, s0
                  rem         s7, a7, s5
                  or          s6, t4, a2
                  sra         a3, zero, zero
                  or          s5, s1, a7
                  c.or        a4, a2
                  slt         tp, s2, a1
                  c.srai      a0, 15
                  divu        t2, a6, a3
                  c.mv        a6, s4
                  c.lui       s11, 3
                  sll         s7, s10, s8
                  c.mv        t5, t5
                  mulhsu      s10, a6, s9
                  c.xor       a0, s1
                  c.mv        t2, a4
                  srl         t5, gp, a7
                  and         s2, tp, a7
                  slti        s2, a1, -1441
                  c.slli      s1, 13
                  xor         t3, a6, ra
                  mulhsu      t5, t3, s5
                  sll         a3, a1, a3
                  c.addi      t4, 1
                  c.li        a2, -1
                  c.addi      t3, 6
                  c.li        a2, 1
                  mul         sp, a3, s6
                  srai        t3, zero, 2
                  c.andi      a4, 15
                  c.slli      s0, 19
                  c.sub       a3, a3
                  c.slli      s5, 25
                  c.nop
                  sub         zero, t6, gp
                  c.addi16sp  sp, 208
                  srli        zero, a0, 18
                  srl         s5, t6, s5
                  c.xor       a2, a1
                  c.addi      a5, -1
                  auipc       tp, 890015
                  c.slli      s10, 8
                  c.add       s0, t6
                  c.mv        t4, a3
                  c.lui       s2, 11
                  xori        sp, s11, -1538
                  mulh        tp, a0, s3
                  sll         s7, t2, a4
                  xori        t4, s0, 1920
                  slt         a5, s4, s10
                  c.li        a1, -1
                  c.lui       a3, 9
                  c.li        ra, -1
                  xor         a7, a2, s5
                  rem         tp, s10, t3
                  c.slli      a5, 1
                  c.add       a5, a1
                  c.addi      a0, 8
                  lui         s9, 997836
                  add         t5, t5, ra
                  addi        ra, t5, 929
                  xori        s7, s1, -375
                  lui         s0, 596156
                  c.addi      a6, -1
                  div         tp, t2, t3
                  sub         t2, s4, s3
                  sub         a5, t0, s4
                  srai        zero, a0, 6
                  slti        a4, s8, -789
                  srli        s5, a2, 22
                  andi        a0, a0, 19
                  lui         t4, 603785
                  slli        a6, a3, 9
                  lui         tp, 219909
                  c.nop
                  sub         a3, s6, a6
                  srai        t1, s6, 24
                  c.and       a1, a2
                  slli        ra, s9, 10
                  c.and       s0, a2
                  c.addi4spn  a0, sp, 272
                  add         a6, s4, s0
                  nop
                  srai        a2, s9, 26
                  slt         a5, t3, s9
                  mul         tp, a6, a7
                  sra         a2, ra, t2
                  c.li        s11, -1
                  c.li        sp, -1
                  xori        a1, a0, 1782
                  c.sub       a2, s0
                  add         s6, s3, zero
                  c.andi      a2, 22
                  or          s10, a0, a6
                  c.add       s6, s4
                  sll         s5, s4, s9
                  mulh        gp, s3, t5
                  srli        a2, t1, 28
                  sll         t4, tp, s9
                  mulhsu      a2, a2, ra
                  mulhu       a1, zero, s6
                  xor         s0, ra, s7
                  c.li        ra, 11
                  c.srai      a0, 22
                  and         a1, t3, s11
                  slt         a7, zero, s7
                  rem         s4, s0, s11
                  sll         t2, s2, a7
                  sra         a2, t4, s3
                  mulhsu      t2, s6, s6
                  mulhsu      t1, zero, s2
                  sra         a4, s5, s6
                  sll         s9, s7, s5
                  sltu        zero, s2, s6
                  c.srai      s0, 25
                  auipc       t5, 664665
                  slt         ra, s9, t2
                  c.xor       a1, a2
                  c.srli      a2, 18
                  c.srli      a3, 26
                  slt         t1, s5, t4
                  andi        s4, gp, 1464
                  andi        t2, a5, -760
                  or          t4, t6, s2
                  nop
                  lui         tp, 734254
                  sll         sp, t0, a0
                  addi        a3, gp, 144
                  c.lui       s6, 27
                  divu        s5, t3, s1
                  c.addi16sp  sp, -16
                  auipc       s7, 997491
                  rem         a3, t2, t6
                  c.andi      a4, -1
                  or          t2, t6, a3
                  c.slli      a6, 7
                  or          t2, s0, s4
                  mulhu       t1, a3, a0
                  nop
                  andi        sp, t2, 12
                  c.mv        s5, s0
                  c.sub       a0, a3
                  slti        a6, a1, 1766
                  slt         s5, s2, t4
                  c.andi      a3, 21
                  c.addi4spn  s1, sp, 464
                  xori        zero, a1, 1035
                  slti        s0, a3, -462
                  c.and       a0, a1
                  sra         a7, s10, s4
                  mul         s0, s10, a4
                  c.xor       a0, a3
                  slli        s6, ra, 1
                  c.addi16sp  sp, -16
                  lui         a2, 853725
                  lui         zero, 198845
                  addi        zero, s5, 413
                  slti        t3, a7, -1345
                  mulhsu      a2, a4, a0
                  c.srai      a2, 13
                  add         a4, a2, s3
                  rem         a5, a4, a3
                  c.addi16sp  sp, 96
                  auipc       t5, 205561
                  sll         s0, s2, ra
                  c.lui       gp, 6
                  lui         ra, 915758
                  c.srli      a1, 25
                  divu        s10, a6, t2
                  add         a5, a7, t5
                  auipc       s4, 352224
                  ori         a0, t6, 341
                  andi        zero, zero, -1864
                  ori         s7, s3, 382
                  andi        zero, s10, 833
                  c.or        a0, a4
                  li         t5, 0x748fe681 #start riscv_int_numeric_corner_stream_5
                  li         t4, 0x1
                  li         a5, 0x0
                  li         s6, 0x0
                  li         s2, 0x1
                  li         t3, 0x0
                  li         s9, 0x0
                  li         a4, 0x7fb2bd08
                  li         s0, 0x0
                  li         a2, 0x1
                  sub         s0, a0, a7
                  c.addi4spn  a3, sp, 144
                  addi        a0, t2, -439
                  c.sub       s0, a2
                  rem         a6, s11, a2
                  c.addi16sp  sp, 368
                  c.lui       a0, 2
                  auipc       a3, 627865
                  addi        t3, s11, 226
                  nop
                  div         a3, s0, s4
                  mulhsu      a5, s6, t0
                  mulhsu      a0, s8, t0
                  divu        s7, s5, t6
                  c.add       t5, s10
                  c.sub       a1, s1
                  auipc       gp, 219451
                  divu        zero, sp, sp
                  mulhsu      s4, s9, s11 #end riscv_int_numeric_corner_stream_5
                  c.srai      a0, 29
                  srai        a0, t1, 20
                  lui         t3, 664117
                  c.xor       a0, a3
                  c.addi4spn  a0, sp, 400
                  sltu        s7, a7, s8
                  ori         sp, a4, 1086
                  add         a1, s6, a5
                  sra         s9, t2, a6
                  div         t1, s1, s10
                  srli        a3, a2, 0
                  add         s2, s8, s1
                  andi        s0, tp, -418
                  sltu        a0, zero, s4
                  c.srli      s1, 25
                  c.mv        t4, s6
                  slti        s4, s10, 1406
                  sub         a1, s6, a0
                  xor         t5, a4, s4
                  addi        a6, s4, 165
                  divu        zero, s2, gp
                  sub         s3, s4, t0
                  c.and       a2, s0
                  mulhu       s5, sp, s8
                  divu        a3, s2, s1
                  c.addi4spn  a2, sp, 624
                  rem         t4, a6, t4
                  or          s3, a6, s10
                  sll         zero, tp, s8
                  slt         a5, zero, a3
                  c.addi      s11, 16
                  add         t1, s1, s11
                  srli        zero, zero, 13
                  slt         s11, s8, a5
                  c.addi4spn  s1, sp, 224
                  auipc       zero, 243508
                  sra         a2, t6, s7
                  c.li        a4, -1
                  andi        gp, s10, 395
                  lui         a7, 853097
                  mulh        a3, t2, s4
                  sll         zero, zero, zero
                  c.sub       a4, s0
                  mulh        sp, s5, s0
                  sub         s4, s1, s4
                  and         a2, s9, t3
                  mulhsu      ra, t1, s9
                  sltu        s3, a3, s11
                  c.xor       a0, a2
                  srai        a0, t5, 14
                  c.add       a4, s9
                  lui         gp, 239398
                  sub         ra, a1, s6
                  sra         s6, a1, a4
                  andi        a3, s6, -672
                  c.lui       ra, 15
                  c.nop
                  c.nop
                  mulh        a3, t6, tp
                  sub         a4, tp, t3
                  c.li        t1, 7
                  add         s3, s6, t2
                  sltu        s7, s1, s11
                  srli        t1, t4, 29
                  lui         zero, 834212
                  srl         s11, a1, a0
                  slt         sp, gp, zero
                  c.addi      gp, -1
                  rem         s2, s2, tp
                  addi        gp, t5, -1306
                  xor         s5, gp, s6
                  xori        s10, t4, -1992
                  divu        t3, s0, a0
                  c.nop
                  c.lui       s11, 7
                  div         gp, s10, a1
                  c.sub       a0, a2
                  div         zero, s9, a6
                  srai        t5, a0, 10
                  slti        a2, zero, -138
                  srl         t2, t0, a7
                  nop
                  c.addi4spn  a0, sp, 752
                  lui         a7, 482907
                  c.andi      a0, -1
                  or          a5, s10, s5
                  slli        s4, s8, 11
                  rem         s1, s6, gp
                  mul         a7, s3, t3
                  c.lui       a2, 10
                  c.and       a0, s1
                  srli        a5, s9, 6
                  slli        sp, a5, 21
                  or          s6, t4, a4
                  ori         a6, s3, 1486
                  c.srai      a1, 20
                  c.addi4spn  a2, sp, 176
                  c.addi16sp  sp, 208
                  andi        gp, s3, -1815
                  sra         s7, a1, s4
                  xor         a7, s8, gp
                  c.srli      a0, 22
                  c.srai      s0, 25
                  sltu        a1, gp, gp
                  slti        a5, t3, -1590
                  rem         a5, a6, t1
                  c.li        s9, -1
                  sub         a0, s11, tp
                  c.srli      a0, 8
                  lui         a3, 607829
                  slti        s0, s2, 1947
                  slli        s6, s11, 10
                  div         zero, t3, s10
                  c.sub       a0, a1
                  srai        t3, a4, 28
                  c.srli      a0, 3
                  and         s6, a6, s6
                  and         s1, a3, s6
                  c.or        a0, a0
                  c.addi4spn  a3, sp, 624
                  div         t1, s6, t1
                  slli        t5, a5, 30
                  c.li        a1, 11
                  c.lui       s9, 26
                  div         s10, tp, a3
                  c.slli      ra, 17
                  c.addi4spn  a2, sp, 864
                  add         s10, a2, a2
                  srl         s7, a4, a3
                  c.xor       a0, a3
                  sltu        a3, a0, sp
                  srai        a7, a7, 18
                  mulhsu      s9, t3, a5
                  xor         t1, s8, a3
                  c.srli      a2, 23
                  c.lui       a7, 20
                  xori        zero, s9, 1858
                  mul         s0, s0, s2
                  xor         ra, s3, t0
                  srai        t5, t4, 20
                  slt         zero, ra, s9
                  c.mv        a5, s7
                  c.xor       a4, a1
                  c.srli      a1, 1
                  slti        s4, a5, -321
                  c.add       tp, s10
                  andi        s1, s11, 311
                  sltu        s6, ra, s11
                  c.li        s3, 14
                  andi        s5, s10, 1413
                  add         zero, a1, tp
                  rem         s7, s11, t4
                  c.addi4spn  a0, sp, 1008
                  xori        zero, t5, 886
                  divu        ra, t5, s1
                  xori        s1, t3, 787
                  ori         zero, s7, 850
                  c.mv        s9, sp
                  and         s0, t2, sp
                  c.or        s0, a0
                  slli        s5, a5, 6
                  xor         t4, a3, s0
                  div         gp, s4, t2
                  c.nop
                  c.and       a0, a4
                  c.slli      a6, 29
                  sra         a2, ra, t5
                  add         zero, a1, t3
                  rem         a5, s5, s0
                  add         t1, s1, s7
                  c.slli      t2, 2
                  rem         ra, gp, a6
                  nop
                  div         a0, s6, tp
                  mulhsu      t1, a4, s11
                  srl         a6, s8, s1
                  srl         a0, gp, t5
                  mulhsu      a4, a7, gp
                  add         gp, a6, a7
                  add         a6, a5, a3
                  auipc       s4, 616765
                  srl         s3, s8, a2
                  xori        zero, a2, 1344
                  slti        s1, s5, 1912
                  andi        s10, t3, -359
                  sltu        a7, s4, a4
                  slt         t3, t3, s10
                  rem         a0, tp, tp
                  c.andi      a0, 11
                  mulh        t3, s4, ra
                  c.addi      s7, 13
                  c.nop
                  c.slli      t2, 1
                  slti        t1, t2, 1370
                  ori         a7, a2, -835
                  c.lui       s9, 18
                  sll         gp, tp, gp
                  add         s7, t6, s1
                  c.srai      a0, 3
                  or          a2, t0, a3
                  c.add       t1, t6
                  c.sub       a3, a1
                  c.nop
                  ori         s11, a2, -520
                  mulhu       t5, a7, s10
                  xor         s6, sp, s6
                  nop
                  c.xor       a4, a0
                  c.srli      a3, 10
                  slli        t2, s11, 12
                  srli        a0, a0, 15
                  sub         a3, sp, s2
                  c.addi      t3, -1
                  mulhsu      tp, s9, sp
                  slti        s3, s5, 643
                  c.addi4spn  a0, sp, 320
                  c.addi16sp  sp, 304
                  c.srli      a0, 1
                  c.li        a4, -1
                  slli        t1, a2, 23
                  mulhsu      a4, s4, s8
                  c.srai      a0, 12
                  auipc       t1, 239236
                  mul         ra, s2, s8
                  ori         zero, s5, 278
                  slti        t2, s6, -1208
                  c.add       t3, s7
                  ori         t2, t6, -1487
                  mul         s7, t4, a7
                  c.xor       a3, a1
                  slli        a5, zero, 22
                  srli        s6, gp, 23
                  c.xor       a3, a2
                  add         a4, a5, sp
                  div         a1, a1, s7
                  divu        s6, ra, s6
                  rem         t3, s5, t0
                  andi        a2, t6, -1344
                  slti        a4, t6, 1828
                  c.srli      a3, 10
                  srl         t3, t4, sp
                  slti        s9, t5, 1669
                  srli        s9, s1, 31
                  mulhsu      sp, sp, gp
                  nop
                  c.or        s1, a2
                  c.sub       a0, a1
                  c.addi4spn  a0, sp, 912
                  c.mv        a0, gp
                  div         t3, ra, a2
                  auipc       a2, 217024
                  lui         ra, 180976
                  c.srai      s1, 22
                  and         zero, zero, s2
                  mul         a0, t0, t1
                  div         t5, sp, t0
                  mulhsu      s11, a0, gp
                  c.addi4spn  a0, sp, 784
                  ori         s2, a0, -729
                  sra         s11, a2, tp
                  c.srai      a0, 27
                  c.slli      a5, 31
                  srai        gp, s3, 13
                  slti        ra, t4, -744
                  xor         t3, t0, ra
                  or          s10, s7, s1
                  c.nop
                  c.mv        s2, a2
                  addi        a6, s4, 1572
                  slt         t1, t3, gp
                  sub         tp, gp, s3
                  c.mv        t4, t1
                  andi        a1, s1, 1869
                  sll         s2, t5, t4
                  c.srai      a0, 7
                  lui         t3, 957088
                  andi        s9, tp, -216
                  addi        a0, s4, 334
                  c.xor       a0, a2
                  mul         gp, s10, s1
                  c.or        a3, s1
                  and         zero, s4, s9
                  c.srai      a3, 22
                  and         a3, a2, t0
                  srli        s4, tp, 28
                  c.srli      s0, 28
                  auipc       s0, 914538
                  slt         t5, sp, a7
                  c.addi      s5, 9
                  c.li        gp, 8
                  mul         a1, s7, s6
                  ori         zero, t5, -600
                  nop
                  c.addi16sp  sp, 160
                  sra         a6, s2, s9
                  c.lui       s11, 14
                  lui         t1, 16854
                  sub         s11, s7, a1
                  add         s3, s9, a7
                  c.li        a5, -1
                  nop
                  sub         a1, a4, s3
                  sra         tp, a1, s7
                  or          a5, a2, s0
                  c.andi      s1, 2
                  c.xor       a0, a0
                  div         zero, gp, s6
                  mulh        t1, s8, t6
                  sub         s7, t5, t6
                  div         a0, s7, ra
                  c.srli      s1, 24
                  ori         t5, sp, 177
                  c.and       a3, a1
                  c.addi16sp  sp, -16
                  lui         t2, 899451
                  andi        zero, s0, -1735
                  c.xor       a4, a2
                  or          sp, t5, a7
                  c.and       a3, a5
                  nop
                  c.mv        gp, s9
                  sll         s5, s2, t4
                  c.srli      a0, 26
                  c.add       a7, sp
                  slti        gp, s6, -1770
                  c.or        a3, a0
                  c.nop
                  c.addi4spn  a3, sp, 752
                  slti        s5, s6, 1404
                  c.add       s7, s6
                  c.addi4spn  a1, sp, 848
                  srai        a5, t5, 13
                  and         a7, gp, a6
                  c.add       s7, a4
                  nop
                  slli        tp, a5, 19
                  c.nop
                  xori        s4, s8, -1410
                  srli        a2, ra, 11
                  divu        s3, s1, s0
                  sra         s0, s5, a2
                  srai        zero, t0, 23
                  and         a4, t4, t3
                  c.srli      a1, 12
                  srai        zero, s5, 16
                  div         a3, s3, s4
                  c.addi4spn  a1, sp, 288
                  andi        a4, a2, 1280
                  c.slli      a5, 21
                  mulhsu      a6, sp, s11
                  c.slli      s9, 30
                  c.add       a0, a2
                  or          s3, a3, a2
                  lui         s2, 219349
                  slt         s6, s0, s10
                  c.slli      ra, 1
                  c.slli      a6, 22
                  sra         t3, t3, a0
                  c.or        a0, a1
                  xor         a6, sp, t0
                  div         s1, ra, s6
                  c.mv        tp, s8
                  c.mv        a1, s8
                  mulh        a2, s5, sp
                  c.slli      t5, 28
                  c.li        s10, 21
                  lui         a1, 296475
                  sll         zero, s7, s0
                  slli        s1, s3, 25
                  slli        a3, a7, 31
                  nop
                  auipc       a4, 869957
                  and         sp, zero, t6
                  div         ra, tp, t5
                  or          t5, s11, t4
                  xori        s1, t4, 941
                  auipc       s6, 811474
                  nop
                  mulhu       s4, zero, a4
                  c.addi4spn  a0, sp, 176
                  c.srli      a0, 7
                  c.or        a0, a0
                  divu        zero, t6, a2
                  c.xor       a0, a0
                  mulhu       a7, a4, zero
                  sra         s0, a5, a0
                  c.mv        s1, s9
                  sra         sp, t1, s6
                  add         t4, a1, a1
                  c.nop
                  auipc       tp, 822928
                  ori         s2, s2, -1585
                  c.add       s0, a4
                  c.srli      s1, 6
                  c.nop
                  mul         zero, t5, ra
                  c.li        s4, 23
                  c.srai      a0, 12
                  xori        tp, tp, 582
                  sll         s3, gp, s9
                  nop
                  sub         t4, t1, s8
                  c.slli      t4, 11
                  c.xor       s0, a0
                  slt         gp, s9, s4
                  and         t2, s2, a4
                  c.andi      a3, -1
                  c.mv        ra, s1
                  c.li        ra, 10
                  srai        s0, s8, 31
                  slti        tp, s5, 960
                  sub         s6, a0, t2
                  or          a1, s5, t4
                  mulhu       s11, s2, t5
                  andi        t5, t0, 1821
                  c.or        a3, s1
                  sra         s2, ra, t2
                  srl         t5, s4, t1
                  c.slli      sp, 1
                  c.sub       a2, a3
                  sltu        a6, s7, s6
                  c.slli      ra, 14
                  mulh        tp, a4, a4
                  mulh        zero, t0, s7
                  or          zero, sp, a1
                  lui         a1, 96378
                  sltu        a5, s9, t1
                  slt         zero, t2, a7
                  nop
                  c.sub       a2, a3
                  c.or        a2, s1
                  c.slli      s0, 18
                  srli        zero, t3, 28
                  srli        s5, t5, 12
                  srl         a2, s2, a7
                  c.nop
                  c.and       a0, a3
                  addi        s5, s5, -1205
                  xor         a7, t4, t0
                  c.and       a3, a1
                  c.add       s1, t2
                  c.nop
                  rem         zero, ra, s4
                  slli        a4, t4, 25
                  nop
                  slti        a7, a3, 1594
                  mulhsu      s6, a3, gp
                  c.add       a6, a6
                  mulhsu      s1, s4, s6
                  mulh        gp, sp, s6
                  lui         zero, 929557
                  slti        zero, t3, -949
                  addi        a6, a7, -1798
                  mul         sp, sp, a4
                  c.srli      a1, 18
                  sub         t3, t4, s9
                  c.addi      s4, 9
                  add         a0, a4, s4
                  c.and       a3, s1
                  rem         a0, s11, a0
                  auipc       s1, 147056
                  mulhu       s11, s6, gp
                  c.lui       t1, 6
                  mul         a2, s1, s7
                  add         s10, s2, s5
                  c.add       a2, t2
                  and         t5, a1, gp
                  srl         t1, a3, s11
                  c.mv        a1, sp
                  c.addi      s11, 24
                  c.addi4spn  a0, sp, 16
                  c.and       a0, a3
                  c.and       a2, a3
                  ori         t1, gp, 1635
                  srl         a7, a3, s8
                  c.addi      t4, -1
                  addi        a2, t6, -860
                  slli        s1, s10, 22
                  xori        a3, s10, -2006
                  ori         s7, t1, -179
                  c.slli      s5, 4
                  c.andi      s0, -1
                  c.srai      a2, 15
                  nop
                  xor         s7, t3, s8
                  divu        t1, a3, s10
                  rem         a3, s5, s3
                  andi        t2, t0, -479
                  slt         a7, t2, s2
                  and         s0, s9, t4
                  ori         t2, s9, 997
                  rem         s10, s1, a7
                  srai        tp, s5, 20
                  mul         zero, s6, tp
                  and         s11, s0, s7
                  c.srai      a2, 28
                  c.mv        t1, s6
                  sra         ra, t6, a5
                  c.slli      t2, 10
                  slli        t2, t5, 16
                  srli        s1, a2, 3
                  andi        s10, a6, -1737
                  c.and       a3, a0
                  sra         a1, t2, a4
                  srai        a7, t0, 30
                  srai        s10, t6, 0
                  sra         zero, s10, t6
                  addi        t5, t1, 292
                  sub         s4, t1, a5
                  xor         s5, s3, t4
                  c.sub       a2, a2
                  or          zero, a3, a6
                  srai        t2, t2, 1
                  c.slli      ra, 5
                  c.xor       a0, a3
                  divu        s1, t5, tp
                  mulhsu      tp, s1, a1
                  andi        ra, s5, -309
                  addi        ra, a1, 890
                  sll         t1, s6, s2
                  c.lui       s3, 18
                  c.nop
                  add         a0, t0, tp
                  c.xor       a0, a1
                  c.addi      s4, -1
                  ori         s4, t0, -1377
                  sltu        s1, a6, a7
                  mulhsu      zero, t4, zero
                  xori        gp, a4, 1009
                  lui         sp, 758416
                  c.srai      a3, 14
                  slt         a5, s5, s4
                  slti        zero, t4, -16
                  c.add       ra, s9
                  c.srai      a0, 4
                  mulh        s9, a1, s7
                  div         s5, s11, gp
                  srai        s0, a0, 22
                  c.nop
                  mulhu       a4, a0, t5
                  c.xor       a0, a0
                  or          s9, a7, s5
                  andi        s1, a4, 1503
                  sra         a6, a3, a3
                  and         zero, ra, a3
                  mulh        a0, a3, s2
                  sll         s10, a6, s0
                  mulhsu      a1, t6, s2
                  srl         tp, s10, s3
                  xor         t2, s0, s7
                  li         t5, 0x3183009b #start riscv_int_numeric_corner_stream_9
                  li         s10, 0x7032dc6d
                  li         s2, 0x4edc51b8
                  li         s7, 0x0
                  li         s6, 0x0
                  li         t1, 0x0
                  li         sp, 0x1
                  li         t3, 0x1
                  li         t4, 0x1097dbb1
                  li         a4, 0x0
                  divu        zero, a4, s10
                  mulh        s3, a4, a0
                  mulhu       a1, a0, a5
                  addi        a7, a7, -445
                  c.li        s4, -1
                  c.add       s4, sp
                  sub         a3, sp, a2
                  addi        t2, a7, 639
                  c.addi16sp  sp, 144
                  c.addi4spn  a0, sp, 32
                  mulhsu      s11, s11, sp
                  divu        s2, a0, s4
                  c.lui       ra, 18
                  mul         s1, t0, t5
                  sub         a5, a5, gp
                  divu        s5, a3, t5
                  div         t1, s1, zero
                  c.addi16sp  sp, -16
                  c.addi      s1, 16
                  auipc       zero, 16258
                  addi        a2, s7, 795
                  sub         a4, s10, ra
                  auipc       s2, 181285
                  c.add       t3, a1
                  c.addi16sp  sp, -16
                  c.addi4spn  a3, sp, 144
                  mulh        zero, a4, s8 #end riscv_int_numeric_corner_stream_9
                  sub         s0, a2, t1
                  c.and       a3, a0
                  div         a4, ra, a1
                  sll         a3, t0, t3
                  srli        a7, s2, 15
                  c.and       a0, a3
                  c.and       a0, a0
                  mulhsu      s2, s3, s0
                  srl         a6, a3, t4
                  div         t2, a5, t2
                  c.sub       a1, a2
                  srli        a6, s5, 2
                  sra         t2, s6, t2
                  xor         a3, a1, tp
                  sll         t1, s3, ra
                  addi        a6, s8, -1708
                  c.mv        t4, t0
                  xor         s0, tp, s1
                  c.or        a0, a3
                  div         t5, s7, a3
                  andi        t3, s3, 857
                  c.sub       a5, s1
                  c.andi      a0, -1
                  c.andi      a0, -1
                  c.addi16sp  sp, -16
                  c.srai      a3, 16
                  c.srai      a3, 3
                  c.andi      a1, 16
                  srl         s9, s7, a6
                  xor         zero, a3, a1
                  mulh        s6, s5, tp
                  c.sub       a3, a2
                  or          s2, a6, s8
                  rem         zero, t0, a0
                  c.add       s0, a6
                  c.srai      a0, 6
                  lui         t2, 745410
                  mulhu       s6, t3, s7
                  c.addi4spn  a0, sp, 384
                  sll         s0, gp, gp
                  c.sub       a2, a1
                  srai        sp, tp, 17
                  slli        zero, s6, 19
                  div         s1, a2, s2
                  c.or        s1, a0
                  rem         a5, s8, t4
                  addi        sp, a5, 1459
                  c.lui       s10, 28
                  slt         tp, s2, a5
                  c.mv        t3, a0
                  c.or        a5, a0
                  c.srli      a2, 4
                  slt         zero, s11, a6
                  mul         s0, tp, s2
                  sub         sp, a2, ra
                  c.andi      a0, -1
                  or          s7, s4, s0
                  c.add       a1, a3
                  and         t1, s8, s11
                  c.andi      a0, -1
                  c.xor       a0, s1
                  c.add       t1, s6
                  xori        s7, s8, 1453
                  srai        s10, s8, 7
                  slt         t1, a3, zero
                  mulhu       t2, s11, ra
                  lui         s4, 834902
                  c.addi16sp  sp, -16
                  nop
                  c.addi4spn  a0, sp, 624
                  ori         zero, s9, -1889
                  xori        a6, a5, -519
                  mulhsu      a0, a1, t1
                  mul         ra, a7, s11
                  and         a3, s10, a6
                  c.lui       t2, 1
                  add         s10, s5, t6
                  slt         s11, ra, s1
                  c.addi16sp  sp, -16
                  and         ra, s1, t5
                  xor         s1, a1, a7
                  slt         a1, s5, s7
                  c.or        s1, a3
                  or          s7, s11, s6
                  c.and       a3, a0
                  sra         zero, sp, t3
                  nop
                  sltu        t2, gp, a1
                  c.sub       a0, a5
                  div         zero, a2, a7
                  c.sub       a3, s1
                  add         zero, gp, gp
                  c.sub       a3, a3
                  c.lui       s4, 3
                  sll         t3, t2, a3
                  srai        t1, s6, 22
                  c.addi      gp, 25
                  c.xor       a3, a5
                  c.addi      a5, -1
                  slli        sp, s2, 31
                  sub         zero, t5, s10
                  ori         ra, t6, -286
                  c.slli      a0, 13
                  sra         s1, s9, a7
                  xor         a0, a5, a5
                  andi        zero, t0, 309
                  andi        a2, t4, 306
                  or          a0, a4, t0
                  ori         zero, s8, -306
                  c.addi4spn  a0, sp, 320
                  sub         s4, a1, a7
                  srl         zero, tp, s6
                  add         t5, t1, a1
                  div         a6, gp, s9
                  c.slli      a4, 3
                  addi        a2, tp, -102
                  mulh        a0, t0, t6
                  srai        a6, t1, 1
                  xori        zero, t0, 1911
                  c.srli      a2, 13
                  xori        s0, t0, 706
                  mulhsu      gp, t5, zero
                  c.and       a2, a2
                  c.or        a4, a1
                  mulh        ra, a0, s2
                  c.add       t5, s2
                  auipc       zero, 913397
                  c.and       a3, a0
                  srl         sp, a4, ra
                  andi        s0, a1, -1171
                  c.nop
                  mulhsu      zero, s7, s3
                  c.addi4spn  a2, sp, 640
                  srai        s4, a5, 23
                  sra         a7, a0, s7
                  sub         zero, s2, a1
                  c.addi      t1, -1
                  mulhsu      s2, t4, s0
                  c.slli      a4, 17
                  c.addi16sp  sp, -16
                  slli        tp, s0, 13
                  c.srai      a0, 30
                  c.or        a0, s1
                  srai        t1, a0, 25
                  c.li        a3, 7
                  ori         tp, a2, 1203
                  auipc       tp, 286529
                  sll         s1, s11, t1
                  divu        a3, a3, a3
                  c.andi      a0, 15
                  auipc       s5, 444037
                  xor         s7, t5, s0
                  c.andi      a0, 9
                  and         zero, t2, t2
                  srai        zero, t6, 25
                  c.lui       t1, 31
                  c.or        s1, a2
                  rem         t2, a1, a0
                  andi        a5, s3, -1579
                  slli        gp, a3, 6
                  or          zero, s6, t5
                  xori        t4, a5, -504
                  ori         s9, sp, -401
                  c.addi4spn  a3, sp, 992
                  c.or        a0, a3
                  c.sub       a0, a3
                  or          zero, a0, a2
                  c.sub       a2, a0
                  c.lui       s11, 3
                  andi        s6, t3, -1534
                  c.addi16sp  sp, -16
                  c.nop
                  ori         zero, a6, -1534
                  c.or        a2, a3
                  or          sp, s0, a1
                  c.or        a2, a0
                  c.mv        s3, ra
                  slt         a4, s9, t2
                  c.addi4spn  a0, sp, 688
                  c.slli      a4, 14
                  rem         ra, s2, t4
                  slli        ra, s1, 18
                  sub         a7, s6, t4
                  xori        a1, s3, -103
                  mul         t5, s2, t3
                  div         a2, a6, a0
                  nop
                  mulhu       zero, s5, tp
                  c.lui       ra, 29
                  c.addi      tp, 25
                  c.srai      a2, 26
                  xori        s6, t3, -424
                  divu        s11, sp, a3
                  auipc       s2, 466035
                  xori        s3, s10, -814
                  c.mv        s6, s10
                  mulhu       a0, t1, a3
                  add         a0, a0, s2
                  c.sub       a0, a0
                  mulh        a3, t4, s3
                  c.lui       a7, 8
                  nop
                  nop
                  srl         a4, zero, s9
                  c.or        a0, a1
                  c.slli      t1, 20
                  c.sub       a0, a1
                  add         a3, tp, t4
                  sub         a6, t1, a3
                  sra         zero, a6, gp
                  srai        s3, a7, 21
                  auipc       a1, 225938
                  c.li        a2, -1
                  sub         a2, t5, gp
                  c.addi      a2, 3
                  mulhu       t3, s10, s6
                  c.li        s11, 13
                  or          s1, s4, s5
                  c.li        t5, 23
                  c.lui       s0, 22
                  c.mv        s2, s1
                  nop
                  or          s4, a1, t0
                  c.lui       s6, 12
                  slli        t3, t5, 24
                  c.add       s11, s6
                  divu        s9, s8, a1
                  c.sub       a5, a0
                  mulhu       s11, a3, s3
                  sra         s11, a4, s5
                  ori         a7, ra, 1035
                  c.andi      a3, 18
                  c.sub       a2, a0
                  c.addi      ra, -1
                  srai        s10, s10, 16
                  xori        zero, tp, -609
                  sra         a3, a7, sp
                  c.li        t5, 13
                  c.addi4spn  a4, sp, 32
                  c.li        a0, -1
                  c.xor       a2, a3
                  c.srli      a0, 26
                  lui         a6, 372615
                  c.lui       ra, 6
                  c.slli      ra, 11
                  ori         s1, a2, -996
                  c.xor       a3, a2
                  c.li        t3, 6
                  c.add       tp, t0
                  c.srli      a5, 10
                  c.addi      s10, 19
                  mulhsu      gp, t0, ra
                  slti        a6, a1, -1724
                  mulhsu      s3, a7, ra
                  mulh        s1, s2, ra
                  c.srli      a2, 24
                  c.and       s0, a3
                  slti        t3, a4, 1220
                  c.andi      a0, 11
                  div         a4, s4, ra
                  ori         a0, s8, -779
                  c.li        s0, -1
                  c.li        a7, 29
                  xor         s6, s4, t6
                  c.li        a1, -1
                  mul         t5, s9, a4
                  sltu        s2, s6, zero
                  srli        s11, s10, 3
                  srai        s4, ra, 6
                  rem         t1, tp, gp
                  auipc       t2, 182054
                  c.sub       a5, s1
                  slti        s1, t2, 865
                  sltu        s10, ra, s10
                  mulhu       s11, a2, s9
                  sub         ra, a4, gp
                  lui         a7, 784719
                  mulhsu      s2, s9, t3
                  c.addi16sp  sp, -16
                  c.sub       a0, a3
                  c.mv        s9, s9
                  c.li        t2, -1
                  srl         t4, s8, s9
                  c.or        a0, a0
                  c.addi      a5, -1
                  addi        s1, a0, 192
                  sub         t5, t0, t6
                  c.sub       a0, a3
                  andi        s6, t4, -1733
                  c.slli      gp, 7
                  slli        s6, gp, 19
                  c.addi16sp  sp, 368
                  c.srai      a1, 25
                  rem         s6, s1, s3
                  c.xor       a0, a5
                  c.add       t3, s4
                  andi        zero, t6, -598
                  mulhu       a5, a5, s4
                  c.li        tp, -1
                  ori         s9, t2, -1063
                  c.or        a5, a2
                  sra         s10, s11, t4
                  nop
                  sub         zero, s6, t3
                  c.addi16sp  sp, 320
                  or          a1, a3, a1
                  c.addi      s5, 23
                  lui         a1, 324778
                  ori         s2, a6, -757
                  sub         t1, ra, a0
                  ori         s0, t0, -1532
                  auipc       s7, 721730
                  nop
                  c.addi16sp  sp, -16
                  c.sub       a4, a0
                  mul         zero, a1, s11
                  c.xor       a4, a3
                  rem         a1, s9, tp
                  sltu        s9, gp, s4
                  divu        a7, zero, t2
                  or          s9, s1, t6
                  mulh        a6, s5, tp
                  c.srli      a3, 9
                  add         s9, s4, s10
                  c.addi4spn  s0, sp, 480
                  auipc       s0, 556862
                  c.xor       a2, s1
                  addi        s7, t4, 1009
                  c.srli      a0, 1
                  srl         s5, t2, s5
                  srli        t1, s3, 6
                  c.and       a3, a2
                  sra         gp, ra, s11
                  andi        s1, a7, 920
                  srl         s5, a6, a3
                  xori        s9, s9, -1053
                  xor         a1, s3, s9
                  srli        a1, s7, 27
                  c.srai      s1, 1
                  c.addi16sp  sp, -16
                  or          s4, a6, t2
                  div         a0, sp, t2
                  c.srai      a3, 25
                  srai        zero, zero, 11
                  srli        s11, t6, 28
                  srai        s4, t3, 12
                  srli        zero, t3, 2
                  mulhu       sp, s10, sp
                  ori         a7, tp, 1308
                  c.or        a2, a3
                  xor         tp, a7, zero
                  srl         tp, zero, s0
                  mulhu       gp, a4, s1
                  c.srli      s1, 1
                  slti        s3, s10, 773
                  c.mv        s9, a6
                  lui         s10, 18794
                  divu        s10, a2, s1
                  c.li        ra, 26
                  c.andi      a1, -1
                  srl         a2, s6, s11
                  and         a3, s8, t1
                  sltu        s9, s0, s8
                  c.srai      a0, 18
                  c.addi      ra, -1
                  sub         s5, t1, t4
                  and         gp, ra, sp
                  c.slli      a7, 13
                  sub         s1, t4, s6
                  c.addi16sp  sp, -16
                  c.addi16sp  sp, 80
                  rem         s0, tp, zero
                  sub         a2, a0, a2
                  sll         s6, s0, tp
                  lui         s4, 416877
                  mulhu       t1, s8, tp
                  srli        s2, t4, 16
                  and         tp, s1, s1
                  mulh        a5, t3, a6
                  c.addi4spn  a0, sp, 464
                  c.lui       a1, 10
                  auipc       s10, 5655
                  add         a3, s7, gp
                  mulhsu      zero, zero, a2
                  c.lui       s3, 3
                  c.or        a2, a3
                  c.srli      a4, 10
                  c.srai      a3, 28
                  mulh        a0, gp, gp
                  slt         s3, tp, a1
                  auipc       zero, 942483
                  and         a0, s5, s8
                  c.lui       t4, 23
                  c.mv        a2, a2
                  auipc       s11, 1033208
                  andi        gp, t0, 1323
                  mulh        t3, t6, s5
                  rem         ra, sp, t3
                  c.nop
                  c.and       a0, a0
                  c.slli      ra, 3
                  lui         ra, 670345
                  srai        tp, s8, 19
                  c.nop
                  c.srli      a3, 26
                  c.sub       a3, a2
                  addi        s1, a1, 1650
                  c.srai      a1, 11
                  slt         zero, s7, t3
                  sltu        s6, s9, a7
                  srli        s2, s8, 7
                  xor         s4, s9, t4
                  sra         sp, a0, s5
                  ori         s0, t6, 1999
                  c.add       t2, t5
                  xor         gp, s8, a5
                  mulh        t3, a5, s9
                  c.slli      ra, 14
                  c.slli      s4, 30
                  c.addi16sp  sp, 176
                  nop
                  c.and       a0, a1
                  rem         t3, a1, s7
                  c.addi16sp  sp, 432
                  divu        s1, zero, s8
                  slt         s1, zero, sp
                  sltu        a5, t1, a7
                  sub         a0, t3, s1
                  div         s1, t5, a3
                  c.srli      a1, 3
                  c.andi      a3, 14
                  andi        t5, a3, 1971
                  mul         s5, s8, s10
                  divu        zero, a4, s10
                  c.or        a3, a1
                  c.li        s5, -1
                  sra         a6, s6, s3
                  c.sub       a1, a2
                  rem         s7, gp, a6
                  slti        gp, gp, -1690
                  sub         t3, s8, t5
                  c.li        ra, -1
                  mul         a0, ra, s2
                  c.addi      s6, -1
                  or          a2, ra, s9
                  sra         t4, a7, s11
                  add         gp, zero, gp
                  c.mv        s10, a6
                  div         zero, s4, t6
                  slti        s0, t3, 1339
                  auipc       sp, 775959
                  c.srai      s0, 4
                  or          s9, s9, t0
                  c.li        ra, 1
                  c.addi      ra, -1
                  srl         s5, zero, gp
                  andi        s3, t5, -1705
                  c.srai      a4, 16
                  divu        a7, s5, a1
                  and         zero, sp, a2
                  c.or        a0, a2
                  c.addi      s0, 4
                  srl         a7, t3, t2
                  sub         s6, s5, a3
                  ori         s6, s7, -498
                  ori         a5, s6, 1714
                  rem         tp, s0, s2
                  srl         zero, s3, s6
                  slli        ra, t1, 3
                  c.or        a0, a1
                  slt         a3, t3, a4
                  mul         s6, s11, t6
                  c.xor       a1, a3
                  srl         t5, a5, s7
                  c.srli      a2, 15
                  c.or        a0, a3
                  add         zero, ra, a5
                  c.addi      t3, -1
                  xor         a0, a0, s5
                  c.add       gp, t6
                  ori         t4, a6, -82
                  mulh        a7, s10, sp
                  slt         t1, a1, ra
                  div         gp, s9, a3
                  mulhsu      a4, t2, a6
                  ori         a5, sp, 968
                  sll         zero, a1, a1
                  lui         s3, 933962
                  sll         s4, a2, sp
                  or          tp, t2, t6
                  rem         s4, t1, s9
                  mulhsu      sp, s0, a4
                  c.srai      a0, 5
                  nop
                  c.addi      ra, 5
                  add         a6, s1, a5
                  or          t5, tp, ra
                  slt         a3, s3, s10
                  c.addi      ra, 27
                  srli        s3, t1, 0
                  mul         s2, sp, s10
                  and         s3, t4, a4
                  c.addi4spn  a0, sp, 368
                  ori         s11, sp, -240
                  mulhu       sp, tp, s11
                  slt         t2, t6, a7
                  slli        a6, a6, 5
                  slli        s2, s8, 17
                  ori         s9, a5, 44
                  or          a7, tp, a0
                  c.addi16sp  sp, 464
                  slt         a1, t6, t6
                  slti        a5, a7, 583
                  mulhsu      s0, s2, t6
                  rem         s2, a4, gp
                  srli        a3, a1, 16
                  slli        s4, tp, 7
                  andi        tp, a4, 316
                  mulhsu      tp, a2, s7
                  lui         a7, 855753
                  c.srai      a0, 10
                  sltu        s6, a6, s6
                  c.srli      a1, 1
                  c.addi      a0, -1
                  divu        a4, a6, sp
                  mulhu       s11, a1, s6
                  c.lui       s7, 18
                  srai        a3, s4, 18
                  srl         zero, tp, t1
                  c.andi      a2, -1
                  sltu        t5, t5, t0
                  divu        a0, a5, a6
                  add         t1, zero, tp
                  c.add       a4, tp
                  mulhu       a4, s8, s10
                  c.lui       ra, 11
                  xori        t4, zero, -889
                  c.addi16sp  sp, 240
                  srai        a7, s4, 16
                  slti        a6, a3, 1646
                  lui         t5, 161254
                  c.srli      a1, 8
                  srai        s3, t2, 3
                  c.lui       s3, 26
                  mul         s9, a3, ra
                  c.addi      t3, 17
                  c.li        sp, -1
                  sra         zero, t0, t4
                  mulhsu      s9, t6, t2
                  nop
                  c.srli      a3, 13
                  c.addi16sp  sp, -16
                  slli        t5, s4, 11
                  srai        tp, a1, 31
                  lui         s0, 587543
                  c.addi4spn  a3, sp, 208
                  xor         a7, s7, t4
                  c.xor       a4, a1
                  xor         a7, ra, t2
                  srai        a4, t0, 20
                  nop
                  divu        tp, sp, t3
                  sub         s10, t6, a6
                  c.and       a0, a2
                  c.lui       ra, 5
                  sltu        zero, s10, a3
                  c.slli      s11, 31
                  c.addi      s0, -1
                  c.mv        s6, s11
                  sll         zero, zero, tp
                  c.and       a1, s1
                  c.srli      a0, 25
                  c.and       a0, a2
                  c.addi4spn  a0, sp, 480
                  sub         a6, gp, a7
                  sra         s7, s0, a1
                  srai        s4, s9, 9
                  c.nop
                  nop
                  slti        t2, a4, -546
                  srli        t1, a3, 2
                  or          tp, t4, s10
                  c.addi4spn  a0, sp, 48
                  c.nop
                  c.li        s11, 10
                  slti        a6, a2, -677
                  auipc       t2, 268341
                  mulh        s10, ra, t3
                  srl         a6, t1, s5
                  mul         a5, t1, t2
                  auipc       s2, 46692
                  c.addi4spn  s0, sp, 336
                  c.addi      ra, 8
                  c.slli      ra, 27
                  slti        t5, ra, -549
                  xori        s5, a7, -486
                  divu        a6, t5, s3
                  nop
                  c.or        a0, a5
                  c.srai      a3, 6
                  mulhu       zero, t3, a0
                  xor         s7, zero, s1
                  sltu        a6, a1, a1
                  c.nop
                  rem         a3, gp, a4
                  andi        a4, t3, -28
                  c.addi4spn  a0, sp, 480
                  and         tp, a5, t6
                  srai        a1, a2, 24
                  mulh        a6, a4, s5
                  c.xor       a0, a2
                  c.andi      a0, -1
                  andi        s11, a5, 320
                  srli        s4, gp, 21
                  c.nop
                  mulh        t1, a6, t4
                  c.xor       s0, a3
                  sub         a1, a0, t5
                  c.sub       a3, a0
                  c.or        a0, a3
                  c.srai      a3, 12
                  sll         t5, zero, s6
                  mulhsu      tp, s11, zero
                  srai        a5, a5, 11
                  mulhsu      zero, sp, a5
                  c.addi16sp  sp, 256
                  c.sub       a2, a0
                  c.addi4spn  a3, sp, 944
                  c.add       s10, tp
                  and         a3, t0, t3
                  slt         a3, t6, t3
                  sub         s10, t2, a4
                  mulhsu      zero, sp, ra
                  div         s7, a4, ra
                  c.sub       a0, a1
                  c.and       a0, a0
                  c.add       t3, sp
                  c.or        a2, a5
                  c.lui       a5, 14
                  c.mv        a2, sp
                  xor         a4, s7, ra
                  c.sub       s0, a2
                  srli        ra, t5, 23
                  srli        zero, zero, 8
                  mulhsu      a3, s4, a0
                  ori         a5, ra, -857
                  ori         s9, s5, 1620
                  add         t5, s3, a7
                  c.srai      a0, 23
                  c.addi      gp, 5
                  c.lui       s9, 14
                  andi        a2, s8, -412
                  c.add       s10, ra
                  srli        s0, a4, 21
                  c.addi16sp  sp, 208
                  c.mv        a6, ra
                  mul         gp, a7, a1
                  srai        s3, gp, 31
                  ori         t1, t5, -401
                  add         zero, a1, t4
                  sra         zero, t3, s7
                  rem         a1, s5, s0
                  or          a1, s0, s2
                  c.nop
                  ori         zero, a6, -787
                  auipc       sp, 265895
                  sltu        s2, a0, a0
                  c.or        a1, a3
                  xori        a5, s1, 841
                  srli        zero, a4, 25
                  mulhsu      a4, s10, s3
                  div         a2, a6, t3
                  slt         s10, s2, t6
                  auipc       a3, 896361
                  add         s0, s1, a2
                  or          a7, a4, t4
                  or          s10, t6, a4
                  div         a4, a6, a3
                  slti        ra, zero, -63
                  mulh        a2, t4, s5
                  slli        s2, t5, 11
                  ori         sp, s6, 724
                  c.nop
                  c.addi      s0, 6
                  divu        s11, s1, s6
                  c.add       t2, ra
                  mul         t3, a0, s2
                  xor         t2, t3, zero
                  add         t1, s3, s5
                  sltu        s2, t4, s2
                  c.xor       a2, s1
                  nop
                  mul         a2, t0, a0
                  sra         zero, s3, s2
                  c.xor       a0, s1
                  c.lui       s9, 17
                  auipc       s5, 799749
                  c.li        s7, -1
                  mulh        a0, a0, a3
                  c.or        a0, s1
                  srli        s6, t3, 7
                  sub         t1, a5, t3
                  and         s3, a6, a0
                  slti        a5, t2, -269
                  c.nop
                  slt         a3, s1, ra
                  sub         a5, t5, s11
                  c.or        a0, s0
                  div         a1, a5, s3
                  lui         s5, 328620
                  nop
                  c.sub       a3, a0
                  c.lui       t4, 30
                  c.srli      a1, 27
                  srli        a5, zero, 4
                  slt         s6, s7, ra
                  c.lui       a2, 5
                  c.addi      ra, 11
                  c.and       a0, a2
                  addi        a7, sp, 420
                  nop
                  c.slli      a1, 21
                  mul         s5, s0, a4
                  c.or        a0, s1
                  c.addi4spn  a2, sp, 96
                  div         tp, s9, zero
                  slti        tp, s8, 487
                  c.and       a0, a1
                  c.nop
                  srli        ra, ra, 13
                  c.srai      a1, 7
                  mulhsu      s11, tp, s4
                  addi        a6, zero, 1983
                  div         s2, tp, ra
                  c.li        t3, 3
                  sll         a5, gp, a7
                  rem         a2, t0, t1
                  c.nop
                  or          s6, t0, t6
                  c.addi      t5, -1
                  mulhu       zero, s9, sp
                  c.li        ra, -1
                  srl         zero, sp, s11
                  c.or        a0, s1
                  sltu        s1, s3, t5
                  or          s9, t0, a5
                  srl         ra, s6, s3
                  c.andi      a0, -1
                  sll         a5, zero, a7
                  ori         a7, s3, -1
                  c.li        ra, 27
                  c.li        a7, -1
                  mulh        a0, s7, s5
                  c.lui       ra, 12
                  c.lui       s1, 14
                  slt         t2, s1, s4
                  c.slli      a1, 29
                  nop
                  divu        sp, a0, s4
                  sltu        s2, t2, a0
                  slt         a7, s5, a5
                  mulhu       t1, t1, t3
                  sra         t3, t6, sp
                  c.slli      s0, 30
                  c.andi      a2, -1
                  mulh        a4, t1, s2
                  div         s7, s0, s4
                  c.addi      a4, 8
                  srl         zero, s2, ra
                  ori         a4, s3, 1056
                  divu        s7, s3, a3
                  srl         zero, s9, tp
                  rem         s2, t3, s2
                  slt         zero, sp, a1
                  c.srli      s1, 27
                  mulhsu      s9, s11, a6
                  c.xor       a0, a3
                  auipc       gp, 689403
                  sra         zero, t2, a4
                  c.srli      a3, 13
                  lui         zero, 811281
                  divu        a3, t4, s8
                  divu        s0, t5, a3
                  slt         t2, t2, s7
                  mulhu       a5, t5, s5
                  xor         a0, s11, a0
                  c.andi      a0, -1
                  c.or        a2, s1
                  c.li        a1, 24
                  and         a1, t5, a2
                  xori        s7, ra, -1593
                  mul         s9, a4, s8
                  andi        a4, tp, 1616
                  c.sub       a5, a3
                  divu        s7, t3, a4
                  c.sub       a2, a0
                  srai        a7, s5, 16
                  div         t1, s3, t3
                  srli        a1, t4, 14
                  slt         zero, t5, s6
                  c.lui       s1, 5
                  c.mv        a1, t2
                  c.srli      a0, 12
                  mulhsu      t3, zero, s3
                  ori         t4, gp, 1009
                  c.sub       a3, a3
                  c.slli      t4, 28
                  c.addi      s7, -1
                  slt         s1, a4, a5
                  rem         zero, zero, a5
                  c.or        s0, a2
                  sltu        tp, t6, s8
                  c.andi      a0, 15
                  mul         a4, s9, s2
                  c.addi4spn  a3, sp, 896
                  c.srai      a0, 31
                  divu        a3, gp, t2
                  c.addi      s9, -1
                  sub         zero, s11, a6
                  nop
                  ori         a7, sp, 1397
                  slti        s0, t1, -243
                  c.add       s7, t2
                  xor         s11, ra, s10
                  auipc       zero, 775266
                  c.mv        s3, s7
                  xor         zero, a1, t0
                  slti        a5, t6, -107
                  or          s7, s1, sp
                  slli        t5, sp, 13
                  and         s7, sp, t2
                  auipc       s0, 503202
                  add         a6, a6, ra
                  xor         s10, zero, t6
                  c.addi4spn  a2, sp, 1008
                  c.addi4spn  a0, sp, 352
                  divu        s1, s8, s9
                  andi        zero, s2, 481
                  add         zero, sp, zero
                  slt         a1, a2, s1
                  xor         s9, ra, a7
                  c.addi4spn  a0, sp, 912
                  c.sub       s1, a3
                  slti        s2, t4, 1773
                  addi        s6, zero, 1283
                  sub         s4, t2, t3
                  mulh        t5, s6, s3
                  divu        a3, s6, t2
                  srli        ra, zero, 13
                  mulhu       zero, s11, s10
                  nop
                  c.addi16sp  sp, -16
                  c.slli      tp, 3
                  auipc       s11, 883559
                  rem         s1, s7, s9
                  andi        t4, s1, 1426
                  c.and       a0, a0
                  c.lui       s5, 6
                  srai        ra, a7, 5
                  sra         s9, s5, a1
                  lui         t3, 253302
                  lui         s1, 614701
                  c.addi      s0, -1
                  mulh        s0, a5, a3
                  rem         zero, s7, s9
                  auipc       s4, 901188
                  c.xor       a2, a0
                  slt         s6, t5, tp
                  div         s11, s0, a4
                  sll         zero, s3, a7
                  c.srli      a4, 15
                  c.sub       a1, a1
                  rem         s4, gp, s6
                  srl         s6, t6, a7
                  xor         a4, s8, a3
                  mulhu       s7, gp, t5
                  c.nop
                  addi        zero, s5, 961
                  c.or        s1, s0
                  addi        t3, s6, 895
                  sub         zero, zero, zero
                  div         a0, s7, t3
                  mulhu       t4, s10, s0
                  c.andi      a2, -1
                  divu        s5, a7, a5
                  c.and       a3, a3
                  slli        s6, s5, 3
                  c.sub       a4, a3
                  c.lui       s5, 13
                  c.add       a1, s4
                  mul         tp, t4, a6
                  andi        s0, t1, -1387
                  c.lui       a0, 27
                  c.xor       s1, a0
                  c.and       a0, a3
                  lui         s6, 531778
                  c.xor       a3, a2
                  slt         gp, a4, t0
                  srli        s2, a4, 20
                  mulh        s2, zero, s1
                  andi        s11, t3, 1694
                  slt         s7, a6, s5
                  c.lui       a7, 25
                  c.addi16sp  sp, 464
                  c.xor       a5, a1
                  mulhu       sp, s6, s8
                  add         tp, a6, s10
                  sltu        s2, s2, s7
                  xori        s4, sp, 355
                  slt         t3, gp, a6
                  srli        s0, s5, 1
                  ori         a7, s3, 1710
                  and         zero, a6, s9
                  rem         s6, a5, s4
                  xori        zero, s3, -1672
                  mulhu       a4, t5, s1
                  sltu        zero, zero, s9
                  divu        a2, t3, gp
                  c.slli      s6, 29
                  or          zero, s5, s5
                  xor         a4, s2, tp
                  c.addi4spn  a1, sp, 752
                  mulh        a2, s6, s11
                  add         zero, s0, s7
                  add         ra, t6, s1
                  c.or        a3, s1
                  mulhu       a0, s4, t0
                  slti        t4, a5, 614
                  ori         t5, a3, -28
                  lui         s4, 390416
                  rem         a1, sp, s11
                  c.srai      a1, 25
                  c.srli      a2, 30
                  c.li        s2, 20
                  xor         ra, gp, t0
                  c.andi      a2, 12
                  c.srai      a0, 14
                  c.addi16sp  sp, -16
                  c.srai      s1, 9
                  c.addi4spn  a0, sp, 784
                  addi        s3, s7, -20
                  c.addi4spn  a0, sp, 448
                  xor         zero, t2, a5
                  c.mv        s7, s10
                  c.addi4spn  a0, sp, 784
                  auipc       gp, 815999
                  slt         s3, a2, s3
                  and         s2, s9, gp
                  auipc       t1, 417345
                  div         s11, s4, a4
                  sra         sp, t4, a1
                  nop
                  or          a1, gp, t4
                  c.add       a2, s10
                  xor         s1, ra, t1
                  srli        s1, s2, 29
                  c.xor       a0, a0
                  c.add       t3, a7
                  slti        a7, a4, -11
                  and         t3, t6, t2
                  slli        t2, s5, 21
                  slli        a0, t3, 18
                  rem         a4, tp, a7
                  mulh        t2, s0, s9
                  add         t2, a6, sp
                  c.mv        sp, s6
                  sub         a5, s6, a6
                  slti        a3, t3, -992
                  mul         t1, gp, gp
                  c.nop
                  auipc       t3, 111458
                  mul         tp, s6, t5
                  c.lui       s5, 6
                  add         ra, t3, a2
                  mul         s11, s9, s3
                  c.add       a7, sp
                  sra         t1, zero, s2
                  c.addi4spn  a2, sp, 528
                  c.or        a0, a1
                  c.sub       a0, a1
                  c.addi16sp  sp, 64
                  li         t4, 0x0 #start riscv_int_numeric_corner_stream_6
                  li         s11, 0x0
                  li         t3, 0x2d47d2a8
                  li         s5, 0x0
                  li         s7, 0x0
                  li         s10, 0x1
                  li         s4, 0x0
                  li         a4, 0x0
                  li         a5, 0x0
                  li         t5, 0x1
                  divu        s6, s6, s7
                  nop
                  c.addi16sp  sp, -16
                  mulhsu      t3, s7, zero
                  mulhu       t2, s1, t4
                  add         gp, s9, a4
                  auipc       t2, 110337
                  mulh        a5, t0, t1
                  c.addi      t4, 22
                  c.addi4spn  a1, sp, 400
                  mulh        s5, gp, s1
                  addi        tp, s2, 2046
                  lui         zero, 1007982
                  mulhu       s0, zero, a5
                  auipc       s7, 492618
                  c.nop
                  rem         a6, t3, s11
                  addi        t4, s6, 82 #end riscv_int_numeric_corner_stream_6
                  c.xor       a2, a3
                  slli        a7, t5, 22
                  mulhsu      s1, a3, tp
                  or          a3, s2, a6
                  lui         a2, 975413
                  divu        s6, s10, gp
                  sll         s3, s11, s3
                  and         s7, s5, a4
                  srli        a1, s7, 16
                  mulhsu      s2, s1, a5
                  c.and       s0, a3
                  c.addi16sp  sp, -16
                  xori        zero, s4, 1421
                  c.nop
                  mul         ra, t3, s4
                  rem         t2, sp, a1
                  c.srli      s0, 4
                  slt         zero, s10, s10
                  c.addi      s1, -1
                  divu        s0, s3, s0
                  c.mv        ra, a5
                  c.srai      a0, 18
                  xor         sp, a7, ra
                  ori         t4, a4, 1952
                  divu        gp, sp, ra
                  slt         a0, s5, s1
                  slt         a1, zero, s7
                  auipc       t3, 60137
                  c.lui       a6, 9
                  c.and       a1, a4
                  c.li        t4, -1
                  nop
                  and         tp, sp, s5
                  andi        s5, a4, 100
                  lui         s6, 759728
                  c.andi      a0, -1
                  rem         tp, gp, a7
                  srl         s0, s7, s8
                  c.li        t2, 12
                  sub         zero, t1, s1
                  c.addi4spn  a0, sp, 784
                  sub         s1, a5, ra
                  c.add       s2, s10
                  c.addi16sp  sp, -16
                  slt         s7, s2, t1
                  srai        s2, t4, 27
                  c.lui       s1, 24
                  c.sub       s0, a5
                  c.srli      s0, 29
                  sll         s5, s7, s9
                  slti        a7, t1, -442
                  c.andi      a0, 20
                  c.sub       a0, a4
                  add         sp, t5, s7
                  sub         s1, s3, a1
                  slli        zero, t3, 24
                  c.srli      a3, 1
                  slt         t2, ra, s11
                  rem         s1, a7, s9
                  c.lui       a4, 28
                  c.add       ra, a1
                  addi        ra, s11, 1251
                  slli        a2, s6, 31
                  srl         a6, s9, s3
                  slt         t2, s4, a0
                  xor         s2, a2, s2
                  c.addi16sp  sp, 144
                  c.li        s5, 6
                  mulh        s11, tp, a3
                  c.srai      s1, 1
                  c.sub       a2, a2
                  divu        s5, t6, t6
                  c.add       a2, s3
                  add         s0, a2, t6
                  sra         t5, a5, t6
                  c.add       sp, tp
                  divu        zero, a4, a5
                  c.slli      s11, 20
                  slli        a5, s9, 15
                  c.nop
                  srl         s0, s6, a4
                  mul         t3, s10, a4
                  c.li        gp, 22
                  c.and       a0, a2
                  c.sub       a3, a0
                  slti        t1, s1, -1989
                  c.mv        a5, t0
                  rem         s5, t4, s0
                  srl         a3, t5, a6
                  c.slli      s7, 10
                  sra         t5, a6, a2
                  lui         a1, 493259
                  c.addi16sp  sp, -16
                  sub         a7, sp, s0
                  mulh        ra, s8, s4
                  c.slli      t5, 1
                  c.mv        a6, gp
                  c.addi4spn  a0, sp, 944
                  ori         a2, s2, 1374
                  rem         s0, s11, s9
                  srai        s10, t0, 19
                  srai        gp, a1, 24
                  c.add       s1, s0
                  c.srai      a0, 28
                  divu        t2, gp, a6
                  slt         s4, s10, a1
                  c.or        a3, a3
                  c.xor       a3, s0
                  or          a7, sp, s4
                  mulhu       s6, t5, t1
                  divu        s4, s7, gp
                  c.addi16sp  sp, 480
                  auipc       zero, 1013945
                  c.addi16sp  sp, 256
                  srl         t5, t4, s7
                  divu        a0, a1, a6
                  lui         s3, 852441
                  c.andi      a0, 12
                  and         s6, t4, ra
                  c.and       a0, a1
                  c.slli      ra, 10
                  c.sub       a3, a2
                  c.nop
                  sra         zero, s11, t6
                  slti        zero, a0, 1343
                  sltu        sp, a5, sp
                  c.sub       a0, a1
                  sra         s4, s3, s7
                  srl         s1, s5, s3
                  addi        tp, t5, -417
                  c.slli      t5, 16
                  auipc       s0, 659173
                  c.addi16sp  sp, 352
                  addi        a0, s2, 1424
                  c.addi4spn  a0, sp, 656
                  lui         t3, 1014501
                  rem         a0, a0, s10
                  nop
                  c.and       a3, a1
                  sltu        a1, s6, a7
                  c.mv        ra, t6
                  srai        sp, s3, 0
                  c.mv        ra, gp
                  c.mv        ra, t4
                  sltu        zero, a2, s1
                  c.or        a0, a1
                  slt         a7, t1, a3
                  srli        s4, t2, 0
                  sll         s4, ra, a2
                  c.addi      s1, 15
                  sll         s7, a7, t1
                  slt         s9, a5, ra
                  rem         zero, gp, s7
                  c.nop
                  nop
                  c.addi16sp  sp, 256
                  mulhsu      s10, s5, a6
                  or          s0, s11, a1
                  slti        t4, sp, 57
                  sltu        s7, a5, a0
                  c.li        sp, -1
                  slti        a2, s6, 1444
                  c.and       a0, a0
                  c.srai      a0, 1
                  c.srai      s0, 7
                  c.addi      t4, -1
                  c.addi16sp  sp, -16
                  mulhu       a2, ra, t5
                  ori         a6, a2, 1730
                  or          t5, s4, s2
                  xor         a5, s1, s1
                  c.srli      a0, 11
                  c.sub       a3, a2
                  addi        zero, a2, 1564
                  c.or        a0, a3
                  xori        s10, s4, -253
                  auipc       s0, 517199
                  rem         s7, a5, a2
                  add         ra, t6, a5
                  xor         a2, a0, s6
                  or          s0, ra, a0
                  rem         a7, s1, a6
                  mul         t4, a6, s3
                  ori         a0, s4, 1305
                  add         s0, t5, a1
                  c.addi16sp  sp, -16
                  and         t1, a2, t5
                  sub         t4, t1, a5
                  andi        s9, zero, -742
                  c.srli      a0, 8
                  ori         a3, a0, 1848
                  sra         s10, s5, s10
                  addi        a0, t0, -1949
                  srai        tp, s0, 19
                  c.slli      s0, 8
                  c.or        a0, a2
                  c.addi4spn  a0, sp, 976
                  divu        s0, a0, s4
                  div         s4, t5, a7
                  ori         zero, s2, -923
                  c.addi4spn  a1, sp, 592
                  c.sub       a2, a0
                  c.lui       a1, 7
                  slt         t2, sp, t5
                  xori        s1, a6, -565
                  sub         t3, s0, a4
                  c.li        s11, 21
                  srl         s2, s11, a5
                  mulhsu      tp, s0, a1
                  c.add       t3, t0
                  slt         zero, s9, a1
                  slti        a5, a4, -1357
                  and         t1, t5, s4
                  c.addi16sp  sp, -16
                  div         a4, s11, s11
                  mulhsu      t4, tp, zero
                  slti        t5, a5, 832
                  slli        a6, a4, 27
                  mulhu       t2, s6, a7
                  c.srli      a0, 16
                  addi        s1, s5, -83
                  c.addi4spn  a2, sp, 272
                  c.or        a0, s0
                  srai        t3, zero, 31
                  or          a0, t6, a0
                  ori         a1, s6, 434
                  nop
                  mulh        t3, a5, a2
                  or          s6, zero, a2
                  and         a3, t3, s8
                  xori        t1, t3, 1548
                  div         s11, a0, a4
                  c.mv        ra, a1
                  c.srli      a2, 14
                  sltu        s10, gp, t5
                  slti        s0, s3, -312
                  srl         s5, s6, t2
                  lui         a6, 3485
                  ori         t4, t0, 919
                  auipc       a2, 652765
                  c.addi16sp  sp, -16
                  c.sub       a0, a3
                  divu        sp, s2, a1
                  c.addi      ra, -1
                  ori         ra, t5, -1883
                  sra         t2, t0, s5
                  add         s0, s11, a4
                  nop
                  c.srli      a2, 29
                  nop
                  addi        s9, zero, -1744
                  c.nop
                  mulhu       t3, gp, s6
                  and         s10, s6, t2
                  c.andi      a0, 12
                  sltu        a1, s11, s1
                  c.srai      a1, 23
                  c.srai      s1, 6
                  mulhu       a3, t6, s5
                  mulhu       gp, s2, a1
                  ori         a2, t2, -677
                  divu        sp, s0, a5
                  c.srli      a2, 4
                  sltu        tp, zero, t4
                  add         s11, zero, s0
                  c.mv        a3, s3
                  c.and       a3, a2
                  addi        s6, s5, -1157
                  addi        t5, t0, 2035
                  mulh        a6, s6, t0
                  c.andi      a0, -1
                  sltu        a5, s0, s6
                  srl         s1, a2, a0
                  add         s5, a7, s0
                  mul         t4, t1, s9
                  nop
                  or          a7, s5, s8
                  c.addi      s11, 27
                  and         s5, s8, t6
                  c.addi4spn  a4, sp, 240
                  srli        sp, zero, 28
                  c.and       a0, a1
                  c.srai      a3, 6
                  ori         zero, s9, 855
                  div         s9, s3, t6
                  slti        t1, s0, 1231
                  c.li        t1, 3
                  and         s9, t2, a2
                  c.sub       s1, a2
                  c.xor       a4, a1
                  mulhu       a2, s7, s11
                  slti        s2, a3, 1650
                  c.srli      s1, 20
                  c.mv        sp, s0
                  slt         s0, a5, s11
                  srl         a5, s4, t5
                  ori         s0, t5, -1301
                  c.mv        s4, t4
                  c.slli      s9, 3
                  mulh        a7, s5, s3
                  c.andi      a0, 7
                  rem         gp, s6, a1
                  c.andi      a3, -1
                  mulhsu      s1, s9, a4
                  divu        sp, s9, t5
                  srli        s2, a6, 30
                  srai        t2, s2, 14
                  c.addi      t1, -1
                  sltu        a4, t5, ra
                  addi        t3, a7, -1786
                  slti        zero, a4, 1835
                  sltu        t2, t1, sp
                  c.lui       t1, 14
                  nop
                  mul         s7, s5, a1
                  andi        s2, a6, 1123
                  c.add       ra, s0
                  sll         s10, s8, a0
                  c.slli      s7, 17
                  c.and       a0, a0
                  c.add       ra, t5
                  c.and       s0, a0
                  divu        t4, s6, s6
                  c.xor       a0, a1
                  mulh        t5, s8, s8
                  slt         s10, s6, t6
                  c.addi4spn  a0, sp, 384
                  c.and       a0, a2
                  c.and       a0, a0
                  slti        zero, a4, 511
                  add         s0, ra, s10
                  ori         s5, tp, -749
                  ori         t5, t2, 1456
                  mul         a5, s11, s10
                  sub         t3, s6, t0
                  or          zero, a5, s5
                  c.addi16sp  sp, 48
                  addi        s10, s10, 1194
                  mul         t1, t4, a3
                  c.or        a3, a1
                  sub         s6, t5, s1
                  xori        s11, s8, 1395
                  c.nop
                  mulhu       a5, a3, gp
                  ori         zero, s2, -206
                  ori         ra, t0, 1166
                  and         a7, t6, s5
                  srl         a6, a3, s3
                  mulhu       s9, t2, t6
                  c.nop
                  c.slli      a4, 22
                  sub         a4, s7, t5
                  divu        zero, a3, s10
                  or          s1, a7, s5
                  c.slli      s0, 3
                  srl         a4, s5, s1
                  sra         a1, a4, a3
                  sltu        a3, t4, s5
                  and         a3, a5, s3
                  divu        zero, t4, ra
                  slt         t2, s8, s8
                  c.andi      a2, -1
                  and         a3, t5, t5
                  add         s0, s2, a5
                  c.addi4spn  a0, sp, 240
                  c.xor       s1, a1
                  rem         t1, zero, s1
                  sltu        s2, s10, t5
                  srli        a3, s0, 19
                  mulhsu      ra, a4, a4
                  andi        s2, a3, 1202
                  c.and       a0, s1
                  c.or        a0, a5
                  add         zero, s11, a7
                  c.andi      a2, -1
                  slti        s5, t6, 955
                  c.sub       a0, a0
                  mulhu       s10, s1, ra
                  c.andi      a0, -1
                  srli        tp, t5, 22
                  lui         s7, 857262
                  sra         a3, s8, sp
                  divu        a4, t3, s5
                  mul         tp, t5, gp
                  mul         sp, t5, s11
                  andi        s7, s7, -1689
                  c.or        s0, a2
                  sltu        zero, s10, a3
                  sub         a0, t0, s9
                  xor         s9, a5, sp
                  mulhu       t4, sp, s3
                  li         t5, 0x0 #start riscv_int_numeric_corner_stream_3
                  li         t4, 0x54ae3223
                  li         t3, 0x0
                  li         s11, 0x0
                  li         a5, 0x0
                  li         a0, 0x0
                  li         a3, 0x39d57e61
                  li         a2, 0x1
                  li         s10, 0x0
                  li         s9, 0x0
                  mulh        t1, s10, t4
                  mulhu       s5, t2, zero
                  c.sub       a0, a3
                  c.nop
                  c.addi      t5, 19
                  mulhu       s10, s3, s9
                  nop
                  nop
                  c.li        ra, -1
                  c.lui       ra, 17
                  c.add       s10, a6
                  c.addi4spn  a0, sp, 752
                  c.nop
                  rem         s2, s2, a7
                  lui         s2, 138161
                  mulhsu      s10, s10, s11
                  c.mv        ra, s2
                  rem         s5, a6, a4
                  rem         s5, s8, gp
                  addi        tp, s2, -463
                  c.addi4spn  a0, sp, 560
                  addi        tp, t5, -63
                  c.nop
                  c.mv        a2, ra
                  sub         ra, t3, a6
                  auipc       s9, 694148
                  c.mv        s6, t5
                  c.or        a3, a2
                  slli        zero, a1, 17
                  srli        gp, a7, 23
                  srai        t3, t0, 22
                  srai        t2, a0, 12
                  mulh        s4, s9, a6
                  c.mv        s1, t1
                  andi        t3, a2, -735
                  c.and       a3, a0
                  srai        s2, a6, 19
                  andi        s2, ra, 355
                  andi        a6, a0, -1437
                  c.nop
                  c.srli      a0, 19
                  srli        zero, t4, 18
                  andi        a2, a0, -169
                  addi        s9, a0, 650
                  c.and       a2, a2
                  c.xor       a2, a4
                  auipc       a5, 869492
                  c.mv        t3, s3
                  sra         s5, a2, s3
                  div         s2, s9, t1
                  c.sub       a0, a1
                  c.lui       ra, 8
                  c.srli      a4, 21
                  divu        a5, a5, t1
                  slti        s10, t3, 1720
                  slli        s10, a1, 17
                  c.andi      a3, -1
                  sub         s9, s5, a7
                  mul         ra, a1, s2
                  xor         s4, a3, a5
                  addi        t3, t5, -1276
                  c.mv        s11, a1
                  andi        a0, s7, 1588
                  or          tp, s3, a3
                  addi        zero, s8, 1000
                  xori        s3, t6, 90
                  slli        gp, s4, 10
                  c.nop
                  divu        zero, s1, t2
                  c.mv        a7, t3
                  sra         t5, zero, t5
                  xor         sp, s4, zero
                  c.or        a5, s1
                  c.addi4spn  a0, sp, 592
                  divu        zero, a5, a6
                  divu        s1, t4, s4
                  sll         t2, t2, t3
                  div         s10, s2, s7
                  mul         zero, s4, t3
                  slti        gp, s0, 260
                  xor         t4, s3, a1
                  c.addi4spn  s0, sp, 144
                  mul         zero, t6, a3
                  slli        s9, t1, 17
                  mulh        a6, s3, ra
                  div         s9, a2, ra
                  divu        s2, s9, s11
                  sltu        a6, a2, ra
                  c.li        s4, 6
                  and         a2, s3, t1
                  srai        a4, s1, 30
                  c.andi      s0, 25
                  sub         a7, t0, s3
                  sltu        ra, t3, tp
                  c.lui       s6, 22
                  c.and       a0, a0
                  c.xor       a0, a2
                  srli        t1, a0, 24
                  xor         gp, gp, sp
                  c.andi      a0, 29
                  c.li        a5, 31
                  slti        a6, a7, 1015
                  c.addi16sp  sp, -16
                  or          t4, t3, s7
                  mulh        t5, t0, s6
                  c.srli      a0, 3
                  c.li        s6, 6
                  srl         s10, s7, a7
                  c.srli      s0, 3
                  sll         gp, zero, a4
                  sltu        ra, a7, s0
                  sub         t1, s6, s7
                  nop
                  c.addi      a7, -1
                  c.andi      a3, 10
                  c.srli      a0, 29
                  c.nop
                  c.slli      a4, 30
                  c.addi16sp  sp, -16
                  addi        a2, a5, -242
                  xori        a7, tp, -755
                  slli        t5, a3, 15
                  mul         s6, s9, s8
                  divu        sp, a6, t2
                  lui         s11, 146830
                  c.addi4spn  a0, sp, 400
                  add         a6, s10, a4
                  lui         t2, 85277
                  mulhsu      s3, s7, tp
                  add         s6, a3, t3
                  c.nop
                  c.add       a7, s2
                  sub         s0, a4, s5
                  c.li        a6, -1
                  xori        s0, tp, -1221
                  slli        s3, gp, 31
                  c.nop
                  c.srli      a1, 2
                  mulh        tp, t0, s11
                  c.add       ra, ra
                  and         zero, t5, t3
                  mul         s10, s10, ra
                  sra         s1, a6, a5
                  addi        s7, ra, 1406
                  c.mv        a4, ra
                  srli        gp, s11, 30
                  nop
                  andi        s7, s6, 103
                  c.li        tp, 22
                  andi        t5, t1, -1943
                  slti        s6, s0, 205
                  c.srai      a0, 6
                  srai        sp, s1, 23
                  nop
                  srli        a5, zero, 31
                  slt         s3, t3, gp
                  sra         a4, t0, a7
                  auipc       zero, 613730
                  sra         t2, a6, s2
                  slt         a5, s8, gp
                  sll         s4, ra, s11
                  srl         s0, t3, s2
                  rem         t3, tp, s3
                  c.xor       a2, a0
                  xori        t1, s6, 362
                  c.li        s11, -1
                  srai        s11, a0, 23
                  xori        a2, t2, -625
                  c.add       s10, t4
                  or          t3, t1, s11
                  slti        a5, ra, 137
                  addi        t1, a0, -826
                  add         a2, t6, t0
                  div         a6, zero, t6
                  slti        a5, s6, -1817
                  c.or        a0, a0
                  rem         s11, a3, a5
                  div         zero, t4, sp
                  xor         s6, t6, s8
                  c.sub       a2, a3
                  c.slli      s0, 3
                  sll         a4, a0, gp
                  c.mv        s10, s3
                  c.or        a2, a5
                  c.add       a7, t5
                  c.addi16sp  sp, -16
                  c.addi4spn  a0, sp, 880
                  slt         t2, s0, a0
                  nop
                  c.or        a0, a5
                  xor         a3, t1, s7
                  sub         a7, a0, s8
                  c.addi4spn  a0, sp, 592
                  auipc       zero, 70662
                  mulhu       a6, t2, sp
                  sll         a3, a7, t5
                  srli        zero, t5, 29
                  c.andi      a2, 12
                  andi        a7, s2, 1992
                  nop
                  ori         t3, s5, -1997
                  c.andi      a0, -1
                  c.addi16sp  sp, -16
                  slli        s5, sp, 13
                  addi        s10, s9, -1400
                  mulhu       s11, a3, gp
                  c.li        s0, 2
                  c.addi16sp  sp, -16
                  c.and       a0, a1
                  c.mv        ra, a5
                  sra         t3, t5, a2
                  c.nop
                  slli        gp, s6, 4
                  c.sub       a3, a3
                  c.li        tp, -1
                  auipc       a1, 870598
                  add         t2, t6, s0
                  sra         zero, s11, ra
                  c.lui       t5, 6
                  c.andi      a0, -1
                  srl         t1, t1, t2
                  add         zero, a5, gp
                  c.nop
                  mulh        a6, t1, a6
                  c.add       t1, a6
                  srli        s7, s1, 11
                  c.add       a4, a7
                  sub         zero, s4, t0
                  c.and       a2, s1
                  c.srli      a3, 15
                  rem         t1, a2, s9
                  xor         a5, s2, s6
                  mul         zero, s4, t5
                  mulhu       s11, a7, a3
                  sltu        t5, s10, tp
                  srl         s0, s0, a5
                  li         a5, 0x0 #start riscv_int_numeric_corner_stream_4
                  li         t5, 0x1
                  li         t4, 0x1b687989
                  li         sp, 0x1
                  li         s1, 0x13cccaae
                  li         t3, 0x2835f0e
                  li         t1, 0x0
                  li         a2, 0x0
                  li         a4, 0x7a1d606c
                  li         a3, 0x0
                  nop
                  nop
                  lui         zero, 1043574
                  addi        tp, a6, 1256
                  lui         a6, 903527
                  auipc       zero, 680625
                  c.li        a0, -1
                  divu        s1, s2, t3
                  c.addi      sp, -1
                  divu        zero, s8, zero
                  c.lui       s6, 18
                  c.addi16sp  sp, -16
                  mul         t2, s0, t1
                  rem         tp, s6, s10
                  add         zero, s8, s9
                  c.sub       a0, s0
                  srai        s6, s5, 28
                  c.slli      ra, 28
                  c.srai      a2, 4
                  addi        s1, t1, -650
                  c.and       a0, a3
                  c.xor       s1, a2
                  nop
                  sll         s2, a0, a1
                  slt         s11, zero, a2
                  c.and       a0, a3
                  slli        zero, s6, 10
                  slli        t4, tp, 1
                  and         zero, s3, t1
                  xor         zero, a5, a1
                  srli        a3, s8, 22
                  sltu        tp, s1, t2
                  c.addi4spn  s1, sp, 928
                  mulh        zero, s9, a2
                  c.addi4spn  a2, sp, 448
                  divu        a2, s4, zero
                  slti        t2, a3, 115
                  lui         s3, 704754
                  add         zero, a3, t0
                  lui         t4, 180239
                  srai        s2, a6, 23
                  c.addi16sp  sp, -16
                  or          a3, ra, t0
                  auipc       t2, 631410
                  divu        a1, tp, t0
                  srai        a1, s4, 2
                  c.li        ra, 2
                  mulh        s9, s8, a2
                  c.or        s1, a1
                  c.or        a0, a5
                  andi        zero, s0, -230
                  or          s2, a3, a5
                  c.mv        ra, a5
                  srl         s1, a7, s6
                  c.and       a0, s1
                  mulh        s2, s2, tp
                  lui         ra, 1017908
                  slti        a1, a4, -1445
                  mul         a4, a1, a5
                  mulhu       a0, t3, s5
                  c.srai      s1, 18
                  srai        sp, t2, 27
                  c.nop
                  sll         a1, t6, s3
                  slt         zero, s4, a2
                  mul         t3, s1, s3
                  auipc       s0, 946786
                  slti        s3, t4, 1862
                  c.add       a4, a1
                  andi        s7, s3, -1796
                  c.addi      a0, 3
                  mulhu       a5, s10, a3
                  srli        t4, t4, 16
                  ori         zero, s4, -1772
                  c.srli      a0, 17
                  c.addi      a6, 21
                  c.add       sp, a2
                  sll         s1, a4, t1
                  sra         s4, s6, t1
                  sub         a5, s6, gp
                  div         t3, a3, t6
                  or          a3, t4, s1
                  c.sub       a2, a2
                  rem         sp, s4, s9
                  c.li        ra, 4
                  addi        sp, a7, -1784
                  c.xor       a0, a3
                  div         zero, s6, t0
                  rem         s11, a3, zero
                  divu        ra, a0, s4
                  and         t5, t3, s5
                  rem         zero, s2, t4
                  srai        s10, s6, 30
                  addi        zero, a7, -1194
                  rem         a7, s0, a4
                  c.addi4spn  a0, sp, 192
                  c.slli      t1, 10
                  c.or        s0, s1
                  c.and       a0, a3
                  srli        s6, s10, 1
                  sra         s6, a0, s8
                  c.sub       a0, a0
                  c.add       s0, s8
                  xori        zero, t3, -1915
                  c.li        a7, -1
                  lui         s0, 373960
                  sltu        zero, tp, t1
                  c.addi16sp  sp, 16
                  c.slli      ra, 26
                  or          t5, s8, t0
                  div         zero, a2, a2
                  and         s4, t3, tp
                  nop
                  c.srli      a3, 25
                  rem         s0, s10, t5
                  div         s5, t3, s7
                  andi        t5, s5, -734
                  c.slli      a7, 14
                  andi        a4, s1, -1166
                  slli        s0, s8, 3
                  c.addi      t2, -1
                  c.nop
                  slt         gp, a1, t0
                  sltu        ra, a4, t3
                  c.addi      ra, -1
                  sra         s6, s6, s6
                  div         s1, t2, s11
                  c.mv        t1, s5
                  c.addi      a2, -1
                  sltu        sp, s4, t3
                  divu        t3, s2, t2
                  srli        t2, t4, 16
                  sltu        s11, sp, s5
                  add         tp, s2, a7
                  mulh        a5, a0, t4
                  xori        s4, s11, -64
                  c.addi4spn  a0, sp, 864
                  div         s10, t2, t0
                  c.lui       a0, 11
                  sra         s10, s1, s10
                  c.andi      a0, -1
                  c.and       a0, s0
                  srai        a0, t3, 29
                  c.srli      a2, 29
                  c.srai      a0, 21
                  auipc       s5, 592710
                  mul         zero, gp, t3
                  sltu        s1, s1, a7
                  c.lui       a3, 16
                  c.slli      a0, 18
                  lui         t5, 62280
                  ori         s2, s1, -939
                  srai        s9, a2, 2
                  or          s4, t0, gp
                  and         s0, s9, s9
                  li         t5, 0x1 #start riscv_int_numeric_corner_stream_0
                  li         t4, 0x1
                  li         t3, 0x0
                  li         s2, 0x34477309
                  li         s11, 0x29cc1cb8
                  li         tp, 0x7a257b28
                  li         s10, 0x42994cd1
                  li         a1, 0x0
                  li         a4, 0x1
                  li         a7, 0x7f917c0d
                  auipc       a2, 445953
                  divu        t5, a1, s7
                  c.lui       s6, 6
                  mul         a1, t6, a1
                  c.addi16sp  sp, -16
                  div         a7, t1, s10
                  auipc       t4, 779324
                  addi        zero, s9, -534
                  c.sub       a0, a1
                  c.nop
                  div         s11, s10, a5
                  mulhu       zero, a4, a0
                  sub         a6, a1, a3
                  sub         t5, a4, s1
                  c.addi16sp  sp, -16
                  c.add       a3, ra
                  c.addi4spn  a1, sp, 896
                  c.nop
                  c.li        s4, -1
                  auipc       a2, 86142
                  addi        zero, t0, 2009
                  c.li        a6, -1
                  divu        s5, s8, s0
                  rem         tp, s3, t2
                  nop #end riscv_int_numeric_corner_stream_0
                  c.addi      s1, -1
                  srl         zero, s4, s6
                  slt         s2, s4, s8
                  sltu        zero, t0, t1
                  c.xor       a0, a1
                  xor         zero, zero, s4
                  mulhsu      s6, s10, a1
                  srli        zero, t3, 7
                  c.mv        a0, a7
                  c.srli      a0, 3
                  c.nop
                  sltu        zero, s3, s11
                  c.and       a0, a3
                  c.addi16sp  sp, 176
                  and         zero, a1, s8
                  mulhu       zero, s11, t1
                  or          s2, s5, t5
                  c.li        a5, -1
                  sub         s1, ra, t6
                  c.addi4spn  a0, sp, 368
                  c.addi      s10, -1
                  c.nop
                  c.slli      s9, 1
                  sra         s5, a6, s7
                  c.andi      a0, -1
                  sra         a3, t2, a0
                  divu        a3, a6, t6
                  sltu        a5, t0, s10
                  sub         t1, s8, a4
                  divu        s9, ra, t5
                  auipc       s3, 495531
                  sra         a6, a2, t6
                  add         ra, gp, a1
                  mulh        a0, t6, s3
                  c.addi4spn  a0, sp, 16
                  c.sub       s1, a0
                  sra         a0, a3, zero
                  sub         a5, s8, a3
                  srl         t1, s0, s6
                  mulhsu      a1, ra, t1
                  c.addi      s0, 10
                  mulhsu      t4, a4, zero
                  c.addi4spn  a0, sp, 128
                  sltu        a2, tp, s6
                  mulhsu      tp, sp, gp
                  add         tp, ra, a5
                  c.add       t5, t2
                  addi        s2, t3, -785
                  srli        sp, t1, 21
                  li         t3, 0x26b3f6fe #start riscv_int_numeric_corner_stream_1
                  li         t5, 0x0
                  li         a5, 0xfe4981e
                  li         t2, 0x0
                  li         s9, 0x0
                  li         gp, 0x0
                  li         s11, 0x0
                  li         a2, 0x0
                  li         t4, 0x0
                  li         a4, 0x6dad4847
                  c.mv        ra, t1
                  rem         s7, s10, s5
                  mulhsu      t2, s6, s2
                  c.addi4spn  s1, sp, 528
                  mulhsu      a0, s7, a3
                  mulh        zero, s7, t3
                  lui         sp, 253004
                  c.li        s4, 11
                  sub         zero, a1, s4
                  c.sub       a3, a1
                  mul         s9, s9, t6
                  c.addi16sp  sp, -16
                  mul         s4, ra, tp
                  divu        a2, s11, gp
                  add         s1, a6, zero
                  c.lui       ra, 13
                  mulh        s0, t6, tp
                  div         s7, zero, tp
                  mulhsu      gp, t3, s1
                  addi        s0, a3, -111
                  mul         gp, t5, s8
                  c.addi      s1, 10
                  mul         a7, t4, s10 #end riscv_int_numeric_corner_stream_1
                  sll         s2, s5, t6
                  divu        a3, a4, s1
                  slti        gp, t5, -697
                  add         s1, a4, gp
                  divu        a0, s5, s2
                  srli        s6, a4, 12
                  c.xor       a3, a3
                  srai        a1, s9, 24
                  div         a7, zero, t6
                  sra         s0, tp, s7
                  mulhsu      a1, ra, s0
                  or          a0, s7, s10
                  sltu        t2, t3, s6
                  sltu        a4, ra, t4
                  mul         s11, s11, tp
                  c.mv        a3, a1
                  addi        s11, s0, 1434
                  mulh        t3, sp, t1
                  andi        s1, gp, 730
                  c.add       sp, t0
                  slt         zero, s6, t3
                  sll         s5, a2, t3
                  slt         zero, s1, a4
                  sll         ra, s2, gp
                  c.srli      a0, 29
                  c.addi16sp  sp, -16
                  add         s5, gp, t4
                  slti        a1, a7, -1116
                  c.mv        t3, sp
                  addi        s10, a3, 1504
                  c.slli      a2, 28
                  div         t2, s11, a0
                  xori        a1, sp, 913
                  xori        s1, a6, -1433
                  srl         a2, t6, s8
                  lui         a2, 454228
                  addi        t4, a0, 50
                  addi        a2, a4, 1333
                  sub         a2, a7, s1
                  c.xor       a0, s0
                  rem         a4, a5, s8
                  lui         t3, 857287
                  c.addi16sp  sp, 256
                  sll         zero, s0, s7
                  ori         zero, a1, -299
                  sub         a4, tp, s9
                  c.sub       a0, a1
                  c.addi16sp  sp, -16
                  c.or        a5, a5
                  sra         a1, t0, t5
                  c.nop
                  c.andi      a0, -1
                  xori        zero, gp, 489
                  c.addi16sp  sp, 384
                  sub         t3, a3, zero
                  slti        a7, t5, 284
                  and         s3, t4, s4
                  auipc       zero, 344974
                  srai        a4, a4, 25
                  or          tp, s1, t6
                  c.addi16sp  sp, -16
                  c.srli      a0, 28
                  c.andi      a2, -1
                  rem         a0, s0, s4
                  sltu        s1, s11, s8
                  sra         a5, a3, a5
                  c.sub       a0, a3
                  lui         s0, 8340
                  srli        t2, s1, 2
                  srl         gp, t6, t3
                  c.addi4spn  a2, sp, 384
                  mul         a6, zero, s3
                  c.nop
                  auipc       s1, 774237
                  slti        t5, s1, 675
                  addi        a5, s6, 1637
                  or          zero, tp, t4
                  nop
                  lui         sp, 693630
                  srl         s5, t2, a7
                  sll         s2, a3, s8
                  mulh        gp, s3, s5
                  mulh        zero, t3, s0
                  sltu        s0, s2, a1
                  c.addi4spn  a2, sp, 400
                  sltu        s3, a0, a3
                  ori         a0, s10, -1182
                  ori         ra, zero, -1427
                  mulhu       t5, zero, a2
                  divu        t2, a3, a3
                  c.addi4spn  a2, sp, 944
                  rem         s11, t3, a7
                  mulhsu      s6, s9, t0
                  div         zero, t1, t3
                  divu        tp, s8, s9
                  mulh        zero, t0, a4
                  xori        gp, a2, 1294
                  mul         a5, s11, s2
                  slli        s1, sp, 26
                  div         zero, a3, ra
                  c.add       s5, t0
                  c.srai      a2, 21
                  sltu        zero, t2, s1
                  sltu        t5, sp, t4
                  c.srai      a0, 8
                  mul         zero, s2, a0
                  or          s1, s9, a1
                  or          sp, s0, a7
                  sub         zero, a2, tp
                  sub         a6, s4, sp
                  or          t5, s10, sp
                  xori        s5, t1, -526
                  divu        s4, zero, s5
                  nop
                  ori         t1, t3, 1488
                  slli        t5, a5, 20
                  sra         zero, gp, s7
                  srl         a5, a7, t0
                  slt         tp, t6, a4
                  srai        s5, a6, 1
                  slti        gp, s8, -1184
                  andi        s1, t1, 1856
                  c.slli      t5, 6
                  ori         a3, a5, -913
                  ori         s10, s4, -1587
                  add         a2, t5, s1
                  mulh        t5, s5, a6
                  c.srai      a0, 6
                  sub         gp, s3, s5
                  c.addi16sp  sp, -16
                  c.slli      a6, 13
                  c.srai      a0, 3
                  auipc       a3, 64509
                  c.add       ra, t6
                  c.andi      a0, 6
                  xor         s0, s0, a3
                  c.or        a0, s1
                  mulhu       a3, gp, zero
                  c.lui       t5, 21
                  c.slli      t1, 12
                  sub         t5, gp, gp
                  slti        s10, a5, 893
                  or          zero, a4, sp
                  slti        zero, s1, 822
                  sltu        t1, s6, s5
                  slti        zero, a0, 601
                  c.srai      a0, 27
                  c.andi      a3, 0
                  sll         a2, t3, s2
                  c.sub       a2, a2
                  c.nop
                  nop
                  rem         zero, s10, s10
                  c.srai      a3, 9
                  c.add       a6, t5
                  c.xor       a0, a2
                  add         zero, s5, ra
                  srli        a3, zero, 22
                  slt         a6, a4, ra
                  c.srai      a3, 28
                  c.addi4spn  a5, sp, 576
                  c.sub       a3, a5
                  auipc       a3, 675200
                  c.and       a0, s1
                  c.lui       s4, 25
                  slti        zero, s1, 399
                  rem         s10, a0, t6
                  ori         zero, s10, 1584
                  and         s3, a1, a4
                  srai        a3, a5, 24
                  xor         a0, a2, t2
                  sll         t2, sp, t6
                  add         ra, t1, tp
                  divu        zero, t3, s9
                  c.addi      a3, 21
                  xori        t3, t0, 1100
                  addi        a5, t3, -739
                  ori         tp, s7, -767
                  c.srli      a0, 26
                  xor         t5, t5, zero
                  slt         sp, s10, s1
                  mulhu       s0, s1, a4
                  sltu        a5, a6, gp
                  c.andi      a0, -1
                  c.and       a0, a0
                  c.mv        a5, t4
                  mulh        t5, s5, gp
                  divu        a2, a7, t0
                  c.addi16sp  sp, 96
                  c.and       a2, a2
                  sub         zero, a1, t5
                  nop
                  c.addi      s9, 7
                  mul         t5, tp, zero
                  auipc       s6, 908862
                  c.or        a2, a0
                  c.addi      ra, 12
                  c.lui       a4, 22
                  lui         t1, 147279
                  lui         s3, 624801
                  sub         t5, s4, s9
                  or          s11, s10, a3
                  add         s10, gp, a1
                  c.addi      t5, 3
                  c.srli      a2, 23
                  srai        a4, s4, 6
                  xor         s10, s9, t1
                  divu        a1, sp, a6
                  c.slli      s6, 31
                  c.lui       s3, 8
                  mulh        a6, s5, a7
                  mulhsu      s6, t0, s10
                  sub         s9, s2, t1
                  c.or        a3, s1
                  ori         s4, t3, 1700
                  srli        s10, a2, 9
                  srli        a0, s4, 12
                  c.slli      ra, 31
                  c.mv        ra, s2
                  c.addi      s6, 10
                  add         a4, s7, t2
                  ori         a5, s1, -1916
                  slti        gp, s0, 1153
                  ori         a1, s8, -1936
                  div         s11, sp, t4
                  rem         t2, s3, s7
                  c.li        s4, 16
                  c.addi16sp  sp, 304
                  mul         a1, s5, s7
                  c.mv        a5, tp
                  auipc       t2, 919386
                  div         t2, zero, s1
                  divu        s7, a0, a2
                  andi        zero, s0, -223
                  andi        a4, s2, 1648
                  sub         s3, a3, a5
                  c.and       a2, a1
                  nop
                  xori        gp, s5, -1245
                  c.sub       s1, s1
                  lui         t4, 791337
                  slli        a2, a0, 4
                  xor         zero, t6, gp
                  divu        t4, zero, a0
                  rem         s1, s2, s9
                  or          a2, t2, s6
                  mulh        zero, t2, tp
                  slti        a0, a2, -68
                  lui         t2, 864687
                  c.lui       tp, 6
                  rem         ra, a5, tp
                  auipc       zero, 829325
                  sra         s1, s6, t6
                  c.srli      a3, 22
                  srai        zero, a0, 2
                  addi        a6, t4, 1782
                  lui         zero, 153542
                  mul         a2, s0, a2
                  sltu        s7, zero, s9
                  sra         a7, t3, s9
                  c.addi16sp  sp, -16
                  and         t1, s0, s4
                  c.addi16sp  sp, 448
                  and         a6, s5, a6
                  sll         t4, s5, s2
                  div         a3, s7, t0
                  auipc       s11, 7992
                  andi        s5, zero, -1386
                  sltu        gp, t2, t1
                  mul         t5, s6, a5
                  andi        a0, s4, -1138
                  lui         s10, 982813
                  sra         sp, s5, s1
                  xori        t5, a4, -287
                  la x24, test_done
                  jalr x0, x24, 0
test_done:        
                  li gp, 1
                  ecall
write_tohost:     
                  sw gp, tohost, t5

_exit:            
                  j write_tohost

instr_end:        
                  nop

.section .data
.align 6; .global tohost; tohost: .dword 0;
.align 6; .global fromhost; fromhost: .dword 0;
.section .user_stack,"aw",@progbits;
.align 2
user_stack_start:
.rept 4999
.4byte 0x0
.endr
user_stack_end:
.4byte 0x0
.align 2
kernel_instr_start:
.text
.align 2
mtvec_handler:    
                  csrrw x31, 0x340, x31
                  add x31, x5, zero
                  1: addi x31, x31, -124
                  sw x1, 4(x31)
                  sw x2, 8(x31)
                  sw x3, 12(x31)
                  sw x4, 16(x31)
                  sw x5, 20(x31)
                  sw x6, 24(x31)
                  sw x7, 28(x31)
                  sw x8, 32(x31)
                  sw x9, 36(x31)
                  sw x10, 40(x31)
                  sw x11, 44(x31)
                  sw x12, 48(x31)
                  sw x13, 52(x31)
                  sw x14, 56(x31)
                  sw x15, 60(x31)
                  sw x16, 64(x31)
                  sw x17, 68(x31)
                  sw x18, 72(x31)
                  sw x19, 76(x31)
                  sw x20, 80(x31)
                  sw x21, 84(x31)
                  sw x22, 88(x31)
                  sw x23, 92(x31)
                  sw x24, 96(x31)
                  sw x25, 100(x31)
                  sw x26, 104(x31)
                  sw x27, 108(x31)
                  sw x28, 112(x31)
                  sw x29, 116(x31)
                  sw x30, 120(x31)
                  sw x31, 124(x31)
                  csrr x30, 0x300 # MSTATUS
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 31
                  bne x30, x0, mmode_intr_handler

mmode_exception_handler:
                  csrr x30, 0x341 # MEPC
                  csrr x30, 0x342 # MCAUSE
                  li x22, 0xb # ECALL_MMODE
                  beq x30, x22, ecall_handler
                  li x22, 0x2 # ILLEGAL_INSTRUCTION
                  beq x30, x22, illegal_instr_handler
                  csrr x22, 0x343 # MTVAL
                  1: la x24, test_done
                  jalr x1, x24, 0

ecall_handler:    
                  la x30, _start
                  sw x0, 0(x30)
                  sw x1, 4(x30)
                  sw x2, 8(x30)
                  sw x3, 12(x30)
                  sw x4, 16(x30)
                  sw x5, 20(x30)
                  sw x6, 24(x30)
                  sw x7, 28(x30)
                  sw x8, 32(x30)
                  sw x9, 36(x30)
                  sw x10, 40(x30)
                  sw x11, 44(x30)
                  sw x12, 48(x30)
                  sw x13, 52(x30)
                  sw x14, 56(x30)
                  sw x15, 60(x30)
                  sw x16, 64(x30)
                  sw x17, 68(x30)
                  sw x18, 72(x30)
                  sw x19, 76(x30)
                  sw x20, 80(x30)
                  sw x21, 84(x30)
                  sw x22, 88(x30)
                  sw x23, 92(x30)
                  sw x24, 96(x30)
                  sw x25, 100(x30)
                  sw x26, 104(x30)
                  sw x27, 108(x30)
                  sw x28, 112(x30)
                  sw x29, 116(x30)
                  sw x30, 120(x30)
                  sw x31, 124(x30)
                  la x24, write_tohost
                  jalr x0, x24, 0

illegal_instr_handler:
                  csrr  x30, 0x341
                  addi  x30, x30, 4
                  csrw  0x341, x30
                  lw x1, 4(x31)
                  lw x2, 8(x31)
                  lw x3, 12(x31)
                  lw x4, 16(x31)
                  lw x5, 20(x31)
                  lw x6, 24(x31)
                  lw x7, 28(x31)
                  lw x8, 32(x31)
                  lw x9, 36(x31)
                  lw x10, 40(x31)
                  lw x11, 44(x31)
                  lw x12, 48(x31)
                  lw x13, 52(x31)
                  lw x14, 56(x31)
                  lw x15, 60(x31)
                  lw x16, 64(x31)
                  lw x17, 68(x31)
                  lw x18, 72(x31)
                  lw x19, 76(x31)
                  lw x20, 80(x31)
                  lw x21, 84(x31)
                  lw x22, 88(x31)
                  lw x23, 92(x31)
                  lw x24, 96(x31)
                  lw x25, 100(x31)
                  lw x26, 104(x31)
                  lw x27, 108(x31)
                  lw x28, 112(x31)
                  lw x29, 116(x31)
                  lw x30, 120(x31)
                  lw x31, 124(x31)
                  addi x31, x31, 124
                  add x5, x31, zero
                  csrrw x31, 0x340, x31
                  mret

pt_fault_handler: 

.align 2
mmode_intr_handler:
                  csrr  x30, 0x300 # MSTATUS;
                  csrr  x30, 0x304 # MIE;
                  csrr  x30, 0x344 # MIP;
                  csrrc x30, 0x344, x30 # MIP;
                  lw x1, 4(x31)
                  lw x2, 8(x31)
                  lw x3, 12(x31)
                  lw x4, 16(x31)
                  lw x5, 20(x31)
                  lw x6, 24(x31)
                  lw x7, 28(x31)
                  lw x8, 32(x31)
                  lw x9, 36(x31)
                  lw x10, 40(x31)
                  lw x11, 44(x31)
                  lw x12, 48(x31)
                  lw x13, 52(x31)
                  lw x14, 56(x31)
                  lw x15, 60(x31)
                  lw x16, 64(x31)
                  lw x17, 68(x31)
                  lw x18, 72(x31)
                  lw x19, 76(x31)
                  lw x20, 80(x31)
                  lw x21, 84(x31)
                  lw x22, 88(x31)
                  lw x23, 92(x31)
                  lw x24, 96(x31)
                  lw x25, 100(x31)
                  lw x26, 104(x31)
                  lw x27, 108(x31)
                  lw x28, 112(x31)
                  lw x29, 116(x31)
                  lw x30, 120(x31)
                  lw x31, 124(x31)
                  addi x31, x31, 124
                  add x5, x31, zero
                  csrrw x31, 0x340, x31
                  mret;

kernel_instr_end: nop
.align 2
kernel_data_start:
.section .kernel_stack,"aw",@progbits;
.align 2
kernel_stack_start:
.rept 4999
.4byte 0x0
.endr
kernel_stack_end:
.4byte 0x0
