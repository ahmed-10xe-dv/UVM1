.include "user_define.h"
.globl _start
.section .text
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x8, h0_start
jalr x0, x8, 0
h0_start:
                  li x30, 0x40001104
                  csrw 0x301, x30
kernel_sp:        
                  la x31, kernel_stack_end

trap_vec_init:    
                  la x30, mtvec_handler
                  ori x30, x30, 1
                  csrw 0x305, x30 # MTVEC

mepc_setup:       
                  la x30, init
                  csrw 0x341, x30

init_machine_mode:
                  li x30, 0x1800
                  csrw 0x300, x30 # MSTATUS
                  li x30, 0x0
                  csrw 0x304, x30 # MIE
                  mret
init:             
                  li x0, 0x80000000
                  li x1, 0x1
                  li x2, 0x4ca74cac
                  li x3, 0x791301f2
                  li x4, 0x80000000
                  li x5, 0xfd1e9647
                  li x6, 0xf8630e8f
                  li x7, 0x38117a89
                  li x8, 0xf5f1f7c3
                  li x9, 0x8305241c
                  li x10, 0xfc6f6745
                  li x12, 0x3
                  li x13, 0x0
                  li x14, 0xfca48881
                  li x15, 0x7
                  li x16, 0x80000000
                  li x17, 0xfc5f0e53
                  li x18, 0xb
                  li x19, 0x0
                  li x20, 0x32d85fd5
                  li x21, 0xfd680628
                  li x22, 0x80000000
                  li x23, 0xfc04ecdc
                  li x24, 0x80000000
                  li x25, 0x3
                  li x26, 0xf860a1bd
                  li x27, 0xf69ff54b
                  li x28, 0xde6cba8b
                  li x29, 0x0
                  li x30, 0xf4edbc71
                  la x11, user_stack_end
