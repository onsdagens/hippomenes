// tb_register_file
import decoder_pkg::*;
module tb_decoder;

  logic [31:0] instr;
  pc_mux_t pc_mux_sel;
  wb_data_mux_t wb_data_mux_sel;
  logic [4:0] wb_reg;
  logic wb_enable;
  alu_a_mux_t alu_a_mux_sel;
  alu_b_mux_t alu_b_mux_sel;

  decoder dut (
      .instr(instr),
      .pc_mux_sel(pc_mux_sel),
      .wb_data_mux_sel(wb_data_mux_sel),
      .wb_reg(wb_reg),
      .wb_enable(wb_enable),
      .alu_a_mux_sel(alu_a_mux_sel),
      .alu_b_mux_sel(alu_b_mux_sel)
  );

  initial begin
    $dumpfile("decoder.fst");
    $dumpvars;

    $display("test lui");


    instr = 'h50000117;  // LUI
    #10;

    $display("test addi");
    instr = 'h50010113;  // ADDI

    #10;
    $display("test csr");
    instr = 'h35015073;  // CSR

    #10;
    $display("test lui");
    instr = 'h01000337;  // lui     t1,0x1000



    #10 $finish;


  end
endmodule

//    0:   50000117                auipc   sp,0x50000
//    4:   50010113                addi    sp,sp,1280 # 50000500 <_stack_start>
//    8:   35015073                .4byte  0x35015073

// 0000000c <main>:
//    c:   01000337                lui     t1,0x1000
//   10:   10030313                addi    t1,t1,256 # 1000100 <trap_9+0xfff78c>
//   14:   020003b7                lui     t2,0x2000
//   18:   10038393                addi    t2,t2,256 # 2000100 <trap_9+0x1fff78c>
//   1c:   03000e37                lui     t3,0x3000
//   20:   100e0e13                addi    t3,t3,256 # 3000100 <trap_9+0x2fff78c>
//   24:   04000eb7                lui     t4,0x4000
//   28:   100e8e93                addi    t4,t4,256 # 4000100 <trap_9+0x3fff78c>
//   2c:   05000f37                lui     t5,0x5000
//   30:   100f0f13                addi    t5,t5,256 # 5000100 <trap_9+0x4fff78c>
//   34:   06000fb7                lui     t6,0x6000
//   38:   100f8f93                addi    t6,t6,256 # 6000100 <trap_9+0x5fff78c>
//   3c:   070005b7                lui     a1,0x7000
//   40:   10058593                addi    a1,a1,256 # 7000100 <trap_9+0x6fff78c>
//   44:   08000637                lui     a2,0x8000
//   48:   10060613                addi    a2,a2,256 # 8000100 <trap_9+0x7fff78c>
//   4c:   090006b7                lui     a3,0x9000
//   50:   10068693                addi    a3,a3,256 # 9000100 <trap_9+0x8fff78c>
//   54:   b0131073                .4byte  0xb0131073
//   58:   b0239073                .4byte  0xb0239073
//   5c:   b03e1073                .4byte  0xb03e1073
//   60:   b04e9073                .4byte  0xb04e9073
//   64:   b05f1073                .4byte  0xb05f1073
//   68:   b06f9073                .4byte  0xb06f9073
//   6c:   b0759073                .4byte  0xb0759073
//   70:   b0861073                .4byte  0xb0861073
//   74:   b0969073                .4byte  0xb0969073
//   78:   00005337                lui     t1,0x5
//   7c:   00830313                addi    t1,t1,8 # 5008 <trap_9+0x4694>
//   80:   03200393                li      t2,50
//   84:   00732023                sw      t2,0(t1)

// 00000088 <.Lpcrel_hi1>:
//   88:   50000297                auipc   t0,0x50000
//   8c:   17828293                addi    t0,t0,376 # 50000200 <EXIT_VAR+0x200>
//   90:   35129073                .4byte  0x35129073

// 00000094 <.Lpcrel_hi2>:
//   94:   50000297                auipc   t0,0x50000
//   98:   06c28293                addi    t0,t0,108 # 50000100 <EXIT_VAR+0x100>
//   9c:   30529073                .4byte  0x30529073
//   a0:   34705073                .4byte  0x34705073
//   a4:   30045073                .4byte  0x30045073
//   a8:   00100313                li      t1,1
//   ac:   b0232073                .4byte  0xb0232073

// 000000b0 <stop>:
//   b0:   0000006f                j       b0 <stop>

// 000000b4 <isr_0>:
//   b4:   0000006f                j       b4 <isr_0>

// 000000b8 <isr_1>:
//   b8:   00008067                ret