main:             srai        s4, a1, 15
                  or          s4, s1, s6
                  ori         tp, tp, 1243
                  c.mv        s8, a3
                  add         s8, a1, ra
                  mul         a5, s1, a3
                  c.lui       a3, 16
                  add         zero, s6, a1
                  slt         ra, t6, a3
                  div         zero, t3, s0
                  srai        s5, t3, 1
                  srl         t3, a5, tp
                  c.xor       a2, a1
                  nop
                  c.add       t2, a7
                  slti        zero, t2, 1353
                  rem         a7, a4, s0
                  c.addi      a2, -1
                  c.andi      a3, -1
                  c.slli      a2, 20
                  nop
                  c.lui       s7, 31
                  c.andi      a0, 11
                  c.add       s4, s6
                  c.slli      s5, 23
                  c.slli      ra, 10
                  mulh        s8, s8, s0
                  c.mv        s1, s7
                  srl         a7, s0, s1
                  nop
                  or          s9, s1, a1
                  xor         s11, sp, t0
                  lui         s5, 249848
                  c.andi      a2, 11
                  nop
                  mul         s11, t6, a2
                  rem         s9, s5, s7
                  sra         s3, s10, s0
                  c.slli      a3, 28
                  c.li        a5, 5
                  add         zero, s0, t6
                  ori         ra, t3, 2027
                  c.slli      tp, 16
                  c.add       s10, t0
                  div         s9, s9, t6
                  or          zero, gp, a1
                  c.lui       t1, 21
                  divu        s5, gp, a5
                  divu        s10, s10, s3
                  c.srai      a2, 2
                  lui         t0, 219380
                  sub         s8, t2, s9
                  mulhu       s7, gp, s5
                  c.srli      a0, 29
                  c.andi      a0, 11
                  c.add       s10, s3
                  xori        t1, a6, -429
                  c.add       ra, a2
                  auipc       a4, 31109
                  mul         gp, s5, ra
                  xori        zero, a0, -675
                  srli        s1, a1, 1
                  ori         t2, s8, 371
                  andi        s1, s11, 304
                  c.and       a3, a3
                  xor         sp, s2, zero
                  add         a5, s6, s10
                  or          a0, gp, t2
                  or          s7, a0, a0
                  c.sub       a2, s1
                  nop
                  ori         zero, t2, 1807
                  srl         zero, zero, s10
                  c.sub       a2, a2
                  divu        s1, t5, a7
                  mulhsu      s1, s3, a3
                  srl         s10, s3, tp
                  andi        zero, zero, 1534
                  or          a7, gp, s4
                  mulhsu      s9, s9, t3
                  add         t2, t0, s6
                  c.nop
                  c.lui       s10, 28
                  c.mv        a3, sp
                  c.andi      a2, 13
                  c.sub       a2, a3
                  xor         a0, t1, gp
                  c.li        ra, -1
                  mulhsu      a2, t6, a6
                  and         gp, s5, t6
                  xori        a7, a6, 712
                  sltu        s8, s11, s8
                  xori        t0, s1, 605
                  mulhsu      s9, zero, ra
                  divu        gp, a6, s11
                  andi        s8, a0, -1535
                  c.li        a3, -1
                  c.mv        ra, t1
                  c.nop
                  c.lui       ra, 27
                  xor         s4, t1, a2
                  div         t3, a5, t4
                  lui         zero, 433625
                  or          a0, a7, a5
                  c.andi      a0, -1
                  c.srli      a0, 26
                  nop
                  sltu        s9, ra, a5
                  sll         s2, t0, ra
                  c.srli      a2, 18
                  c.add       a0, a3
                  c.addi16sp  sp, -16
                  auipc       zero, 70147
                  xor         s11, t3, zero
                  c.mv        t5, a1
                  mul         t2, t2, s10
                  c.slli      s3, 29
                  mulhsu      ra, zero, s0
                  auipc       s5, 593577
                  ori         s4, t2, 1681
                  mul         s2, tp, s1
                  srl         zero, t6, t0
                  add         s9, s1, t4
                  sltu        tp, sp, s7
                  sra         s5, t5, a4
                  ori         a4, s3, 72
                  mulh        s4, t1, gp
                  div         sp, a5, a1
                  c.nop
                  c.slli      s7, 4
                  mulhu       t2, a1, a4
                  sltiu       t5, a5, 62
                  divu        s10, a2, a1
                  srai        s2, t4, 29
                  add         t0, s0, t5
                  ori         a3, t1, 359
                  add         s6, t6, a7
                  sra         s5, s5, s0
                  xori        s4, ra, -840
                  or          zero, a5, t5
                  srli        gp, s1, 15
                  xor         s10, s2, s9
                  mulhsu      a7, a5, s1
                  nop
                  sra         ra, s4, a7
                  c.sub       a2, a2
                  srli        a2, s9, 14
                  rem         zero, t1, t0
                  divu        zero, a3, s2
                  c.xor       a0, a2
                  c.and       a2, a2
                  addi        t2, gp, 1219
                  mulhsu      t1, s7, tp
                  mulhsu      s5, ra, s9
                  addi        t4, gp, -1432
                  lui         s2, 460026
                  slti        t4, s1, 1217
                  c.lui       s8, 5
                  srai        ra, s9, 9
                  srl         t3, a2, t6
                  c.srai      s1, 22
                  mulh        a3, s0, a5
                  divu        zero, s8, s1
                  c.nop
                  addi        zero, s5, -668
                  slt         a5, s9, s0
                  c.lui       a6, 5
                  ori         t0, t5, -291
                  mulh        t1, a1, s7
                  srl         zero, t3, zero
                  slti        zero, t4, 618
                  c.slli      ra, 30
                  srl         zero, s5, s0
                  c.nop
                  or          zero, tp, s8
                  ori         s9, t1, -21
                  andi        s9, gp, -220
                  or          a2, t0, s8
                  c.mv        a2, sp
                  sll         s4, t2, a4
                  addi        zero, a1, 1776
                  xori        t0, t1, 307
                  c.sub       a2, a4
                  sll         a7, ra, s8
                  c.addi      a3, 3
                  auipc       s8, 901693
                  and         t5, s8, s2
                  sltu        a2, t1, a6
                  c.lui       s3, 24
                  c.andi      a2, -1
                  addi        zero, a4, -97
                  c.srai      s1, 1
                  c.addi16sp  sp, 448
                  lui         t0, 949949
                  sltu        s4, s3, s4
                  c.andi      a5, 0
                  c.nop
                  c.add       a0, t1
                  div         sp, s9, t1
                  mul         a6, s10, ra
                  addi        s9, a0, -936
                  ori         a4, s1, 800
                  c.sub       a2, a1
                  srai        zero, s8, 11
                  andi        a7, s10, -427
                  c.nop
                  sltiu       t2, s6, 1741
                  or          s11, zero, s6
                  c.srai      s1, 16
                  sltiu       zero, a7, 1616
                  srl         t1, s0, s6
                  c.or        a0, s1
                  slli        s4, s1, 24
                  and         s6, t3, t1
                  addi        zero, s0, 733
                  sll         t5, sp, sp
                  add         zero, a7, s7
                  c.addi4spn  a5, sp, 816
                  c.mv        a2, s9
                  rem         a5, t5, s6
                  sub         s11, gp, t6
                  sra         s5, a7, s5
                  auipc       a0, 786550
                  ori         s5, a2, -502
                  slti        t3, sp, -726
                  sltiu       s10, a6, -534
                  slli        s10, t4, 17
                  c.addi      s5, -1
                  or          t0, a6, zero
                  sltiu       zero, a4, 277
                  srli        a3, zero, 5
                  slli        a5, tp, 20
                  and         s7, s1, a3
                  sll         zero, t1, a5
                  li         t5, 0x73d8af81 #start riscv_int_numeric_corner_stream_0
                  li         t4, 0x0
                  li         t3, 0x1697d89b
                  li         a0, 0xbd37762
                  li         s11, 0x6a5ed207
                  li         s3, 0x1
                  li         s7, 0x4c3dcf68
                  li         t0, 0x0
                  li         a3, 0x1
                  li         a5, 0x0
                  add         s2, s6, s5
                  nop
                  c.lui       s2, 8
                  divu        s9, s9, s7
                  c.addi      s10, -1
                  nop
                  div         t3, s2, s10
                  c.addi4spn  a0, sp, 592
                  add         t5, a1, s8
                  mulh        ra, s9, t1
                  addi        a5, a1, -61
                  c.lui       s3, 5
                  c.addi16sp  sp, -16
                  sub         s1, s8, s6
                  c.add       a0, a6
                  c.addi4spn  a3, sp, 528
                  rem         sp, s2, s7
                  nop
                  c.nop
                  nop
                  lui         s3, 185800
                  c.sub       a0, a0
                  c.li        a5, -1
                  auipc       zero, 659747 #end riscv_int_numeric_corner_stream_0
                  srli        zero, sp, 2
                  c.srli      a2, 9
                  addi        s3, s2, 426
                  mulhu       t3, s5, s8
                  lui         a5, 60622
                  c.addi      gp, 10
                  c.nop
                  mulh        s4, s11, t2
                  div         a3, a4, gp
                  c.srli      a0, 3
                  divu        a3, sp, a1
                  addi        s9, s9, -1328
                  mulhu       s2, a5, a6
                  nop
                  srli        a3, a4, 23
                  sll         a4, a0, zero
                  addi        s6, s8, -1016
                  ori         ra, s4, -244
                  slt         t2, s9, t2
                  ori         zero, a2, -1474
                  c.mv        t3, t3
                  sra         t3, a7, s4
                  add         s2, tp, tp
                  c.srli      a3, 1
                  c.add       ra, t2
                  slt         s9, a3, gp
                  mulhsu      t1, gp, t3
                  c.add       s11, s4
                  slti        s2, a1, -1539
                  ori         t1, a2, -1234
                  c.or        a4, a0
                  c.or        a2, a0
                  c.addi      gp, 15
                  c.addi4spn  a0, sp, 464
                  c.xor       a2, a0
                  c.andi      a2, -1
                  mulh        a3, t3, t4
                  mulhu       zero, gp, t0
                  lui         t0, 805137
                  c.srli      a0, 13
                  lui         a6, 53514
                  and         s3, s0, t6
                  auipc       t0, 955091
                  addi        t2, t3, 369
                  c.addi16sp  sp, -16
                  andi        sp, tp, 1487
                  c.and       a2, a2
                  sltiu       tp, s0, 1819
                  srli        t2, t1, 17
                  slt         t4, t4, a7
                  c.srai      a3, 5
                  add         ra, s8, t6
                  slli        zero, a0, 31
                  xori        s8, gp, -298
                  lui         a7, 732472
                  c.add       a0, t3
                  c.li        a2, 11
                  sltu        s4, s0, t0
                  c.lui       s11, 25
                  srli        s9, t3, 29
                  divu        s7, a1, s8
                  divu        s7, a7, a1
                  c.srli      a2, 12
                  c.add       tp, sp
                  divu        s5, t1, t4
                  c.lui       s11, 21
                  srl         s10, s9, s6
                  c.addi      t5, 9
                  mulhu       s2, ra, a1
                  div         s2, a5, s8
                  c.addi      a2, -1
                  auipc       t3, 97679
                  c.srai      a4, 5
                  and         a6, t1, s4
                  c.or        a2, s0
                  c.addi4spn  a0, sp, 400
                  nop
                  c.srai      a2, 1
                  srl         s2, ra, s6
                  xor         a5, s11, a6
                  slt         ra, s10, s2
                  c.xor       a0, a1
                  rem         t3, a5, a6
                  nop
                  c.or        a2, a1
                  srai        s7, s9, 5
                  mulhu       gp, s9, s7
                  mulhsu      s3, a1, s11
                  c.srli      a2, 24
                  c.mv        s4, s5
                  c.slli      s8, 5
                  sltu        t3, t6, t0
                  sll         s3, s8, s11
                  c.addi      s8, 20
                  c.li        a7, -1
                  c.mv        s5, s10
                  or          t1, s1, s2
                  srl         zero, s11, zero
                  c.or        a2, s1
                  c.nop
                  c.or        a0, s1
                  c.srli      a3, 25
                  slt         s2, s10, tp
                  xor         a6, a0, s7
                  slt         s7, sp, a5
                  auipc       gp, 205631
                  addi        a2, s4, -834
                  c.li        ra, 16
                  sub         t2, a3, zero
                  and         s8, a6, s1
                  addi        s11, a5, -109
                  and         a3, s9, s0
                  c.or        a2, s0
                  mul         s11, a0, a5
                  c.srli      a2, 28
                  c.add       ra, t5
                  c.addi      s2, -1
                  c.addi4spn  a2, sp, 288
                  slti        a7, sp, 1641
                  sltiu       s4, s10, 433
                  c.xor       a0, a1
                  c.sub       s1, a2
                  srai        s7, a4, 4
                  lui         s5, 360096
                  c.slli      t2, 21
                  c.addi4spn  a2, sp, 864
                  auipc       a6, 420099
                  c.or        a2, a2
                  slt         a2, s7, a2
                  slli        a6, sp, 18
                  c.nop
                  c.mv        a3, a4
                  mulh        s3, s9, t5
                  c.srai      a0, 31
                  c.slli      s3, 15
                  ori         zero, s2, -1817
                  ori         zero, t1, -2011
                  rem         ra, t5, s9
                  c.or        a0, a3
                  slti        a6, s9, 960
                  add         zero, gp, a0
                  andi        s2, s9, -978
                  addi        s8, t4, -1558
                  xor         a7, s10, t4
                  slti        a4, gp, -940
                  srl         t2, s7, s3
                  divu        sp, t3, s0
                  c.or        a3, s1
                  or          a6, t0, t2
                  c.and       a5, a3
                  xor         s1, t0, s9
                  c.add       s10, s10
                  auipc       s4, 51786
                  slti        s5, t0, 987
                  sra         t4, s9, a0
                  auipc       t4, 248632
                  divu        zero, a2, gp
                  c.addi16sp  sp, -16
                  li         t5, 0x1 #start riscv_int_numeric_corner_stream_1
                  li         t4, 0x0
                  li         s3, 0x0
                  li         s5, 0x7d9452f5
                  li         t3, 0x1
                  li         a4, 0x151abb16
                  li         a6, 0x36b1044d
                  li         a2, 0x1
                  li         s8, 0x0
                  li         s9, 0x0
                  c.addi      s2, 9
                  add         s6, t1, a6
                  addi        a3, s4, -1125
                  c.addi4spn  a2, sp, 880
                  mulh        s3, s3, t2
                  c.nop
                  c.add       a7, t3
                  nop
                  c.sub       s1, a1
                  rem         t3, zero, s2
                  c.addi16sp  sp, 320
                  mul         s10, gp, a3
                  c.addi      s5, 4
                  c.mv        t4, t1
                  div         a3, s6, s8
                  c.nop
                  c.li        s9, -1
                  nop
                  c.add       s5, a2
                  c.add       s11, a2
                  c.nop
                  c.addi      s3, 29
                  c.lui       s6, 8
                  c.li        ra, -1
                  mulhsu      gp, zero, ra
                  andi        ra, s8, -498
                  c.nop
                  auipc       s4, 290053
                  c.addi      t3, 12
                  c.slli      s4, 1
                  xor         a2, a4, t6
                  rem         zero, s2, gp
                  c.addi16sp  sp, 224
                  c.slli      a4, 21
                  ori         s8, tp, 1931
                  mul         s11, ra, s2
                  srl         zero, s1, t2
                  c.add       ra, s5
                  sra         s2, s11, s6
                  c.or        a5, a1
                  ori         zero, s1, -1310
                  c.slli      ra, 23
                  slli        t1, t4, 13
                  srli        s9, t2, 2
                  mulhu       a0, s3, a2
                  and         s1, sp, a2
                  c.add       a3, s0
                  c.srli      a2, 16
                  sltiu       t0, s4, -1545
                  mulhsu      s2, a7, s6
                  sltiu       zero, a5, 1567
                  xori        s5, zero, -349
                  c.add       a0, ra
                  ori         s1, t3, -1309
                  divu        s8, s4, t6
                  srli        zero, tp, 29
                  nop
                  slli        ra, a1, 0
                  c.andi      a0, 25
                  div         s8, tp, s9
                  or          zero, s6, gp
                  sub         t2, t0, sp
                  srai        a7, t1, 18
                  slt         s8, a0, s1
                  c.xor       a3, s0
                  mulhu       s10, ra, s11
                  c.addi16sp  sp, 240
                  add         s8, s10, t2
                  slli        zero, s0, 30
                  addi        zero, t5, -342
                  div         tp, a1, a1
                  sltu        s1, s7, a5
                  ori         s7, s7, -478
                  mul         s2, t0, ra
                  srl         s6, t2, a3
                  nop
                  sltiu       s1, s1, 1761
                  c.addi      ra, -1
                  divu        a6, a6, a1
                  sra         s2, zero, a4
                  add         a5, t6, t2
                  div         tp, s4, a2
                  addi        a6, a2, 71
                  andi        s2, s0, 5
                  or          s4, s0, t5
                  nop
                  c.sub       a2, s0
                  auipc       s4, 239360
                  srl         a3, s7, a1
                  c.nop
                  slti        t2, a6, 814
                  c.and       a2, s0
                  c.addi16sp  sp, -16
                  sltiu       zero, s0, -1909
                  c.lui       s1, 6
                  auipc       ra, 407028
                  addi        gp, a1, 772
                  sltu        s4, a1, a6
                  or          t1, a5, s4
                  c.xor       a2, a1
                  mulh        s7, a6, t0
                  slli        sp, s5, 17
                  sll         t3, s3, s10
                  and         a6, t2, zero
                  sltiu       t4, t3, 13
                  c.li        a5, -1
                  nop
                  xori        tp, gp, -1186
                  c.li        s5, 13
                  div         zero, s9, s1
                  nop
                  c.addi16sp  sp, -16
                  div         s8, t3, s9
                  sll         t3, s6, a4
                  auipc       zero, 63460
                  div         s5, s1, t2
                  mulh        s11, s0, a4
                  or          sp, s2, s0
                  sll         a7, s7, a7
                  rem         ra, zero, s4
                  sub         a6, s11, a1
                  andi        s7, s0, 1205
                  divu        t0, s8, gp
                  c.and       a2, a3
                  c.li        s4, 30
                  c.and       a0, a2
                  c.nop
                  xori        t2, s2, 297
                  mulh        t3, t6, tp
                  addi        t1, a3, -1970
                  c.srai      a2, 20
                  mul         a3, a3, a0
                  xori        zero, t4, -1189
                  nop
                  mulhu       a4, t2, a4
                  sll         a6, s8, s11
                  c.and       a3, a1
                  c.nop
                  andi        zero, a2, -1188
                  c.add       s3, t4
                  mulh        tp, t1, t5
                  div         zero, a6, t2
                  c.mv        s2, s9
                  mulhu       t4, zero, s7
                  c.addi16sp  sp, -16
                  sra         s6, a1, a0
                  sub         s2, a2, s4
                  slti        gp, s1, 787
                  c.and       a2, s1
                  nop
                  mulh        zero, zero, s9
                  sub         s6, t6, s4
                  ori         zero, t0, 1528
                  sra         a6, t5, tp
                  and         a6, a0, a7
                  xor         s1, s8, s3
                  c.addi16sp  sp, -16
                  slli        s6, zero, 14
                  c.addi4spn  a2, sp, 784
                  sll         zero, s1, sp
                  xor         ra, s8, ra
                  xori        a2, s0, 356
                  c.srai      a3, 16
                  sltu        a3, s6, s5
                  slti        s9, t0, 1826
                  sltiu       zero, s6, -848
                  div         zero, s2, a1
                  c.li        t5, 13
                  nop
                  srai        s6, tp, 24
                  and         zero, t2, t4
                  addi        s7, t2, -1222
                  c.and       a2, a4
                  divu        a0, s9, zero
                  slt         t5, s3, s5
                  sra         s6, tp, t3
                  c.andi      a2, 15
                  c.add       a2, ra
                  nop
                  andi        s10, t0, -1660
                  mulhsu      s8, t3, t0
                  mulh        a0, s5, t0
                  c.nop
                  c.addi16sp  sp, -16
                  c.xor       a0, a1
                  andi        a5, a7, 1625
                  c.lui       t3, 27
                  c.add       ra, t4
                  slt         sp, ra, zero
                  slt         sp, a4, t2
                  c.addi      s7, -1
                  slli        ra, a5, 18
                  c.addi16sp  sp, -16
                  xor         s6, ra, t0
                  c.addi      ra, -1
                  addi        s1, ra, -664
                  and         a5, s8, s5
                  c.lui       s3, 19
                  div         s9, a6, s1
                  addi        s3, s6, -901
                  c.nop
                  ori         t1, sp, 1349
                  c.addi4spn  a3, sp, 656
                  mulh        gp, t2, tp
                  xori        s4, ra, 1459
                  c.slli      tp, 30
                  mulhu       zero, t4, a7
                  c.lui       s6, 28
                  c.sub       a3, a3
                  la x8, test_done
                  jalr x0, x8, 0
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
mmode_intr_vector_1:
                  csrrw x11, 0x340, x11
                  add x11, x31, zero
                  1: addi x11, x11, -124
                  sw x1, 4(x11)
                  sw x2, 8(x11)
                  sw x3, 12(x11)
                  sw x4, 16(x11)
                  sw x5, 20(x11)
                  sw x6, 24(x11)
                  sw x7, 28(x11)
                  sw x8, 32(x11)
                  sw x9, 36(x11)
                  sw x10, 40(x11)
                  sw x11, 44(x11)
                  sw x12, 48(x11)
                  sw x13, 52(x11)
                  sw x14, 56(x11)
                  sw x15, 60(x11)
                  sw x16, 64(x11)
                  sw x17, 68(x11)
                  sw x18, 72(x11)
                  sw x19, 76(x11)
                  sw x20, 80(x11)
                  sw x21, 84(x11)
                  sw x22, 88(x11)
                  sw x23, 92(x11)
                  sw x24, 96(x11)
                  sw x25, 100(x11)
                  sw x26, 104(x11)
                  sw x27, 108(x11)
                  sw x28, 112(x11)
                  sw x29, 116(x11)
                  sw x30, 120(x11)
                  sw x31, 124(x11)
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_2:
                  csrrw x11, 0x340, x11
                  add x11, x31, zero
                  1: addi x11, x11, -124
                  sw x1, 4(x11)
                  sw x2, 8(x11)
                  sw x3, 12(x11)
                  sw x4, 16(x11)
                  sw x5, 20(x11)
                  sw x6, 24(x11)
                  sw x7, 28(x11)
                  sw x8, 32(x11)
                  sw x9, 36(x11)
                  sw x10, 40(x11)
                  sw x11, 44(x11)
                  sw x12, 48(x11)
                  sw x13, 52(x11)
                  sw x14, 56(x11)
                  sw x15, 60(x11)
                  sw x16, 64(x11)
                  sw x17, 68(x11)
                  sw x18, 72(x11)
                  sw x19, 76(x11)
                  sw x20, 80(x11)
                  sw x21, 84(x11)
                  sw x22, 88(x11)
                  sw x23, 92(x11)
                  sw x24, 96(x11)
                  sw x25, 100(x11)
                  sw x26, 104(x11)
                  sw x27, 108(x11)
                  sw x28, 112(x11)
                  sw x29, 116(x11)
                  sw x30, 120(x11)
                  sw x31, 124(x11)
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_3:
                  csrrw x11, 0x340, x11
                  add x11, x31, zero
                  1: addi x11, x11, -124
                  sw x1, 4(x11)
                  sw x2, 8(x11)
                  sw x3, 12(x11)
                  sw x4, 16(x11)
                  sw x5, 20(x11)
                  sw x6, 24(x11)
                  sw x7, 28(x11)
                  sw x8, 32(x11)
                  sw x9, 36(x11)
                  sw x10, 40(x11)
                  sw x11, 44(x11)
                  sw x12, 48(x11)
                  sw x13, 52(x11)
                  sw x14, 56(x11)
                  sw x15, 60(x11)
                  sw x16, 64(x11)
                  sw x17, 68(x11)
                  sw x18, 72(x11)
                  sw x19, 76(x11)
                  sw x20, 80(x11)
                  sw x21, 84(x11)
                  sw x22, 88(x11)
                  sw x23, 92(x11)
                  sw x24, 96(x11)
                  sw x25, 100(x11)
                  sw x26, 104(x11)
                  sw x27, 108(x11)
                  sw x28, 112(x11)
                  sw x29, 116(x11)
                  sw x30, 120(x11)
                  sw x31, 124(x11)
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_4:
                  csrrw x11, 0x340, x11
                  add x11, x31, zero
                  1: addi x11, x11, -124
                  sw x1, 4(x11)
                  sw x2, 8(x11)
                  sw x3, 12(x11)
                  sw x4, 16(x11)
                  sw x5, 20(x11)
                  sw x6, 24(x11)
                  sw x7, 28(x11)
                  sw x8, 32(x11)
                  sw x9, 36(x11)
                  sw x10, 40(x11)
                  sw x11, 44(x11)
                  sw x12, 48(x11)
                  sw x13, 52(x11)
                  sw x14, 56(x11)
                  sw x15, 60(x11)
                  sw x16, 64(x11)
                  sw x17, 68(x11)
                  sw x18, 72(x11)
                  sw x19, 76(x11)
                  sw x20, 80(x11)
                  sw x21, 84(x11)
                  sw x22, 88(x11)
                  sw x23, 92(x11)
                  sw x24, 96(x11)
                  sw x25, 100(x11)
                  sw x26, 104(x11)
                  sw x27, 108(x11)
                  sw x28, 112(x11)
                  sw x29, 116(x11)
                  sw x30, 120(x11)
                  sw x31, 124(x11)
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_5:
                  csrrw x11, 0x340, x11
                  add x11, x31, zero
                  1: addi x11, x11, -124
                  sw x1, 4(x11)
                  sw x2, 8(x11)
                  sw x3, 12(x11)
                  sw x4, 16(x11)
                  sw x5, 20(x11)
                  sw x6, 24(x11)
                  sw x7, 28(x11)
                  sw x8, 32(x11)
                  sw x9, 36(x11)
                  sw x10, 40(x11)
                  sw x11, 44(x11)
                  sw x12, 48(x11)
                  sw x13, 52(x11)
                  sw x14, 56(x11)
                  sw x15, 60(x11)
                  sw x16, 64(x11)
                  sw x17, 68(x11)
                  sw x18, 72(x11)
                  sw x19, 76(x11)
                  sw x20, 80(x11)
                  sw x21, 84(x11)
                  sw x22, 88(x11)
                  sw x23, 92(x11)
                  sw x24, 96(x11)
                  sw x25, 100(x11)
                  sw x26, 104(x11)
                  sw x27, 108(x11)
                  sw x28, 112(x11)
                  sw x29, 116(x11)
                  sw x30, 120(x11)
                  sw x31, 124(x11)
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_6:
                  csrrw x11, 0x340, x11
                  add x11, x31, zero
                  1: addi x11, x11, -124
                  sw x1, 4(x11)
                  sw x2, 8(x11)
                  sw x3, 12(x11)
                  sw x4, 16(x11)
                  sw x5, 20(x11)
                  sw x6, 24(x11)
                  sw x7, 28(x11)
                  sw x8, 32(x11)
                  sw x9, 36(x11)
                  sw x10, 40(x11)
                  sw x11, 44(x11)
                  sw x12, 48(x11)
                  sw x13, 52(x11)
                  sw x14, 56(x11)
                  sw x15, 60(x11)
                  sw x16, 64(x11)
                  sw x17, 68(x11)
                  sw x18, 72(x11)
                  sw x19, 76(x11)
                  sw x20, 80(x11)
                  sw x21, 84(x11)
                  sw x22, 88(x11)
                  sw x23, 92(x11)
                  sw x24, 96(x11)
                  sw x25, 100(x11)
                  sw x26, 104(x11)
                  sw x27, 108(x11)
                  sw x28, 112(x11)
                  sw x29, 116(x11)
                  sw x30, 120(x11)
                  sw x31, 124(x11)
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_7:
                  csrrw x11, 0x340, x11
                  add x11, x31, zero
                  1: addi x11, x11, -124
                  sw x1, 4(x11)
                  sw x2, 8(x11)
                  sw x3, 12(x11)
                  sw x4, 16(x11)
                  sw x5, 20(x11)
                  sw x6, 24(x11)
                  sw x7, 28(x11)
                  sw x8, 32(x11)
                  sw x9, 36(x11)
                  sw x10, 40(x11)
                  sw x11, 44(x11)
                  sw x12, 48(x11)
                  sw x13, 52(x11)
                  sw x14, 56(x11)
                  sw x15, 60(x11)
                  sw x16, 64(x11)
                  sw x17, 68(x11)
                  sw x18, 72(x11)
                  sw x19, 76(x11)
                  sw x20, 80(x11)
                  sw x21, 84(x11)
                  sw x22, 88(x11)
                  sw x23, 92(x11)
                  sw x24, 96(x11)
                  sw x25, 100(x11)
                  sw x26, 104(x11)
                  sw x27, 108(x11)
                  sw x28, 112(x11)
                  sw x29, 116(x11)
                  sw x30, 120(x11)
                  sw x31, 124(x11)
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_8:
                  csrrw x11, 0x340, x11
                  add x11, x31, zero
                  1: addi x11, x11, -124
                  sw x1, 4(x11)
                  sw x2, 8(x11)
                  sw x3, 12(x11)
                  sw x4, 16(x11)
                  sw x5, 20(x11)
                  sw x6, 24(x11)
                  sw x7, 28(x11)
                  sw x8, 32(x11)
                  sw x9, 36(x11)
                  sw x10, 40(x11)
                  sw x11, 44(x11)
                  sw x12, 48(x11)
                  sw x13, 52(x11)
                  sw x14, 56(x11)
                  sw x15, 60(x11)
                  sw x16, 64(x11)
                  sw x17, 68(x11)
                  sw x18, 72(x11)
                  sw x19, 76(x11)
                  sw x20, 80(x11)
                  sw x21, 84(x11)
                  sw x22, 88(x11)
                  sw x23, 92(x11)
                  sw x24, 96(x11)
                  sw x25, 100(x11)
                  sw x26, 104(x11)
                  sw x27, 108(x11)
                  sw x28, 112(x11)
                  sw x29, 116(x11)
                  sw x30, 120(x11)
                  sw x31, 124(x11)
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_9:
                  csrrw x11, 0x340, x11
                  add x11, x31, zero
                  1: addi x11, x11, -124
                  sw x1, 4(x11)
                  sw x2, 8(x11)
                  sw x3, 12(x11)
                  sw x4, 16(x11)
                  sw x5, 20(x11)
                  sw x6, 24(x11)
                  sw x7, 28(x11)
                  sw x8, 32(x11)
                  sw x9, 36(x11)
                  sw x10, 40(x11)
                  sw x11, 44(x11)
                  sw x12, 48(x11)
                  sw x13, 52(x11)
                  sw x14, 56(x11)
                  sw x15, 60(x11)
                  sw x16, 64(x11)
                  sw x17, 68(x11)
                  sw x18, 72(x11)
                  sw x19, 76(x11)
                  sw x20, 80(x11)
                  sw x21, 84(x11)
                  sw x22, 88(x11)
                  sw x23, 92(x11)
                  sw x24, 96(x11)
                  sw x25, 100(x11)
                  sw x26, 104(x11)
                  sw x27, 108(x11)
                  sw x28, 112(x11)
                  sw x29, 116(x11)
                  sw x30, 120(x11)
                  sw x31, 124(x11)
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_10:
                  csrrw x11, 0x340, x11
                  add x11, x31, zero
                  1: addi x11, x11, -124
                  sw x1, 4(x11)
                  sw x2, 8(x11)
                  sw x3, 12(x11)
                  sw x4, 16(x11)
                  sw x5, 20(x11)
                  sw x6, 24(x11)
                  sw x7, 28(x11)
                  sw x8, 32(x11)
                  sw x9, 36(x11)
                  sw x10, 40(x11)
                  sw x11, 44(x11)
                  sw x12, 48(x11)
                  sw x13, 52(x11)
                  sw x14, 56(x11)
                  sw x15, 60(x11)
                  sw x16, 64(x11)
                  sw x17, 68(x11)
                  sw x18, 72(x11)
                  sw x19, 76(x11)
                  sw x20, 80(x11)
                  sw x21, 84(x11)
                  sw x22, 88(x11)
                  sw x23, 92(x11)
                  sw x24, 96(x11)
                  sw x25, 100(x11)
                  sw x26, 104(x11)
                  sw x27, 108(x11)
                  sw x28, 112(x11)
                  sw x29, 116(x11)
                  sw x30, 120(x11)
                  sw x31, 124(x11)
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_11:
                  csrrw x11, 0x340, x11
                  add x11, x31, zero
                  1: addi x11, x11, -124
                  sw x1, 4(x11)
                  sw x2, 8(x11)
                  sw x3, 12(x11)
                  sw x4, 16(x11)
                  sw x5, 20(x11)
                  sw x6, 24(x11)
                  sw x7, 28(x11)
                  sw x8, 32(x11)
                  sw x9, 36(x11)
                  sw x10, 40(x11)
                  sw x11, 44(x11)
                  sw x12, 48(x11)
                  sw x13, 52(x11)
                  sw x14, 56(x11)
                  sw x15, 60(x11)
                  sw x16, 64(x11)
                  sw x17, 68(x11)
                  sw x18, 72(x11)
                  sw x19, 76(x11)
                  sw x20, 80(x11)
                  sw x21, 84(x11)
                  sw x22, 88(x11)
                  sw x23, 92(x11)
                  sw x24, 96(x11)
                  sw x25, 100(x11)
                  sw x26, 104(x11)
                  sw x27, 108(x11)
                  sw x28, 112(x11)
                  sw x29, 116(x11)
                  sw x30, 120(x11)
                  sw x31, 124(x11)
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_12:
                  csrrw x11, 0x340, x11
                  add x11, x31, zero
                  1: addi x11, x11, -124
                  sw x1, 4(x11)
                  sw x2, 8(x11)
                  sw x3, 12(x11)
                  sw x4, 16(x11)
                  sw x5, 20(x11)
                  sw x6, 24(x11)
                  sw x7, 28(x11)
                  sw x8, 32(x11)
                  sw x9, 36(x11)
                  sw x10, 40(x11)
                  sw x11, 44(x11)
                  sw x12, 48(x11)
                  sw x13, 52(x11)
                  sw x14, 56(x11)
                  sw x15, 60(x11)
                  sw x16, 64(x11)
                  sw x17, 68(x11)
                  sw x18, 72(x11)
                  sw x19, 76(x11)
                  sw x20, 80(x11)
                  sw x21, 84(x11)
                  sw x22, 88(x11)
                  sw x23, 92(x11)
                  sw x24, 96(x11)
                  sw x25, 100(x11)
                  sw x26, 104(x11)
                  sw x27, 108(x11)
                  sw x28, 112(x11)
                  sw x29, 116(x11)
                  sw x30, 120(x11)
                  sw x31, 124(x11)
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_13:
                  csrrw x11, 0x340, x11
                  add x11, x31, zero
                  1: addi x11, x11, -124
                  sw x1, 4(x11)
                  sw x2, 8(x11)
                  sw x3, 12(x11)
                  sw x4, 16(x11)
                  sw x5, 20(x11)
                  sw x6, 24(x11)
                  sw x7, 28(x11)
                  sw x8, 32(x11)
                  sw x9, 36(x11)
                  sw x10, 40(x11)
                  sw x11, 44(x11)
                  sw x12, 48(x11)
                  sw x13, 52(x11)
                  sw x14, 56(x11)
                  sw x15, 60(x11)
                  sw x16, 64(x11)
                  sw x17, 68(x11)
                  sw x18, 72(x11)
                  sw x19, 76(x11)
                  sw x20, 80(x11)
                  sw x21, 84(x11)
                  sw x22, 88(x11)
                  sw x23, 92(x11)
                  sw x24, 96(x11)
                  sw x25, 100(x11)
                  sw x26, 104(x11)
                  sw x27, 108(x11)
                  sw x28, 112(x11)
                  sw x29, 116(x11)
                  sw x30, 120(x11)
                  sw x31, 124(x11)
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_14:
                  csrrw x11, 0x340, x11
                  add x11, x31, zero
                  1: addi x11, x11, -124
                  sw x1, 4(x11)
                  sw x2, 8(x11)
                  sw x3, 12(x11)
                  sw x4, 16(x11)
                  sw x5, 20(x11)
                  sw x6, 24(x11)
                  sw x7, 28(x11)
                  sw x8, 32(x11)
                  sw x9, 36(x11)
                  sw x10, 40(x11)
                  sw x11, 44(x11)
                  sw x12, 48(x11)
                  sw x13, 52(x11)
                  sw x14, 56(x11)
                  sw x15, 60(x11)
                  sw x16, 64(x11)
                  sw x17, 68(x11)
                  sw x18, 72(x11)
                  sw x19, 76(x11)
                  sw x20, 80(x11)
                  sw x21, 84(x11)
                  sw x22, 88(x11)
                  sw x23, 92(x11)
                  sw x24, 96(x11)
                  sw x25, 100(x11)
                  sw x26, 104(x11)
                  sw x27, 108(x11)
                  sw x28, 112(x11)
                  sw x29, 116(x11)
                  sw x30, 120(x11)
                  sw x31, 124(x11)
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