// 000000bc <isr_2>:
//   bc:   00100513                li      a0,1
//   c0:   b0152073                .4byte  0xb0152073
//   c4:   b0452073                .4byte  0xb0452073
//   c8:   00000013                nop
//   cc:   00008067                ret

// 000000d0 <isr_3>:
//   d0:   00100513                li      a0,1
//   d4:   00008067                ret

// 000000d8 <isr_4>:
//   d8:   00100513                li      a0,1

// 000000dc <.Lpcrel_hi3>:
//   dc:   50000597                auipc   a1,0x50000
//   e0:   f2458593                addi    a1,a1,-220 # 50000000 <EXIT_VAR>
//   e4:   0005a283                lw      t0,0(a1)
//   e8:   00029663                bnez    t0,f4 <isr4_exit>
//   ec:   00a58023                sb      a0,0(a1)
//   f0:   b0652073                .4byte  0xb0652073

// 000000f4 <isr4_exit>:
//   f4:   00008067                ret

// 000000f8 <isr_5>:
//   f8:   00100513                li      a0,1
//   fc:   00008067                ret

// 00000100 <isr_6>:
//  100:   00100513                li      a0,1
//  104:   b0852073                .4byte  0xb0852073
//  108:   b0352073                .4byte  0xb0352073
//  10c:   00008067                ret

// 00000110 <isr_7>:
//  110:   00100513                li      a0,1
//  114:   00008067                ret

// 00000118 <isr_8>:
//  118:   00100513                li      a0,1
//  11c:   b0452073                .4byte  0xb0452073
//  120:   b0552073                .4byte  0xb0552073
//  124:   00008067                ret

// 00000128 <isr_9>:
//  128:   000052b7                lui     t0,0x5
//  12c:   0002a303                lw      t1,0(t0) # 5000 <trap_9+0x468c>
//  130:   0042a383                lw      t2,4(t0)
//  134:   06430313                addi    t1,t1,100
//  138:   0062a423                sw      t1,8(t0)
//  13c:   0072a623                sw      t2,12(t0)
//  140:   00000013                nop
//  144:   00000013                nop
//  148:   00008067                ret

// Disassembly of section .trap:

// 00000200 <trap_0>:
//  200:   fb410113                addi    sp,sp,-76
//  204:   00a12823                sw      a0,16(sp)
//  208:   30002573                .4byte  0x30002573
//  20c:   00a12023                sw      a0,0(sp)
//  210:   34102573                .4byte  0x34102573
//  214:   00a12223                sw      a0,4(sp)
//  218:   34702573                .4byte  0x34702573
//  21c:   00a12423                sw      a0,8(sp)
//  220:   00001537                lui     a0,0x1
//  224:   00350503                lb      a0,3(a0) # 1003 <trap_9+0x68f>
//  228:   34751073                .4byte  0x34751073
//  22c:   30046073                .4byte  0x30046073
//  230:   00112623                sw      ra,12(sp)
//  234:   00b12a23                sw      a1,20(sp)
//  238:   00c12c23                sw      a2,24(sp)
//  23c:   00d12e23                sw      a3,28(sp)
//  240:   02e12023                sw      a4,32(sp)
//  244:   02f12223                sw      a5,36(sp)
//  248:   03012423                sw      a6,40(sp)
//  24c:   03112623                sw      a7,44(sp)
//  250:   02512823                sw      t0,48(sp)
//  254:   02612a23                sw      t1,52(sp)
//  258:   02712c23                sw      t2,56(sp)
//  25c:   03c12e23                sw      t3,60(sp)
//  260:   05d12023                sw      t4,64(sp)
//  264:   05e12223                sw      t5,68(sp)
//  268:   05f12423                sw      t6,72(sp)
//  26c:   e49ff0ef                jal     ra,b4 <isr_0>
//  270:   00012503                lw      a0,0(sp)
//  274:   30051073                .4byte  0x30051073
//  278:   00412503                lw      a0,4(sp)
//  27c:   34151073                .4byte  0x34151073
//  280:   00c12083                lw      ra,12(sp)
//  284:   01012503                lw      a0,16(sp)
//  288:   01412583                lw      a1,20(sp)
//  28c:   01812603                lw      a2,24(sp)
//  290:   01c12683                lw      a3,28(sp)
//  294:   02012703                lw      a4,32(sp)
//  298:   02412783                lw      a5,36(sp)
//  29c:   02812803                lw      a6,40(sp)
//  2a0:   02c12883                lw      a7,44(sp)
//  2a4:   03012283                lw      t0,48(sp)
//  2a8:   03412303                lw      t1,52(sp)
//  2ac:   03812383                lw      t2,56(sp)
//  2b0:   03c12e03                lw      t3,60(sp)
//  2b4:   04012e83                lw      t4,64(sp)
//  2b8:   04412f03                lw      t5,68(sp)
//  2bc:   30047073                .4byte  0x30047073
//  2c0:   00812f83                lw      t6,8(sp)
//  2c4:   347f9073                .4byte  0x347f9073
//  2c8:   04812f83                lw      t6,72(sp)
//  2cc:   04c10113                addi    sp,sp,76
//  2d0:   30200073                mret

// 000002d4 <trap_1>:
//  2d4:   fb410113                addi    sp,sp,-76
//  2d8:   00a12823                sw      a0,16(sp)
//  2dc:   30002573                .4byte  0x30002573
//  2e0:   00a12023                sw      a0,0(sp)
//  2e4:   34102573                .4byte  0x34102573
//  2e8:   00a12223                sw      a0,4(sp)
//  2ec:   34702573                .4byte  0x34702573
//  2f0:   00a12423                sw      a0,8(sp)
//  2f4:   00001537                lui     a0,0x1
//  2f8:   00750503                lb      a0,7(a0) # 1007 <trap_9+0x693>
//  2fc:   34751073                .4byte  0x34751073
//  300:   30046073                .4byte  0x30046073
//  304:   00112623                sw      ra,12(sp)
//  308:   00b12a23                sw      a1,20(sp)
//  30c:   00c12c23                sw      a2,24(sp)
//  310:   00d12e23                sw      a3,28(sp)
//  314:   02e12023                sw      a4,32(sp)
//  318:   02f12223                sw      a5,36(sp)
//  31c:   03012423                sw      a6,40(sp)
//  320:   03112623                sw      a7,44(sp)
//  324:   02512823                sw      t0,48(sp)
//  328:   02612a23                sw      t1,52(sp)
//  32c:   02712c23                sw      t2,56(sp)
//  330:   03c12e23                sw      t3,60(sp)
//  334:   05d12023                sw      t4,64(sp)
//  338:   05e12223                sw      t5,68(sp)
//  33c:   05f12423                sw      t6,72(sp)
//  340:   d79ff0ef                jal     ra,b8 <isr_1>
//  344:   00012503                lw      a0,0(sp)
//  348:   30051073                .4byte  0x30051073
//  34c:   00412503                lw      a0,4(sp)
//  350:   34151073                .4byte  0x34151073
//  354:   00c12083                lw      ra,12(sp)
//  358:   01012503                lw      a0,16(sp)
//  35c:   01412583                lw      a1,20(sp)
//  360:   01812603                lw      a2,24(sp)
//  364:   01c12683                lw      a3,28(sp)
//  368:   02012703                lw      a4,32(sp)
//  36c:   02412783                lw      a5,36(sp)
//  370:   02812803                lw      a6,40(sp)
//  374:   02c12883                lw      a7,44(sp)
//  378:   03012283                lw      t0,48(sp)
//  37c:   03412303                lw      t1,52(sp)
//  380:   03812383                lw      t2,56(sp)
//  384:   03c12e03                lw      t3,60(sp)
//  388:   04012e83                lw      t4,64(sp)
//  38c:   04412f03                lw      t5,68(sp)
//  390:   30047073                .4byte  0x30047073
//  394:   00812f83                lw      t6,8(sp)
//  398:   347f9073                .4byte  0x347f9073
//  39c:   04812f83                lw      t6,72(sp)
//  3a0:   04c10113                addi    sp,sp,76
//  3a4:   30200073                mret