mmode_intr_vector_15:
                  csrrw x11, 0x340, x11
                  add x11, x31, zero
                  1: addi x11, x11, -124
                  sw x1, 4(x11)
                  sw x2, 8(x11)
                  sw x3, 12(x11)
                  sw x4, 16(x11)
                  sw x5, 20(x11)
                  sw x6, 24(x11)
                  sw x7, 28(x11)
                  sw x8, 32(x11)
                  sw x9, 36(x11)
                  sw x10, 40(x11)
                  sw x11, 44(x11)
                  sw x12, 48(x11)
                  sw x13, 52(x11)
                  sw x14, 56(x11)
                  sw x15, 60(x11)
                  sw x16, 64(x11)
                  sw x17, 68(x11)
                  sw x18, 72(x11)
                  sw x19, 76(x11)
                  sw x20, 80(x11)
                  sw x21, 84(x11)
                  sw x22, 88(x11)
                  sw x23, 92(x11)
                  sw x24, 96(x11)
                  sw x25, 100(x11)
                  sw x26, 104(x11)
                  sw x27, 108(x11)
                  sw x28, 112(x11)
                  sw x29, 116(x11)
                  sw x30, 120(x11)
                  sw x31, 124(x11)
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 0x1f
                  beqz x30, 1f
                  j mmode_intr_handler
                  1: la x8, test_done
                  jalr x0, x8, 0