// 000003a8 <trap_2>:
//  3a8:   fb410113                addi    sp,sp,-76
//  3ac:   00a12823                sw      a0,16(sp)
//  3b0:   30002573                .4byte  0x30002573
//  3b4:   00a12023                sw      a0,0(sp)
//  3b8:   34102573                .4byte  0x34102573
//  3bc:   00a12223                sw      a0,4(sp)
//  3c0:   34702573                .4byte  0x34702573
//  3c4:   00a12423                sw      a0,8(sp)
//  3c8:   00001537                lui     a0,0x1
//  3cc:   00b50503                lb      a0,11(a0) # 100b <trap_9+0x697>
//  3d0:   34751073                .4byte  0x34751073
//  3d4:   30046073                .4byte  0x30046073
//  3d8:   00112623                sw      ra,12(sp)
//  3dc:   00b12a23                sw      a1,20(sp)
//  3e0:   00c12c23                sw      a2,24(sp)
//  3e4:   00d12e23                sw      a3,28(sp)
//  3e8:   02e12023                sw      a4,32(sp)
//  3ec:   02f12223                sw      a5,36(sp)
//  3f0:   03012423                sw      a6,40(sp)
//  3f4:   03112623                sw      a7,44(sp)
//  3f8:   02512823                sw      t0,48(sp)
//  3fc:   02612a23                sw      t1,52(sp)
//  400:   02712c23                sw      t2,56(sp)
//  404:   03c12e23                sw      t3,60(sp)
//  408:   05d12023                sw      t4,64(sp)
//  40c:   05e12223                sw      t5,68(sp)
//  410:   05f12423                sw      t6,72(sp)
//  414:   ca9ff0ef                jal     ra,bc <isr_2>
//  418:   00012503                lw      a0,0(sp)
//  41c:   30051073                .4byte  0x30051073
//  420:   00412503                lw      a0,4(sp)
//  424:   34151073                .4byte  0x34151073
//  428:   00c12083                lw      ra,12(sp)
//  42c:   01012503                lw      a0,16(sp)
//  430:   01412583                lw      a1,20(sp)
//  434:   01812603                lw      a2,24(sp)
//  438:   01c12683                lw      a3,28(sp)
//  43c:   02012703                lw      a4,32(sp)
//  440:   02412783                lw      a5,36(sp)
//  444:   02812803                lw      a6,40(sp)
//  448:   02c12883                lw      a7,44(sp)
//  44c:   03012283                lw      t0,48(sp)
//  450:   03412303                lw      t1,52(sp)
//  454:   03812383                lw      t2,56(sp)
//  458:   03c12e03                lw      t3,60(sp)
//  45c:   04012e83                lw      t4,64(sp)
//  460:   04412f03                lw      t5,68(sp)
//  464:   30047073                .4byte  0x30047073
//  468:   00812f83                lw      t6,8(sp)
//  46c:   347f9073                .4byte  0x347f9073
//  470:   04812f83                lw      t6,72(sp)
//  474:   04c10113                addi    sp,sp,76
//  478:   30200073                mret

// 0000047c <trap_3>:
//  47c:   fb410113                addi    sp,sp,-76
//  480:   00a12823                sw      a0,16(sp)
//  484:   30002573                .4byte  0x30002573
//  488:   00a12023                sw      a0,0(sp)
//  48c:   34102573                .4byte  0x34102573
//  490:   00a12223                sw      a0,4(sp)
//  494:   34702573                .4byte  0x34702573
//  498:   00a12423                sw      a0,8(sp)
//  49c:   00001537                lui     a0,0x1
//  4a0:   00f50503                lb      a0,15(a0) # 100f <trap_9+0x69b>
//  4a4:   34751073                .4byte  0x34751073
//  4a8:   30046073                .4byte  0x30046073
//  4ac:   00112623                sw      ra,12(sp)
//  4b0:   00b12a23                sw      a1,20(sp)
//  4b4:   00c12c23                sw      a2,24(sp)
//  4b8:   00d12e23                sw      a3,28(sp)
//  4bc:   02e12023                sw      a4,32(sp)
//  4c0:   02f12223                sw      a5,36(sp)
//  4c4:   03012423                sw      a6,40(sp)
//  4c8:   03112623                sw      a7,44(sp)
//  4cc:   02512823                sw      t0,48(sp)
//  4d0:   02612a23                sw      t1,52(sp)
//  4d4:   02712c23                sw      t2,56(sp)
//  4d8:   03c12e23                sw      t3,60(sp)
//  4dc:   05d12023                sw      t4,64(sp)
//  4e0:   05e12223                sw      t5,68(sp)
//  4e4:   05f12423                sw      t6,72(sp)
//  4e8:   be9ff0ef                jal     ra,d0 <isr_3>
//  4ec:   00012503                lw      a0,0(sp)
//  4f0:   30051073                .4byte  0x30051073
//  4f4:   00412503                lw      a0,4(sp)
//  4f8:   34151073                .4byte  0x34151073
//  4fc:   00c12083                lw      ra,12(sp)
//  500:   01012503                lw      a0,16(sp)
//  504:   01412583                lw      a1,20(sp)
//  508:   01812603                lw      a2,24(sp)
//  50c:   01c12683                lw      a3,28(sp)
//  510:   02012703                lw      a4,32(sp)
//  514:   02412783                lw      a5,36(sp)
//  518:   02812803                lw      a6,40(sp)
//  51c:   02c12883                lw      a7,44(sp)
//  520:   03012283                lw      t0,48(sp)
//  524:   03412303                lw      t1,52(sp)
//  528:   03812383                lw      t2,56(sp)
//  52c:   03c12e03                lw      t3,60(sp)
//  530:   04012e83                lw      t4,64(sp)
//  534:   04412f03                lw      t5,68(sp)
//  538:   30047073                .4byte  0x30047073
//  53c:   00812f83                lw      t6,8(sp)
//  540:   347f9073                .4byte  0x347f9073
//  544:   04812f83                lw      t6,72(sp)
//  548:   04c10113                addi    sp,sp,76
//  54c:   30200073                mret