.align 4
mtvec_handler:    
                  .option norvc;
                  j mmode_exception_handler
                  j mmode_intr_vector_1
                  j mmode_intr_vector_2
                  j mmode_intr_vector_3
                  j mmode_intr_vector_4
                  j mmode_intr_vector_5
                  j mmode_intr_vector_6
                  j mmode_intr_vector_7
                  j mmode_intr_vector_8
                  j mmode_intr_vector_9
                  j mmode_intr_vector_10
                  j mmode_intr_vector_11
                  j mmode_intr_vector_12
                  j mmode_intr_vector_13
                  j mmode_intr_vector_14
                  j mmode_intr_vector_15
                  .option rvc;

mmode_exception_handler:
                  csrrw x11, 0x340, x11
                  add x11, x31, zero
                  1: addi x11, x11, -124
                  sw x1, 4(x11)
                  sw x2, 8(x11)
                  sw x3, 12(x11)
                  sw x4, 16(x11)
                  sw x5, 20(x11)
                  sw x6, 24(x11)
                  sw x7, 28(x11)
                  sw x8, 32(x11)
                  sw x9, 36(x11)
                  sw x10, 40(x11)
                  sw x11, 44(x11)
                  sw x12, 48(x11)
                  sw x13, 52(x11)
                  sw x14, 56(x11)
                  sw x15, 60(x11)
                  sw x16, 64(x11)
                  sw x17, 68(x11)
                  sw x18, 72(x11)
                  sw x19, 76(x11)
                  sw x20, 80(x11)
                  sw x21, 84(x11)
                  sw x22, 88(x11)
                  sw x23, 92(x11)
                  sw x24, 96(x11)
                  sw x25, 100(x11)
                  sw x26, 104(x11)
                  sw x27, 108(x11)
                  sw x28, 112(x11)
                  sw x29, 116(x11)
                  sw x30, 120(x11)
                  sw x31, 124(x11)
                  csrr x30, 0x341 # MEPC
                  csrr x30, 0x342 # MCAUSE
                  li x6, 0xb # ECALL_MMODE
                  beq x30, x6, ecall_handler
                  li x6, 0x2 # ILLEGAL_INSTRUCTION
                  beq x30, x6, illegal_instr_handler
                  csrr x6, 0x343 # MTVAL
                  1: la x8, test_done
                  jalr x1, x8, 0

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
                  la x8, write_tohost
                  jalr x0, x8, 0