// 00000550 <trap_4>:
//  550:   fb410113                addi    sp,sp,-76
//  554:   00a12823                sw      a0,16(sp)
//  558:   30002573                .4byte  0x30002573
//  55c:   00a12023                sw      a0,0(sp)
//  560:   34102573                .4byte  0x34102573
//  564:   00a12223                sw      a0,4(sp)
//  568:   34702573                .4byte  0x34702573
//  56c:   00a12423                sw      a0,8(sp)
//  570:   00001537                lui     a0,0x1
//  574:   01350503                lb      a0,19(a0) # 1013 <trap_9+0x69f>
//  578:   34751073                .4byte  0x34751073
//  57c:   30046073                .4byte  0x30046073
//  580:   00112623                sw      ra,12(sp)
//  584:   00b12a23                sw      a1,20(sp)
//  588:   00c12c23                sw      a2,24(sp)
//  58c:   00d12e23                sw      a3,28(sp)
//  590:   02e12023                sw      a4,32(sp)
//  594:   02f12223                sw      a5,36(sp)
//  598:   03012423                sw      a6,40(sp)
//  59c:   03112623                sw      a7,44(sp)
//  5a0:   02512823                sw      t0,48(sp)
//  5a4:   02612a23                sw      t1,52(sp)
//  5a8:   02712c23                sw      t2,56(sp)
//  5ac:   03c12e23                sw      t3,60(sp)
//  5b0:   05d12023                sw      t4,64(sp)
//  5b4:   05e12223                sw      t5,68(sp)
//  5b8:   05f12423                sw      t6,72(sp)
//  5bc:   b1dff0ef                jal     ra,d8 <isr_4>
//  5c0:   00012503                lw      a0,0(sp)
//  5c4:   30051073                .4byte  0x30051073
//  5c8:   00412503                lw      a0,4(sp)
//  5cc:   34151073                .4byte  0x34151073
//  5d0:   00c12083                lw      ra,12(sp)
//  5d4:   01012503                lw      a0,16(sp)
//  5d8:   01412583                lw      a1,20(sp)
//  5dc:   01812603                lw      a2,24(sp)
//  5e0:   01c12683                lw      a3,28(sp)
//  5e4:   02012703                lw      a4,32(sp)
//  5e8:   02412783                lw      a5,36(sp)
//  5ec:   02812803                lw      a6,40(sp)
//  5f0:   02c12883                lw      a7,44(sp)
//  5f4:   03012283                lw      t0,48(sp)
//  5f8:   03412303                lw      t1,52(sp)
//  5fc:   03812383                lw      t2,56(sp)
//  600:   03c12e03                lw      t3,60(sp)
//  604:   04012e83                lw      t4,64(sp)
//  608:   04412f03                lw      t5,68(sp)
//  60c:   30047073                .4byte  0x30047073
//  610:   00812f83                lw      t6,8(sp)
//  614:   347f9073                .4byte  0x347f9073
//  618:   04812f83                lw      t6,72(sp)
//  61c:   04c10113                addi    sp,sp,76
//  620:   30200073                mret