illegal_instr_handler:
                  csrr  x30, 0x341
                  addi  x30, x30, 4
                  csrw  0x341, x30
                  lw x1, 4(x11)
                  lw x2, 8(x11)
                  lw x3, 12(x11)
                  lw x4, 16(x11)
                  lw x5, 20(x11)
                  lw x6, 24(x11)
                  lw x7, 28(x11)
                  lw x8, 32(x11)
                  lw x9, 36(x11)
                  lw x10, 40(x11)
                  lw x11, 44(x11)
                  lw x12, 48(x11)
                  lw x13, 52(x11)
                  lw x14, 56(x11)
                  lw x15, 60(x11)
                  lw x16, 64(x11)
                  lw x17, 68(x11)
                  lw x18, 72(x11)
                  lw x19, 76(x11)
                  lw x20, 80(x11)
                  lw x21, 84(x11)
                  lw x22, 88(x11)
                  lw x23, 92(x11)
                  lw x24, 96(x11)
                  lw x25, 100(x11)
                  lw x26, 104(x11)
                  lw x27, 108(x11)
                  lw x28, 112(x11)
                  lw x29, 116(x11)
                  lw x30, 120(x11)
                  lw x31, 124(x11)
                  addi x11, x11, 124
                  add x31, x11, zero
                  csrrw x11, 0x340, x11
                  mret