// 00000624 <trap_5>:
//  624:   fb410113                addi    sp,sp,-76
//  628:   00a12823                sw      a0,16(sp)
//  62c:   30002573                .4byte  0x30002573
//  630:   00a12023                sw      a0,0(sp)
//  634:   34102573                .4byte  0x34102573
//  638:   00a12223                sw      a0,4(sp)
//  63c:   34702573                .4byte  0x34702573
//  640:   00a12423                sw      a0,8(sp)
//  644:   00001537                lui     a0,0x1
//  648:   01750503                lb      a0,23(a0) # 1017 <trap_9+0x6a3>
//  64c:   34751073                .4byte  0x34751073
//  650:   30046073                .4byte  0x30046073
//  654:   00112623                sw      ra,12(sp)
//  658:   00b12a23                sw      a1,20(sp)
//  65c:   00c12c23                sw      a2,24(sp)
//  660:   00d12e23                sw      a3,28(sp)
//  664:   02e12023                sw      a4,32(sp)
//  668:   02f12223                sw      a5,36(sp)
//  66c:   03012423                sw      a6,40(sp)
//  670:   03112623                sw      a7,44(sp)
//  674:   02512823                sw      t0,48(sp)
//  678:   02612a23                sw      t1,52(sp)
//  67c:   02712c23                sw      t2,56(sp)
//  680:   03c12e23                sw      t3,60(sp)
//  684:   05d12023                sw      t4,64(sp)
//  688:   05e12223                sw      t5,68(sp)
//  68c:   05f12423                sw      t6,72(sp)
//  690:   a69ff0ef                jal     ra,f8 <isr_5>
//  694:   00012503                lw      a0,0(sp)
//  698:   30051073                .4byte  0x30051073
//  69c:   00412503                lw      a0,4(sp)
//  6a0:   34151073                .4byte  0x34151073
//  6a4:   00c12083                lw      ra,12(sp)
//  6a8:   01012503                lw      a0,16(sp)
//  6ac:   01412583                lw      a1,20(sp)
//  6b0:   01812603                lw      a2,24(sp)
//  6b4:   01c12683                lw      a3,28(sp)
//  6b8:   02012703                lw      a4,32(sp)
//  6bc:   02412783                lw      a5,36(sp)
//  6c0:   02812803                lw      a6,40(sp)
//  6c4:   02c12883                lw      a7,44(sp)
//  6c8:   03012283                lw      t0,48(sp)
//  6cc:   03412303                lw      t1,52(sp)
//  6d0:   03812383                lw      t2,56(sp)
//  6d4:   03c12e03                lw      t3,60(sp)
//  6d8:   04012e83                lw      t4,64(sp)
//  6dc:   04412f03                lw      t5,68(sp)
//  6e0:   30047073                .4byte  0x30047073
//  6e4:   00812f83                lw      t6,8(sp)
//  6e8:   347f9073                .4byte  0x347f9073
//  6ec:   04812f83                lw      t6,72(sp)
//  6f0:   04c10113                addi    sp,sp,76
//  6f4:   30200073                mret

// 000006f8 <trap_6>:
//  6f8:   fb410113                addi    sp,sp,-76
//  6fc:   00a12823                sw      a0,16(sp)
//  700:   30002573                .4byte  0x30002573
//  704:   00a12023                sw      a0,0(sp)
//  708:   34102573                .4byte  0x34102573
//  70c:   00a12223                sw      a0,4(sp)
//  710:   34702573                .4byte  0x34702573
//  714:   00a12423                sw      a0,8(sp)
//  718:   00001537                lui     a0,0x1
//  71c:   01b50503                lb      a0,27(a0) # 101b <trap_9+0x6a7>
//  720:   34751073                .4byte  0x34751073
//  724:   30046073                .4byte  0x30046073
//  728:   00112623                sw      ra,12(sp)
//  72c:   00b12a23                sw      a1,20(sp)
//  730:   00c12c23                sw      a2,24(sp)
//  734:   00d12e23                sw      a3,28(sp)
//  738:   02e12023                sw      a4,32(sp)
//  73c:   02f12223                sw      a5,36(sp)
//  740:   03012423                sw      a6,40(sp)
//  744:   03112623                sw      a7,44(sp)
//  748:   02512823                sw      t0,48(sp)
//  74c:   02612a23                sw      t1,52(sp)
//  750:   02712c23                sw      t2,56(sp)
//  754:   03c12e23                sw      t3,60(sp)
//  758:   05d12023                sw      t4,64(sp)
//  75c:   05e12223                sw      t5,68(sp)
//  760:   05f12423                sw      t6,72(sp)
//  764:   99dff0ef                jal     ra,100 <isr_6>
//  768:   00012503                lw      a0,0(sp)
//  76c:   30051073                .4byte  0x30051073
//  770:   00412503                lw      a0,4(sp)
//  774:   34151073                .4byte  0x34151073
//  778:   00c12083                lw      ra,12(sp)
//  77c:   01012503                lw      a0,16(sp)
//  780:   01412583                lw      a1,20(sp)
//  784:   01812603                lw      a2,24(sp)
//  788:   01c12683                lw      a3,28(sp)
//  78c:   02012703                lw      a4,32(sp)
//  790:   02412783                lw      a5,36(sp)
//  794:   02812803                lw      a6,40(sp)
//  798:   02c12883                lw      a7,44(sp)
//  79c:   03012283                lw      t0,48(sp)
//  7a0:   03412303                lw      t1,52(sp)
//  7a4:   03812383                lw      t2,56(sp)
//  7a8:   03c12e03                lw      t3,60(sp)
//  7ac:   04012e83                lw      t4,64(sp)
//  7b0:   04412f03                lw      t5,68(sp)
//  7b4:   30047073                .4byte  0x30047073
//  7b8:   00812f83                lw      t6,8(sp)
//  7bc:   347f9073                .4byte  0x347f9073
//  7c0:   04812f83                lw      t6,72(sp)
//  7c4:   04c10113                addi    sp,sp,76
//  7c8:   30200073                mret

// 000007cc <trap_7>:
//  7cc:   fb410113                addi    sp,sp,-76
//  7d0:   00a12823                sw      a0,16(sp)
//  7d4:   30002573                .4byte  0x30002573
//  7d8:   00a12023                sw      a0,0(sp)
//  7dc:   34102573                .4byte  0x34102573
//  7e0:   00a12223                sw      a0,4(sp)
//  7e4:   34702573                .4byte  0x34702573
//  7e8:   00a12423                sw      a0,8(sp)
//  7ec:   00001537                lui     a0,0x1
//  7f0:   01f50503                lb      a0,31(a0) # 101f <trap_9+0x6ab>
//  7f4:   34751073                .4byte  0x34751073
//  7f8:   30046073                .4byte  0x30046073
//  7fc:   00112623                sw      ra,12(sp)
//  800:   00b12a23                sw      a1,20(sp)
//  804:   00c12c23                sw      a2,24(sp)
//  808:   00d12e23                sw      a3,28(sp)
//  80c:   02e12023                sw      a4,32(sp)
//  810:   02f12223                sw      a5,36(sp)
//  814:   03012423                sw      a6,40(sp)
//  818:   03112623                sw      a7,44(sp)
//  81c:   02512823                sw      t0,48(sp)
//  820:   02612a23                sw      t1,52(sp)
//  824:   02712c23                sw      t2,56(sp)
//  828:   03c12e23                sw      t3,60(sp)
//  82c:   05d12023                sw      t4,64(sp)
//  830:   05e12223                sw      t5,68(sp)
//  834:   05f12423                sw      t6,72(sp)
//  838:   8d9ff0ef                jal     ra,110 <isr_7>
//  83c:   00012503                lw      a0,0(sp)
//  840:   30051073                .4byte  0x30051073
//  844:   00412503                lw      a0,4(sp)
//  848:   34151073                .4byte  0x34151073
//  84c:   00c12083                lw      ra,12(sp)
//  850:   01012503                lw      a0,16(sp)
//  854:   01412583                lw      a1,20(sp)
//  858:   01812603                lw      a2,24(sp)
//  85c:   01c12683                lw      a3,28(sp)
//  860:   02012703                lw      a4,32(sp)
//  864:   02412783                lw      a5,36(sp)
//  868:   02812803                lw      a6,40(sp)
//  86c:   02c12883                lw      a7,44(sp)
//  870:   03012283                lw      t0,48(sp)
//  874:   03412303                lw      t1,52(sp)
//  878:   03812383                lw      t2,56(sp)
//  87c:   03c12e03                lw      t3,60(sp)
//  880:   04012e83                lw      t4,64(sp)
//  884:   04412f03                lw      t5,68(sp)
//  888:   30047073                .4byte  0x30047073
//  88c:   00812f83                lw      t6,8(sp)
//  890:   347f9073                .4byte  0x347f9073
//  894:   04812f83                lw      t6,72(sp)
//  898:   04c10113                addi    sp,sp,76
//  89c:   30200073                mret