pt_fault_handler: 

.align 2
mmode_intr_handler:
                  csrr  x30, 0x300 # MSTATUS;
                  csrr  x30, 0x304 # MIE;
                  csrr  x30, 0x344 # MIP;
                  csrrc x30, 0x344, x30 # MIP;
                  lw x1, 4(x11)
                  lw x2, 8(x11)
                  lw x3, 12(x11)
                  lw x4, 16(x11)
                  lw x5, 20(x11)
                  lw x6, 24(x11)
                  lw x7, 28(x11)
                  lw x8, 32(x11)
                  lw x9, 36(x11)
                  lw x10, 40(x11)
                  lw x11, 44(x11)
                  lw x12, 48(x11)
                  lw x13, 52(x11)
                  lw x14, 56(x11)
                  lw x15, 60(x11)
                  lw x16, 64(x11)
                  lw x17, 68(x11)
                  lw x18, 72(x11)
                  lw x19, 76(x11)
                  lw x20, 80(x11)
                  lw x21, 84(x11)
                  lw x22, 88(x11)
                  lw x23, 92(x11)
                  lw x24, 96(x11)
                  lw x25, 100(x11)
                  lw x26, 104(x11)
                  lw x27, 108(x11)
                  lw x28, 112(x11)
                  lw x29, 116(x11)
                  lw x30, 120(x11)
                  lw x31, 124(x11)
                  addi x11, x11, 124
                  add x31, x11, zero
                  csrrw x11, 0x340, x11
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