// 000008a0 <trap_8>:
//  8a0:   fb410113                addi    sp,sp,-76
//  8a4:   00a12823                sw      a0,16(sp)
//  8a8:   30002573                .4byte  0x30002573
//  8ac:   00a12023                sw      a0,0(sp)
//  8b0:   34102573                .4byte  0x34102573
//  8b4:   00a12223                sw      a0,4(sp)
//  8b8:   34702573                .4byte  0x34702573
//  8bc:   00a12423                sw      a0,8(sp)
//  8c0:   00001537                lui     a0,0x1
//  8c4:   02350503                lb      a0,35(a0) # 1023 <trap_9+0x6af>
//  8c8:   34751073                .4byte  0x34751073
//  8cc:   30046073                .4byte  0x30046073
//  8d0:   00112623                sw      ra,12(sp)
//  8d4:   00b12a23                sw      a1,20(sp)
//  8d8:   00c12c23                sw      a2,24(sp)
//  8dc:   00d12e23                sw      a3,28(sp)
//  8e0:   02e12023                sw      a4,32(sp)
//  8e4:   02f12223                sw      a5,36(sp)
//  8e8:   03012423                sw      a6,40(sp)
//  8ec:   03112623                sw      a7,44(sp)
//  8f0:   02512823                sw      t0,48(sp)
//  8f4:   02612a23                sw      t1,52(sp)
//  8f8:   02712c23                sw      t2,56(sp)
//  8fc:   03c12e23                sw      t3,60(sp)
//  900:   05d12023                sw      t4,64(sp)
//  904:   05e12223                sw      t5,68(sp)
//  908:   05f12423                sw      t6,72(sp)
//  90c:   80dff0ef                jal     ra,118 <isr_8>
//  910:   00012503                lw      a0,0(sp)
//  914:   30051073                .4byte  0x30051073
//  918:   00412503                lw      a0,4(sp)
//  91c:   34151073                .4byte  0x34151073
//  920:   00c12083                lw      ra,12(sp)
//  924:   01012503                lw      a0,16(sp)
//  928:   01412583                lw      a1,20(sp)
//  92c:   01812603                lw      a2,24(sp)
//  930:   01c12683                lw      a3,28(sp)
//  934:   02012703                lw      a4,32(sp)
//  938:   02412783                lw      a5,36(sp)
//  93c:   02812803                lw      a6,40(sp)
//  940:   02c12883                lw      a7,44(sp)
//  944:   03012283                lw      t0,48(sp)
//  948:   03412303                lw      t1,52(sp)
//  94c:   03812383                lw      t2,56(sp)
//  950:   03c12e03                lw      t3,60(sp)
//  954:   04012e83                lw      t4,64(sp)
//  958:   04412f03                lw      t5,68(sp)
//  95c:   30047073                .4byte  0x30047073
//  960:   00812f83                lw      t6,8(sp)
//  964:   347f9073                .4byte  0x347f9073
//  968:   04812f83                lw      t6,72(sp)
//  96c:   04c10113                addi    sp,sp,76
//  970:   30200073                mret

// 00000974 <trap_9>:
//  974:   fb410113                addi    sp,sp,-76
//  978:   00a12823                sw      a0,16(sp)
//  97c:   30002573                .4byte  0x30002573
//  980:   00a12023                sw      a0,0(sp)
//  984:   34102573                .4byte  0x34102573
//  988:   00a12223                sw      a0,4(sp)
//  98c:   34702573                .4byte  0x34702573
//  990:   00a12423                sw      a0,8(sp)
//  994:   00001537                lui     a0,0x1
//  998:   02750503                lb      a0,39(a0) # 1027 <trap_9+0x6b3>
//  99c:   34751073                .4byte  0x34751073
//  9a0:   30046073                .4byte  0x30046073
//  9a4:   00112623                sw      ra,12(sp)
//  9a8:   00b12a23                sw      a1,20(sp)
//  9ac:   00c12c23                sw      a2,24(sp)
//  9b0:   00d12e23                sw      a3,28(sp)
//  9b4:   02e12023                sw      a4,32(sp)
//  9b8:   02f12223                sw      a5,36(sp)
//  9bc:   03012423                sw      a6,40(sp)
//  9c0:   03112623                sw      a7,44(sp)
//  9c4:   02512823                sw      t0,48(sp)
//  9c8:   02612a23                sw      t1,52(sp)
//  9cc:   02712c23                sw      t2,56(sp)
//  9d0:   03c12e23                sw      t3,60(sp)
//  9d4:   05d12023                sw      t4,64(sp)
//  9d8:   05e12223                sw      t5,68(sp)
//  9dc:   05f12423                sw      t6,72(sp)
//  9e0:   f48ff0ef                jal     ra,128 <isr_9>
//  9e4:   00012503                lw      a0,0(sp)
//  9e8:   30051073                .4byte  0x30051073
//  9ec:   00412503                lw      a0,4(sp)
//  9f0:   34151073                .4byte  0x34151073
//  9f4:   00c12083                lw      ra,12(sp)
//  9f8:   01012503                lw      a0,16(sp)
//  9fc:   01412583                lw      a1,20(sp)
//  a00:   01812603                lw      a2,24(sp)
//  a04:   01c12683                lw      a3,28(sp)
//  a08:   02012703                lw      a4,32(sp)
//  a0c:   02412783                lw      a5,36(sp)
//  a10:   02812803                lw      a6,40(sp)
//  a14:   02c12883                lw      a7,44(sp)
//  a18:   03012283                lw      t0,48(sp)
//  a1c:   03412303                lw      t1,52(sp)
//  a20:   03812383                lw      t2,56(sp)
//  a24:   03c12e03                lw      t3,60(sp)
//  a28:   04012e83                lw      t4,64(sp)
//  a2c:   04412f03                lw      t5,68(sp)
//  a30:   30047073                .4byte  0x30047073
//  a34:   00812f83                lw      t6,8(sp)
//  a38:   347f9073                .4byte  0x347f9073
//  a3c:   04812f83                lw      t6,72(sp)
//  a40:   04c10113                addi    sp,sp,76
//  a44:   30200073                mret

