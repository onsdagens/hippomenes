warning: unused import: `core::ops::Deref`
   --> /home/pawel/hippomenes-core/src/lib.rs:360:5
    |
360 | use core::ops::Deref;
    |     ^^^^^^^^^^^^^^^^
    |
    = note: `#[warn(unused_imports)]` on by default

warning: unknown and unstable feature specified for `-Ctarget-feature`: `zmmul`
  |
  = note: it is still passed through to the codegen backend, but use of this feature might be unsound and the behavior of this feature can change in the future
  = help: consider filing a feature request

warning: 2 warnings emitted

warning: unknown and unstable feature specified for `-Ctarget-feature`: `zmmul`
  |
  = note: it is still passed through to the codegen backend, but use of this feature might be unsound and the behavior of this feature can change in the future
  = help: consider filing a feature request

warning: 1 warning emitted

warning: unknown and unstable feature specified for `-Ctarget-feature`: `zmmul`
  |
  = note: it is still passed through to the codegen backend, but use of this feature might be unsound and the behavior of this feature can change in the future
  = help: consider filing a feature request

warning: 1 warning emitted

warning: unknown and unstable feature specified for `-Ctarget-feature`: `zmmul`
  |
  = note: it is still passed through to the codegen backend, but use of this feature might be unsound and the behavior of this feature can change in the future
  = help: consider filing a feature request

warning: 1 warning emitted


rust_blinky:	file format elf32-littleriscv

Disassembly of section .keystore:

50002000 <keystore>:
50002000: 7930         	<unknown>
50002002: 6b65         	<unknown>
50002004: 7931         	<unknown>
50002006: 6b65         	<unknown>

Disassembly of section .text:

00000004 <_start>:
       4: 50001197     	auipc	gp, 0x50001
       8: 81018193     	addi	gp, gp, -0x7f0

0000000c <.Lpcrel_hi1>:
       c: 50001317     	auipc	t1, 0x50001
      10: ff430313     	addi	t1, t1, -0xc
      14: ff037113     	andi	sp, t1, -0x10

00000018 <.Lpcrel_hi2>:
      18: 50000297     	auipc	t0, 0x50000
      1c: ffc28293     	addi	t0, t0, -0x4

00000020 <.Lpcrel_hi3>:
      20: 50000397     	auipc	t2, 0x50000
      24: ff438393     	addi	t2, t2, -0xc

00000028 <.Lpcrel_hi4>:
      28: 50000317     	auipc	t1, 0x50000
      2c: fec30313     	addi	t1, t1, -0x14
      30: 0072fc63     	bgeu	t0, t2, 0x48 <.Lpcrel_hi5>
      34: 00032e03     	lw	t3, 0x0(t1)
      38: 00430313     	addi	t1, t1, 0x4
      3c: 01c2a023     	sw	t3, 0x0(t0)
      40: 00428293     	addi	t0, t0, 0x4
      44: fe72e8e3     	bltu	t0, t2, 0x34 <.Lpcrel_hi4+0xc>

00000048 <.Lpcrel_hi5>:
      48: 50000297     	auipc	t0, 0x50000
      4c: fcc28293     	addi	t0, t0, -0x34

00000050 <.Lpcrel_hi6>:
      50: 50000397     	auipc	t2, 0x50000
      54: fc438393     	addi	t2, t2, -0x3c
      58: 0072f863     	bgeu	t0, t2, 0x68 <.Lpcrel_hi6+0x18>
      5c: 0002a023     	sw	zero, 0x0(t0)
      60: 00428293     	addi	t0, t0, 0x4
      64: fe72ece3     	bltu	t0, t2, 0x5c <.Lpcrel_hi6+0xc>
      68: 00000097     	auipc	ra, 0x0
      6c: 0b0080e7     	jalr	0xb0(ra) <_setup_interrupts>
      70: 0780006f     	j	0xe8 <main>

00000074 <DefaultHandler>:
      74: 0000006f     	j	0x74 <DefaultHandler>

00000078 <Interrupt1>:
      78: ff010113     	addi	sp, sp, -0x10
      7c: 00112623     	sw	ra, 0xc(sp)
      80: 00989537     	lui	a0, 0x989
      84: 67f50513     	addi	a0, a0, 0x67f
      88: 00000013     	nop
      8c: fff50513     	addi	a0, a0, -0x1
      90: fe051ce3     	bnez	a0, 0x88 <Interrupt1+0x10>
      94: 500005b7     	lui	a1, 0x50000
      98: 00058593     	mv	a1, a1
      9c: 00b10513     	addi	a0, sp, 0xb
      a0: 00400613     	li	a2, 0x4
      a4: 00000097     	auipc	ra, 0x0
      a8: 0bc080e7     	jalr	0xbc(ra) <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16>
      ac: 00c12083     	lw	ra, 0xc(sp)
      b0: 01010113     	addi	sp, sp, 0x10
      b4: 00008067     	ret

000000b8 <_memex>:
      b8: ff010113     	addi	sp, sp, -0x10
      bc: 00112623     	sw	ra, 0xc(sp)
      c0: 500005b7     	lui	a1, 0x50000
      c4: 00458593     	addi	a1, a1, 0x4
      c8: 00b10513     	addi	a0, sp, 0xb
      cc: 01000613     	li	a2, 0x10
      d0: 00000097     	auipc	ra, 0x0
      d4: 090080e7     	jalr	0x90(ra) <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16>
      d8: 30047073     	csrci	mstatus, 0x8
      dc: 00100513     	li	a0, 0x1
      e0: 347515f3     	csrrw	a1, 0x347, a0
      e4: 0000006f     	j	0xe4 <_memex+0x2c>

000000e8 <main>:
      e8: 00300513     	li	a0, 0x3
      ec: 40452073     	csrs	0x404, a0
      f0: 20000537     	lui	a0, 0x20000
      f4: 40452073     	csrs	0x404, a0
      f8: 01000513     	li	a0, 0x10
      fc: 40452073     	csrs	0x404, a0
     100: 00400513     	li	a0, 0x4
     104: b2152073     	csrs	0xb21, a0
     108: b2116073     	csrsi	0xb21, 0x2
     10c: b210e073     	csrsi	0xb21, 0x1
     110: 30046073     	csrsi	mstatus, 0x8
     114: 0000006f     	j	0x114 <main+0x2c>

00000118 <_setup_interrupts>:
     118: 00000537     	lui	a0, 0x0
     11c: 15c50513     	addi	a0, a0, 0x15c
     120: 00255513     	srli	a0, a0, 0x2
     124: b00515f3     	csrrw	a1, mcycle, a0
     128: 00000537     	lui	a0, 0x0
     12c: 07850513     	addi	a0, a0, 0x78
     130: 00255513     	srli	a0, a0, 0x2
     134: b01515f3     	csrrw	a1, 0xb01, a0
     138: 00000537     	lui	a0, 0x0
     13c: 15c50513     	addi	a0, a0, 0x15c
     140: 00255513     	srli	a0, a0, 0x2
     144: b02515f3     	csrrw	a1, minstret, a0
     148: 00000537     	lui	a0, 0x0
     14c: 0b850513     	addi	a0, a0, 0xb8
     150: 00255513     	srli	a0, a0, 0x2
     154: b08515f3     	csrrw	a1, mhpmcounter8, a0
     158: 00008067     	ret

0000015c <Interrupt2>:
     15c: 0000006f     	j	0x15c <Interrupt2>

00000160 <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16>:
     160: 00060c63     	beqz	a2, 0x178 <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0x18>
     164: 0005c503     	lbu	a0, 0x0(a1)
     168: 051516f3     	csrrw	a3, 0x51, a0
     16c: 00158593     	addi	a1, a1, 0x1
     170: fff60613     	addi	a2, a2, -0x1
     174: fe0618e3     	bnez	a2, 0x164 <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0x4>
     178: 00000513     	li	a0, 0x0
     17c: 00008067     	ret

Disassembly of section .rodata:

50000000 <.rodata>:
50000000: 6155         	<unknown>
50000002: 7472         	<unknown>
50000004: 654d         	<unknown>
50000006: 6f6d         	<unknown>
50000008: 7972         	<unknown>
5000000a: 4520         	<unknown>
5000000c: 6378         	<unknown>
5000000e: 7065         	<unknown>
50000010: 6974         	<unknown>
50000012: 6f           	<unknown>
50000013: 6e           	<unknown>

Disassembly of section .stack:

50000014 <_estack>:
...

Disassembly of section .comment:

00000000 <.comment>:
       0: 4c00         	<unknown>
       2: 6e69         	<unknown>
       4: 3a72656b     	<unknown>
       8: 4c20         	<unknown>
       a: 444c         	<unknown>
       c: 3120         	<unknown>
       e: 2e39         	<unknown>
      10: 2e31         	<unknown>
      12: 2030         	<unknown>
      14: 2f28         	<unknown>
      16: 63656863     	bltu	a0, s6, 0x646 <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0x4e6>
      1a: 74756f6b     	<unknown>
      1e: 6372732f     	<unknown>
      22: 766c6c2f     	<unknown>
      26: 2d6d         	<unknown>
      28: 7270         	<unknown>
      2a: 63656a6f     	jal	s4, 0x56660 <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0x56500>
      2e: 2f74         	<unknown>
      30: 6c6c         	<unknown>
      32: 6d76         	<unknown>
      34: 3520         	<unknown>
      36: 3936         	<unknown>
      38: 3739         	<unknown>
      3a: 33393337     	lui	t1, 0x33393
      3e: 3536         	<unknown>
      40: 3865         	<unknown>
      42: 3331         	<unknown>
      44: 6332         	<unknown>
      46: 37313863     	<unknown>
      4a: 3065         	<unknown>
      4c: 3830         	<unknown>
      4e: 3939         	<unknown>
      50: 3834         	<unknown>
      52: 3730         	<unknown>
      54: 3634         	<unknown>
      56: 64393063     	<unknown>
      5a: 29396437     	lui	s0, 0x29396
      5e: 7200         	<unknown>
      60: 7375         	<unknown>
      62: 6374         	<unknown>
      64: 7620         	<unknown>
      66: 7265         	<unknown>
      68: 6e6f6973     	csrrsi	s2, 0x6e6, 0x1e
      6c: 3120         	<unknown>
      6e: 382e         	<unknown>
      70: 2d302e33     	<unknown>
      74: 696e         	<unknown>
      76: 6c746867     	<unknown>
      7a: 2079         	<unknown>
      7c: 3228         	<unknown>
      7e: 6462         	<unknown>
      80: 6531         	<unknown>
      82: 3938         	<unknown>
      84: 6534         	<unknown>
      86: 3220         	<unknown>
      88: 3230         	<unknown>
      8a: 2d34         	<unknown>
      8c: 3930         	<unknown>
      8e: 322d         	<unknown>
      90: 2936         	<unknown>
      92: 00           	<unknown>

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
       0: 2441         	<unknown>
       2: 0000         	<unknown>
       4: 7200         	<unknown>
       6: 7369         	<unknown>
       8: 01007663     	bgeu	zero, a6, 0x14 <.Lpcrel_hi1+0x8>
       c: 001a         	<unknown>
       e: 0000         	<unknown>
      10: 1004         	<unknown>
      12: 7205         	<unknown>
      14: 3376         	<unknown>
      16: 6932         	<unknown>
      18: 7032         	<unknown>
      1a: 5f31         	<unknown>
      1c: 6d7a         	<unknown>
      1e: 756d         	<unknown>
      20: 316c         	<unknown>
      22: 3070         	<unknown>
      24: 00           	<unknown>

Disassembly of section .symtab:

00000000 <.symtab>:
		...
      10: 0001         	<unknown>
		...
      1a: 0000         	<unknown>
      1c: 0004         	<unknown>
      1e: fff1         	<unknown>
      20: 0024         	<unknown>
      22: 0000         	<unknown>
      24: 0078         	<unknown>
		...
      2e: 0004         	<unknown>
      30: 0029         	<unknown>
      32: 0000         	<unknown>
      34: 0078         	<unknown>
		...
      3e: 0004         	<unknown>
      40: 002e         	<unknown>
      42: 0000         	<unknown>
      44: 0078         	<unknown>
		...
      4e: 0004         	<unknown>
      50: 0031         	<unknown>
      52: 0000         	<unknown>
      54: 0078         	<unknown>
		...
      5e: 0004         	<unknown>
      60: 0036         	<unknown>
      62: 0000         	<unknown>
      64: 0088         	<unknown>
		...
      6e: 0004         	<unknown>
      70: 0000003b     	<unknown>
      74: 0088         	<unknown>
		...
      7e: 0004         	<unknown>
      80: 0040         	<unknown>
      82: 0000         	<unknown>
      84: 008c         	<unknown>
		...
      8e: 0004         	<unknown>
      90: 0045         	<unknown>
      92: 0000         	<unknown>
      94: 008c         	<unknown>
		...
      9e: 0004         	<unknown>
      a0: 004a         	<unknown>
      a2: 0000         	<unknown>
      a4: 0090         	<unknown>
		...
      ae: 0004         	<unknown>
      b0: 0000004f     	<unknown>
      b4: 0094         	<unknown>
		...
      be: 0004         	<unknown>
      c0: 0054         	<unknown>
      c2: 0000         	<unknown>
      c4: 0094         	<unknown>
		...
      ce: 0004         	<unknown>
      d0: 0059         	<unknown>
      d2: 0000         	<unknown>
      d4: 009c         	<unknown>
		...
      de: 0004         	<unknown>
      e0: 005e         	<unknown>
      e2: 0000         	<unknown>
      e4: 00ac         	<unknown>
		...
      ee: 0004         	<unknown>
      f0: 00000063     	beqz	zero, 0xf0 <main+0x8>
      f4: 00ac         	<unknown>
		...
      fe: 0004         	<unknown>
     100: 0068         	<unknown>
     102: 0000         	<unknown>
     104: 00b0         	<unknown>
		...
     10e: 0004         	<unknown>
     110: 006d         	<unknown>
     112: 0000         	<unknown>
     114: 00b8         	<unknown>
		...
     11e: 0004         	<unknown>
     120: 0072         	<unknown>
     122: 0000         	<unknown>
     124: 00b8         	<unknown>
		...
     12e: 0004         	<unknown>
     130: 00000077     	<unknown>
     134: 00b8         	<unknown>
		...
     13e: 0004         	<unknown>
     140: 007c         	<unknown>
     142: 0000         	<unknown>
     144: 00b8         	<unknown>
		...
     14e: 0004         	<unknown>
     150: 0081         	<unknown>
     152: 0000         	<unknown>
     154: 00b8         	<unknown>
		...
     15e: 0004         	<unknown>
     160: 0084         	<unknown>
     162: 0000         	<unknown>
     164: 00b8         	<unknown>
		...
     16e: 0004         	<unknown>
     170: 0089         	<unknown>
     172: 0000         	<unknown>
     174: 00c0         	<unknown>
		...
     17e: 0004         	<unknown>
     180: 008e         	<unknown>
     182: 0000         	<unknown>
     184: 00c0         	<unknown>
		...
     18e: 0004         	<unknown>
     190: 00000093     	li	ra, 0x0
     194: 00d8         	<unknown>
		...
     19e: 0004         	<unknown>
     1a0: 0098         	<unknown>
     1a2: 0000         	<unknown>
     1a4: 00d8         	<unknown>
		...
     1ae: 0004         	<unknown>
     1b0: 009d         	<unknown>
     1b2: 0000         	<unknown>
     1b4: 00e0         	<unknown>
		...
     1be: 0004         	<unknown>
     1c0: 00a2         	<unknown>
     1c2: 0000         	<unknown>
     1c4: 00e0         	<unknown>
		...
     1ce: 0004         	<unknown>
     1d0: 000000a7     	<unknown>
     1d4: 00e4         	<unknown>
		...
     1de: 0004         	<unknown>
     1e0: 00ac         	<unknown>
     1e2: 0000         	<unknown>
     1e4: 00e8         	<unknown>
		...
     1ee: 0004         	<unknown>
     1f0: 00b1         	<unknown>
     1f2: 0000         	<unknown>
     1f4: 00e8         	<unknown>
		...
     1fe: 0004         	<unknown>
     200: 00b6         	<unknown>
     202: 0000         	<unknown>
     204: 00e8         	<unknown>
		...
     20e: 0004         	<unknown>
     210: 000000bb     	<unknown>
     214: 00e8         	<unknown>
		...
     21e: 0004         	<unknown>
     220: 00be         	<unknown>
     222: 0000         	<unknown>
     224: 00e8         	<unknown>
		...
     22e: 0004         	<unknown>
     230: 000000c3     	<unknown>
     234: 00ec         	<unknown>
		...
     23e: 0004         	<unknown>
     240: 00c8         	<unknown>
     242: 0000         	<unknown>
     244: 00ec         	<unknown>
		...
     24e: 0004         	<unknown>
     250: 00cd         	<unknown>
     252: 0000         	<unknown>
     254: 00f4         	<unknown>
		...
     25e: 0004         	<unknown>
     260: 00d2         	<unknown>
     262: 0000         	<unknown>
     264: 00f4         	<unknown>
		...
     26e: 0004         	<unknown>
     270: 000000d7     	<unknown>
     274: 00fc         	<unknown>
		...
     27e: 0004         	<unknown>
     280: 00dc         	<unknown>
     282: 0000         	<unknown>
     284: 00fc         	<unknown>
		...
     28e: 0004         	<unknown>
     290: 00e1         	<unknown>
     292: 0000         	<unknown>
     294: 0104         	<unknown>
		...
     29e: 0004         	<unknown>
     2a0: 00e6         	<unknown>
     2a2: 0000         	<unknown>
     2a4: 0104         	<unknown>
		...
     2ae: 0004         	<unknown>
     2b0: 000000eb     	<unknown>
     2b4: 0108         	<unknown>
		...
     2be: 0004         	<unknown>
     2c0: 00f0         	<unknown>
     2c2: 0000         	<unknown>
     2c4: 0108         	<unknown>
		...
     2ce: 0004         	<unknown>
     2d0: 00f5         	<unknown>
     2d2: 0000         	<unknown>
     2d4: 010c         	<unknown>
		...
     2de: 0004         	<unknown>
     2e0: 00fa         	<unknown>
     2e2: 0000         	<unknown>
     2e4: 010c         	<unknown>
		...
     2ee: 0004         	<unknown>
     2f0: 00ff 0000 0110 0000 0000     	<unknown>
     2fa: 0000         	<unknown>
     2fc: 0000         	<unknown>
     2fe: 0004         	<unknown>
     300: 0104         	<unknown>
     302: 0000         	<unknown>
     304: 0110         	<unknown>
		...
     30e: 0004         	<unknown>
     310: 0109         	<unknown>
     312: 0000         	<unknown>
     314: 0114         	<unknown>
		...
     31e: 0004         	<unknown>
     320: 010e         	<unknown>
     322: 0000         	<unknown>
     324: 0118         	<unknown>
		...
     32e: 0004         	<unknown>
     330: 00000113     	li	sp, 0x0
     334: 0000         	<unknown>
     336: 5000         	<unknown>
     338: 0000         	<unknown>
     33a: 0000         	<unknown>
     33c: 0000         	<unknown>
     33e: 0005         	<unknown>
     340: 0116         	<unknown>
     342: 0000         	<unknown>
     344: 0004         	<unknown>
     346: 5000         	<unknown>
     348: 0000         	<unknown>
     34a: 0000         	<unknown>
     34c: 0000         	<unknown>
     34e: 0005         	<unknown>
     350: 0119         	<unknown>
     352: 0000         	<unknown>
     354: 2000         	<unknown>
     356: 5000         	<unknown>
     358: 0000         	<unknown>
     35a: 0000         	<unknown>
     35c: 0000         	<unknown>
     35e: 0002         	<unknown>
     360: 011c         	<unknown>
		...
     36e: fff1         	<unknown>
     370: 0121         	<unknown>
		...
     37e: fff1         	<unknown>
     380: 0124         	<unknown>
     382: 0000         	<unknown>
     384: 0039         	<unknown>
		...
     38e: fff1         	<unknown>
     390: 0129         	<unknown>
     392: 0000         	<unknown>
     394: 007a         	<unknown>
		...
     39e: fff1         	<unknown>
     3a0: 012e         	<unknown>
		...
     3ae: fff1         	<unknown>
     3b0: 0131         	<unknown>
		...
     3be: fff1         	<unknown>
     3c0: 0136         	<unknown>
		...
     3ce: fff1         	<unknown>
     3d0: 0139         	<unknown>
		...
     3de: fff1         	<unknown>
     3e0: 014d         	<unknown>
		...
     3ee: fff1         	<unknown>
     3f0: 0152         	<unknown>
     3f2: 0000         	<unknown>
     3f4: 00b8         	<unknown>
		...
     3fe: 0004         	<unknown>
     400: 00000157     	<unknown>
		...
     40c: 0000         	<unknown>
     40e: fff1         	<unknown>
     410: 015a         	<unknown>
		...
     41e: fff1         	<unknown>
     420: 015d         	<unknown>
		...
     42e: fff1         	<unknown>
     430: 0160         	<unknown>
		...
     43e: 000a         	<unknown>
     440: 00000163     	beqz	zero, 0x442 <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0x2e2>
		...
     44c: 0000         	<unknown>
     44e: fff1         	<unknown>
     450: 0166         	<unknown>
		...
     45e: fff1         	<unknown>
     460: 0000016b     	<unknown>
		...
     46c: 0000         	<unknown>
     46e: fff1         	<unknown>
     470: 016e         	<unknown>
		...
     47e: fff1         	<unknown>
     480: 0171         	<unknown>
		...
     48a: 0000         	<unknown>
     48c: 0004         	<unknown>
     48e: fff1         	<unknown>
     490: 0196         	<unknown>
     492: 0000         	<unknown>
     494: 0004         	<unknown>
		...
     49e: 0004         	<unknown>
     4a0: 01a1         	<unknown>
     4a2: 0000         	<unknown>
     4a4: 0004         	<unknown>
		...
     4ae: 0004         	<unknown>
     4b0: 01a6         	<unknown>
     4b2: 0000         	<unknown>
     4b4: 0004         	<unknown>
		...
     4be: 0004         	<unknown>
     4c0: 01b2         	<unknown>
     4c2: 0000         	<unknown>
     4c4: 0004         	<unknown>
		...
     4ce: 0004         	<unknown>
     4d0: 01b5         	<unknown>
     4d2: 0000         	<unknown>
     4d4: 000c         	<unknown>
		...
     4de: 0004         	<unknown>
     4e0: 01c1         	<unknown>
     4e2: 0000         	<unknown>
     4e4: 0018         	<unknown>
		...
     4ee: 0004         	<unknown>
     4f0: 01cd         	<unknown>
     4f2: 0000         	<unknown>
     4f4: 0020         	<unknown>
		...
     4fe: 0004         	<unknown>
     500: 01d9         	<unknown>
     502: 0000         	<unknown>
     504: 0028         	<unknown>
		...
     50e: 0004         	<unknown>
     510: 01e5         	<unknown>
     512: 0000         	<unknown>
     514: 0048         	<unknown>
		...
     51e: 0004         	<unknown>
     520: 01f1         	<unknown>
     522: 0000         	<unknown>
     524: 0050         	<unknown>
		...
     52e: 0004         	<unknown>
     530: 01fd         	<unknown>
     532: 0000         	<unknown>
     534: 0074         	<unknown>
		...
     53e: 0004         	<unknown>
     540: 0202         	<unknown>
     542: 0000         	<unknown>
     544: 0118         	<unknown>
		...
     54e: 0004         	<unknown>
     550: 00000207     	<unknown>
     554: 0118         	<unknown>
		...
     55e: 0004         	<unknown>
     560: 020c         	<unknown>
     562: 0000         	<unknown>
     564: 0118         	<unknown>
		...
     56e: 0004         	<unknown>
     570: 0000020f     	<unknown>
     574: 0118         	<unknown>
		...
     57e: 0004         	<unknown>
     580: 0214         	<unknown>
     582: 0000         	<unknown>
     584: 0124         	<unknown>
		...
     58e: 0004         	<unknown>
     590: 0219         	<unknown>
     592: 0000         	<unknown>
     594: 0124         	<unknown>
		...
     59e: 0004         	<unknown>
     5a0: 021e         	<unknown>
     5a2: 0000         	<unknown>
     5a4: 0128         	<unknown>
		...
     5ae: 0004         	<unknown>
     5b0: 00000223     	sb	zero, 0x4(zero)
     5b4: 0134         	<unknown>
		...
     5be: 0004         	<unknown>
     5c0: 0228         	<unknown>
     5c2: 0000         	<unknown>
     5c4: 0134         	<unknown>
		...
     5ce: 0004         	<unknown>
     5d0: 022d         	<unknown>
     5d2: 0000         	<unknown>
     5d4: 0138         	<unknown>
		...
     5de: 0004         	<unknown>
     5e0: 0232         	<unknown>
     5e2: 0000         	<unknown>
     5e4: 0144         	<unknown>
		...
     5ee: 0004         	<unknown>
     5f0: 00000237     	lui	tp, 0x0
     5f4: 0144         	<unknown>
		...
     5fe: 0004         	<unknown>
     600: 023c         	<unknown>
     602: 0000         	<unknown>
     604: 0148         	<unknown>
		...
     60e: 0004         	<unknown>
     610: 0241         	<unknown>
     612: 0000         	<unknown>
     614: 0154         	<unknown>
		...
     61e: 0004         	<unknown>
     620: 0246         	<unknown>
     622: 0000         	<unknown>
     624: 0154         	<unknown>
		...
     62e: 0004         	<unknown>
     630: 0000024b     	<unknown>
     634: 0158         	<unknown>
		...
     63e: 0004         	<unknown>
     640: 0250         	<unknown>
     642: 0000         	<unknown>
     644: 015c         	<unknown>
		...
     64e: 0004         	<unknown>
     650: 0255         	<unknown>
     652: 0000         	<unknown>
     654: 015c         	<unknown>
		...
     65e: 0004         	<unknown>
     660: 025a         	<unknown>
     662: 0000         	<unknown>
     664: 015c         	<unknown>
		...
     66e: 0004         	<unknown>
     670: 025f 0000 015c       	<unknown>
		...
     67e: 0004         	<unknown>
     680: 0262         	<unknown>
     682: 0000         	<unknown>
     684: 015c         	<unknown>
		...
     68e: 0004         	<unknown>
     690: 00000267     	jalr	tp, zero <.symtab>
     694: 0160         	<unknown>
		...
     69e: 0004         	<unknown>
     6a0: 026c         	<unknown>
		...
     6ae: fff1         	<unknown>
     6b0: 0000026f     	jal	tp, 0x6b0 <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0x550>
		...
     6bc: 0000         	<unknown>
     6be: fff1         	<unknown>
     6c0: 0274         	<unknown>
		...
     6ce: fff1         	<unknown>
     6d0: 00000277     	<unknown>
		...
     6dc: 0000         	<unknown>
     6de: fff1         	<unknown>
     6e0: 0000028b     	<unknown>
		...
     6ec: 0000         	<unknown>
     6ee: fff1         	<unknown>
     6f0: 0290         	<unknown>
		...
     6fe: fff1         	<unknown>
     700: 00000293     	li	t0, 0x0
		...
     70c: 0000         	<unknown>
     70e: fff1         	<unknown>
     710: 0296         	<unknown>
		...
     71e: fff1         	<unknown>
     720: 0299         	<unknown>
		...
     72e: 000a         	<unknown>
     730: 029c         	<unknown>
		...
     73e: fff1         	<unknown>
     740: 029f 0000 0000       	<unknown>
		...
     74e: fff1         	<unknown>
     750: 02a4         	<unknown>
		...
     75e: fff1         	<unknown>
     760: 000002a7     	<unknown>
		...
     76c: 0000         	<unknown>
     76e: fff1         	<unknown>
     770: 02aa         	<unknown>
		...
     77a: 0000         	<unknown>
     77c: 0004         	<unknown>
     77e: fff1         	<unknown>
     780: 02d1         	<unknown>
     782: 0000         	<unknown>
     784: 0160         	<unknown>
		...
     78e: 0004         	<unknown>
     790: 02d6         	<unknown>
     792: 0000         	<unknown>
     794: 0160         	<unknown>
		...
     79e: 0004         	<unknown>
     7a0: 000002db     	<unknown>
     7a4: 0160         	<unknown>
		...
     7ae: 0004         	<unknown>
     7b0: 02de         	<unknown>
     7b2: 0000         	<unknown>
     7b4: 0160         	<unknown>
		...
     7be: 0004         	<unknown>
     7c0: 000002e3     	beqz	zero, 0xfc4 <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0xe64>
     7c4: 0164         	<unknown>
		...
     7ce: 0004         	<unknown>
     7d0: 02e8         	<unknown>
     7d2: 0000         	<unknown>
     7d4: 0164         	<unknown>
		...
     7de: 0004         	<unknown>
     7e0: 02ed         	<unknown>
     7e2: 0000         	<unknown>
     7e4: 0164         	<unknown>
		...
     7ee: 0004         	<unknown>
     7f0: 02f2         	<unknown>
     7f2: 0000         	<unknown>
     7f4: 0168         	<unknown>
		...
     7fe: 0004         	<unknown>
     800: 000002f7     	<unknown>
     804: 0168         	<unknown>
		...
     80e: 0004         	<unknown>
     810: 02fc         	<unknown>
     812: 0000         	<unknown>
     814: 016c         	<unknown>
		...
     81e: 0004         	<unknown>
     820: 0301         	<unknown>
     822: 0000         	<unknown>
     824: 016c         	<unknown>
		...
     82e: 0004         	<unknown>
     830: 0306         	<unknown>
     832: 0000         	<unknown>
     834: 0170         	<unknown>
		...
     83e: 0004         	<unknown>
     840: 0000030b     	<unknown>
     844: 0170         	<unknown>
		...
     84e: 0004         	<unknown>
     850: 0310         	<unknown>
     852: 0000         	<unknown>
     854: 0174         	<unknown>
		...
     85e: 0004         	<unknown>
     860: 0315         	<unknown>
     862: 0000         	<unknown>
     864: 0178         	<unknown>
		...
     86e: 0004         	<unknown>
     870: 031a         	<unknown>
     872: 0000         	<unknown>
     874: 0178         	<unknown>
		...
     87e: 0004         	<unknown>
     880: 031f 0000 0180       	<unknown>
		...
     88e: 0004         	<unknown>
     890: 0324         	<unknown>
     892: 0000         	<unknown>
     894: 0180         	<unknown>
		...
     89e: 0004         	<unknown>
     8a0: 0329         	<unknown>
		...
     8ae: fff1         	<unknown>
     8b0: 032e         	<unknown>
		...
     8be: fff1         	<unknown>
     8c0: 0331         	<unknown>
     8c2: 0000         	<unknown>
     8c4: 0020         	<unknown>
		...
     8ce: fff1         	<unknown>
     8d0: 0336         	<unknown>
     8d2: 0000         	<unknown>
     8d4: 0000003b     	<unknown>
     8d8: 0000         	<unknown>
     8da: 0000         	<unknown>
     8dc: 0000         	<unknown>
     8de: fff1         	<unknown>
     8e0: 0000033b     	<unknown>
     8e4: 0000005b     	<unknown>
     8e8: 0000         	<unknown>
     8ea: 0000         	<unknown>
     8ec: 0000         	<unknown>
     8ee: fff1         	<unknown>
     8f0: 0340         	<unknown>
		...
     8fe: fff1         	<unknown>
     900: 00000343     	<unknown>
		...
     90c: 0000         	<unknown>
     90e: fff1         	<unknown>
     910: 0348         	<unknown>
		...
     91e: fff1         	<unknown>
     920: 0000034b     	<unknown>
		...
     92c: 0000         	<unknown>
     92e: fff1         	<unknown>
     930: 035f 0000 0048       	<unknown>
		...
     93e: fff1         	<unknown>
     940: 0364         	<unknown>
		...
     94e: fff1         	<unknown>
     950: 0369         	<unknown>
     952: 0000         	<unknown>
     954: 0018         	<unknown>
		...
     95e: fff1         	<unknown>
     960: 036e         	<unknown>
     962: 0000         	<unknown>
     964: 0030         	<unknown>
		...
     96e: fff1         	<unknown>
     970: 00000373     	<unknown>
     974: 0180         	<unknown>
		...
     97e: 0004         	<unknown>
     980: 0378         	<unknown>
		...
     98e: fff1         	<unknown>
     990: 0000037b     	<unknown>
		...
     99c: 0000         	<unknown>
     99e: fff1         	<unknown>
     9a0: 037e         	<unknown>
		...
     9ae: fff1         	<unknown>
     9b0: 0381         	<unknown>
		...
     9be: 000a         	<unknown>
     9c0: 0384         	<unknown>
		...
     9ce: fff1         	<unknown>
     9d0: 00000387     	<unknown>
		...
     9dc: 0000         	<unknown>
     9de: fff1         	<unknown>
     9e0: 038c         	<unknown>
		...
     9ee: fff1         	<unknown>
     9f0: 0000038f     	<unknown>
		...
     9fc: 0000         	<unknown>
     9fe: fff1         	<unknown>
     a00: 0392         	<unknown>
     a02: 0000         	<unknown>
     a04: 0074         	<unknown>
     a06: 0000         	<unknown>
     a08: 0000         	<unknown>
     a0a: 0000         	<unknown>
     a0c: 0020         	<unknown>
     a0e: 0004         	<unknown>
     a10: 03a1         	<unknown>
     a12: 0000         	<unknown>
     a14: 0078         	<unknown>
     a16: 0000         	<unknown>
     a18: 0040         	<unknown>
     a1a: 0000         	<unknown>
     a1c: 0012         	<unknown>
     a1e: 0004         	<unknown>
     a20: 03ac         	<unknown>
     a22: 0000         	<unknown>
     a24: 00b8         	<unknown>
     a26: 0000         	<unknown>
     a28: 0030         	<unknown>
     a2a: 0000         	<unknown>
     a2c: 0012         	<unknown>
     a2e: 0004         	<unknown>
     a30: 000003b3     	add	t2, zero, zero
     a34: 2000         	<unknown>
     a36: 5000         	<unknown>
     a38: 0008         	<unknown>
     a3a: 0000         	<unknown>
     a3c: 0011         	<unknown>
     a3e: 0002         	<unknown>
     a40: 03bc         	<unknown>
     a42: 0000         	<unknown>
     a44: 00e8         	<unknown>
     a46: 0000         	<unknown>
     a48: 0030         	<unknown>
     a4a: 0000         	<unknown>
     a4c: 0012         	<unknown>
     a4e: 0004         	<unknown>
     a50: 03c1         	<unknown>
     a52: 0000         	<unknown>
     a54: 015c         	<unknown>
     a56: 0000         	<unknown>
     a58: 0004         	<unknown>
     a5a: 0000         	<unknown>
     a5c: 0012         	<unknown>
     a5e: 0004         	<unknown>
     a60: 03d9         	<unknown>
     a62: 0000         	<unknown>
     a64: 0118         	<unknown>
     a66: 0000         	<unknown>
     a68: 0044         	<unknown>
     a6a: 0000         	<unknown>
     a6c: 0012         	<unknown>
     a6e: 0004         	<unknown>
     a70: 000003eb     	<unknown>
     a74: 0160         	<unknown>
     a76: 0000         	<unknown>
     a78: 0020         	<unknown>
     a7a: 0000         	<unknown>
     a7c: 0012         	<unknown>
     a7e: 0004         	<unknown>
     a80: 0449         	<unknown>
     a82: 0000         	<unknown>
     a84: 0004         	<unknown>
     a86: 0000         	<unknown>
     a88: 0000         	<unknown>
     a8a: 0000         	<unknown>
     a8c: 0010         	<unknown>
     a8e: 0004         	<unknown>
     a90: 0450         	<unknown>
     a92: 0000         	<unknown>
     a94: 0814         	<unknown>
     a96: 5000         	<unknown>
     a98: 0000         	<unknown>
     a9a: 0000         	<unknown>
     a9c: 0010         	<unknown>
     a9e: 0006         	<unknown>
     aa0: 0462         	<unknown>
     aa2: 0000         	<unknown>
     aa4: 1000         	<unknown>
     aa6: 5000         	<unknown>
     aa8: 0000         	<unknown>
     aaa: 0000         	<unknown>
     aac: 0010         	<unknown>
     aae: fff1         	<unknown>
     ab0: 0000046f     	jal	s0, 0xab0 <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0x950>
     ab4: 0014         	<unknown>
     ab6: 5000         	<unknown>
     ab8: 0000         	<unknown>
     aba: 0000         	<unknown>
     abc: 0010         	<unknown>
     abe: 0006         	<unknown>
     ac0: 0476         	<unknown>
     ac2: 0000         	<unknown>
     ac4: 0014         	<unknown>
     ac6: 5000         	<unknown>
     ac8: 0000         	<unknown>
     aca: 0000         	<unknown>
     acc: 0010         	<unknown>
     ace: 0006         	<unknown>
     ad0: 047d         	<unknown>
     ad2: 0000         	<unknown>
     ad4: 0014         	<unknown>
     ad6: 5000         	<unknown>
     ad8: 0000         	<unknown>
     ada: 0000         	<unknown>
     adc: 0010         	<unknown>
     ade: fff1         	<unknown>
     ae0: 0485         	<unknown>
     ae2: 0000         	<unknown>
     ae4: 0014         	<unknown>
     ae6: 5000         	<unknown>
     ae8: 0000         	<unknown>
     aea: 0000         	<unknown>
     aec: 0010         	<unknown>
     aee: 048b0007     	<unknown>
     af2: 0000         	<unknown>
     af4: 0014         	<unknown>
     af6: 5000         	<unknown>
     af8: 0000         	<unknown>
     afa: 0000         	<unknown>
     afc: 0010         	<unknown>
     afe: 04910007     	<unknown>
     b02: 0000         	<unknown>
     b04: 015c         	<unknown>
     b06: 0000         	<unknown>
     b08: 0000         	<unknown>
     b0a: 0000         	<unknown>
     b0c: 0012         	<unknown>
     b0e: 0004         	<unknown>
     b10: 049c         	<unknown>
     b12: 0000         	<unknown>
     b14: 015c         	<unknown>
     b16: 0000         	<unknown>
     b18: 0000         	<unknown>
     b1a: 0000         	<unknown>
     b1c: 0012         	<unknown>
     b1e: 0004         	<unknown>
     b20: 000004a7     	<unknown>
     b24: 0004         	<unknown>
     b26: 0000         	<unknown>
     b28: 0000         	<unknown>
     b2a: 0000         	<unknown>
     b2c: 0010         	<unknown>
     b2e: fff1         	<unknown>
     b30: 04ae         	<unknown>
		...
     b3a: 0000         	<unknown>
     b3c: 0010         	<unknown>
     b3e: fff1         	<unknown>
     b40: 04b9         	<unknown>
     b42: 0000         	<unknown>
     b44: 0014         	<unknown>
     b46: 5000         	<unknown>
     b48: 0000         	<unknown>
     b4a: 0000         	<unknown>
     b4c: 0010         	<unknown>
     b4e: 0008         	<unknown>
     b50: 04c0         	<unknown>
		...
     b5a: 0000         	<unknown>
     b5c: 0010         	<unknown>
     b5e: fff1         	<unknown>
     b60: 04cd         	<unknown>
     b62: 0000         	<unknown>
     b64: 0800         	<unknown>
     b66: 0000         	<unknown>
     b68: 0000         	<unknown>
     b6a: 0000         	<unknown>
     b6c: 0010         	<unknown>
     b6e: fff1         	<unknown>
     b70: 04de         	<unknown>
     b72: 0000         	<unknown>
     b74: 0000         	<unknown>
     b76: 5000         	<unknown>
     b78: 0000         	<unknown>
     b7a: 0000         	<unknown>
     b7c: 0010         	<unknown>
     b7e: 0001         	<unknown>
     b80: 04e8         	<unknown>
     b82: 0000         	<unknown>
     b84: 0000         	<unknown>
     b86: 5000         	<unknown>
     b88: 0000         	<unknown>
     b8a: 0000         	<unknown>
     b8c: 0010         	<unknown>
     b8e: 0001         	<unknown>
     b90: 04f2         	<unknown>
     b92: 0000         	<unknown>
     b94: 0014         	<unknown>
     b96: 5000         	<unknown>
     b98: 0000         	<unknown>
     b9a: 0000         	<unknown>
     b9c: 0010         	<unknown>
     b9e: 0008         	<unknown>
     ba0: 04f9         	<unknown>
     ba2: 0000         	<unknown>
     ba4: 0014         	<unknown>
     ba6: 5000         	<unknown>
     ba8: 0000         	<unknown>
     baa: 0000         	<unknown>
     bac: 0010         	<unknown>
     bae: 0009         	<unknown>
     bb0: 0501         	<unknown>
     bb2: 0000         	<unknown>
     bb4: 1000         	<unknown>
     bb6: 5000         	<unknown>
     bb8: 0000         	<unknown>
     bba: 0000         	<unknown>
     bbc: 0010         	<unknown>
     bbe: 0009         	<unknown>

Disassembly of section .shstrtab:

00000000 <.shstrtab>:
       0: 2e00         	<unknown>
       2: 6e75         	<unknown>
       4: 6e69         	<unknown>
       6: 7469         	<unknown>
       8: 2e00         	<unknown>
       a: 7379656b     	<unknown>
       e: 6f74         	<unknown>
      10: 6572         	<unknown>
      12: 2e00         	<unknown>
      14: 6574         	<unknown>
      16: 7478         	<unknown>
      18: 642e         	<unknown>
      1a: 6d75         	<unknown>
      1c: 796d         	<unknown>
      1e: 2e00         	<unknown>
      20: 6574         	<unknown>
      22: 7478         	<unknown>
      24: 2e00         	<unknown>
      26: 6f72         	<unknown>
      28: 6164         	<unknown>
      2a: 6174         	<unknown>
      2c: 2e00         	<unknown>
      2e: 6164         	<unknown>
      30: 6174         	<unknown>
      32: 2e00         	<unknown>
      34: 7362         	<unknown>
      36: 682e0073     	<unknown>
      3a: 6165         	<unknown>
      3c: 0070         	<unknown>
      3e: 732e         	<unknown>
      40: 6174         	<unknown>
      42: 2e006b63     	bltu	zero, zero, 0x338 <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0x1d8>
      46: 6d6d6f63     	bltu	s10, s6, 0x724 <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0x5c4>
      4a: 6e65         	<unknown>
      4c: 0074         	<unknown>
      4e: 722e         	<unknown>
      50: 7369         	<unknown>
      52: 612e7663     	bgeu	t3, s2, 0x65e <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0x4fe>
      56: 7474         	<unknown>
      58: 6972         	<unknown>
      5a: 7562         	<unknown>
      5c: 6574         	<unknown>
      5e: 732e0073     	<unknown>
      62: 6d79         	<unknown>
      64: 6174         	<unknown>
      66: 0062         	<unknown>
      68: 732e         	<unknown>
      6a: 7368         	<unknown>
      6c: 7274         	<unknown>
      6e: 6174         	<unknown>
      70: 0062         	<unknown>
      72: 732e         	<unknown>
      74: 7274         	<unknown>
      76: 6174         	<unknown>
      78: 0062         	<unknown>

Disassembly of section .strtab:

00000000 <.strtab>:
       0: 7200         	<unknown>
       2: 7375         	<unknown>
       4: 5f74         	<unknown>
       6: 6c62         	<unknown>
       8: 6e69         	<unknown>
       a: 372e796b     	<unknown>
       e: 3530         	<unknown>
      10: 6531         	<unknown>
      12: 3864         	<unknown>
      14: 3235         	<unknown>
      16: 3366         	<unknown>
      18: 3234         	<unknown>
      1a: 6236         	<unknown>
      1c: 67632d37     	lui	s10, 0x67632
      20: 2e75         	<unknown>
      22: 0030         	<unknown>
      24: 4c2e         	<unknown>
      26: 2030         	<unknown>
      28: 2e00         	<unknown>
      2a: 304c         	<unknown>
      2c: 0020         	<unknown>
      2e: 7824         	<unknown>
      30: 2e00         	<unknown>
      32: 304c         	<unknown>
      34: 0020         	<unknown>
      36: 4c2e         	<unknown>
      38: 2030         	<unknown>
      3a: 2e00         	<unknown>
      3c: 304c         	<unknown>
      3e: 0020         	<unknown>
      40: 4c2e         	<unknown>
      42: 2030         	<unknown>
      44: 2e00         	<unknown>
      46: 304c         	<unknown>
      48: 0020         	<unknown>
      4a: 4c2e         	<unknown>
      4c: 2030         	<unknown>
      4e: 2e00         	<unknown>
      50: 304c         	<unknown>
      52: 0020         	<unknown>
      54: 4c2e         	<unknown>
      56: 2030         	<unknown>
      58: 2e00         	<unknown>
      5a: 304c         	<unknown>
      5c: 0020         	<unknown>
      5e: 4c2e         	<unknown>
      60: 2030         	<unknown>
      62: 2e00         	<unknown>
      64: 304c         	<unknown>
      66: 0020         	<unknown>
      68: 4c2e         	<unknown>
      6a: 2030         	<unknown>
      6c: 2e00         	<unknown>
      6e: 304c         	<unknown>
      70: 0020         	<unknown>
      72: 4c2e         	<unknown>
      74: 2030         	<unknown>
      76: 2e00         	<unknown>
      78: 304c         	<unknown>
      7a: 0020         	<unknown>
      7c: 4c2e         	<unknown>
      7e: 2030         	<unknown>
      80: 2400         	<unknown>
      82: 0078         	<unknown>
      84: 4c2e         	<unknown>
      86: 2030         	<unknown>
      88: 2e00         	<unknown>
      8a: 304c         	<unknown>
      8c: 0020         	<unknown>
      8e: 4c2e         	<unknown>
      90: 2030         	<unknown>
      92: 2e00         	<unknown>
      94: 304c         	<unknown>
      96: 0020         	<unknown>
      98: 4c2e         	<unknown>
      9a: 2030         	<unknown>
      9c: 2e00         	<unknown>
      9e: 304c         	<unknown>
      a0: 0020         	<unknown>
      a2: 4c2e         	<unknown>
      a4: 2030         	<unknown>
      a6: 2e00         	<unknown>
      a8: 304c         	<unknown>
      aa: 0020         	<unknown>
      ac: 4c2e         	<unknown>
      ae: 2030         	<unknown>
      b0: 2e00         	<unknown>
      b2: 304c         	<unknown>
      b4: 0020         	<unknown>
      b6: 4c2e         	<unknown>
      b8: 2030         	<unknown>
      ba: 2400         	<unknown>
      bc: 0078         	<unknown>
      be: 4c2e         	<unknown>
      c0: 2030         	<unknown>
      c2: 2e00         	<unknown>
      c4: 304c         	<unknown>
      c6: 0020         	<unknown>
      c8: 4c2e         	<unknown>
      ca: 2030         	<unknown>
      cc: 2e00         	<unknown>
      ce: 304c         	<unknown>
      d0: 0020         	<unknown>
      d2: 4c2e         	<unknown>
      d4: 2030         	<unknown>
      d6: 2e00         	<unknown>
      d8: 304c         	<unknown>
      da: 0020         	<unknown>
      dc: 4c2e         	<unknown>
      de: 2030         	<unknown>
      e0: 2e00         	<unknown>
      e2: 304c         	<unknown>
      e4: 0020         	<unknown>
      e6: 4c2e         	<unknown>
      e8: 2030         	<unknown>
      ea: 2e00         	<unknown>
      ec: 304c         	<unknown>
      ee: 0020         	<unknown>
      f0: 4c2e         	<unknown>
      f2: 2030         	<unknown>
      f4: 2e00         	<unknown>
      f6: 304c         	<unknown>
      f8: 0020         	<unknown>
      fa: 4c2e         	<unknown>
      fc: 2030         	<unknown>
      fe: 2e00         	<unknown>
     100: 304c         	<unknown>
     102: 0020         	<unknown>
     104: 4c2e         	<unknown>
     106: 2030         	<unknown>
     108: 2e00         	<unknown>
     10a: 304c         	<unknown>
     10c: 0020         	<unknown>
     10e: 4c2e         	<unknown>
     110: 2030         	<unknown>
     112: 2400         	<unknown>
     114: 0064         	<unknown>
     116: 6424         	<unknown>
     118: 2400         	<unknown>
     11a: 0064         	<unknown>
     11c: 4c2e         	<unknown>
     11e: 2030         	<unknown>
     120: 2400         	<unknown>
     122: 0064         	<unknown>
     124: 4c2e         	<unknown>
     126: 2030         	<unknown>
     128: 2e00         	<unknown>
     12a: 304c         	<unknown>
     12c: 0020         	<unknown>
     12e: 6424         	<unknown>
     130: 2e00         	<unknown>
     132: 304c         	<unknown>
     134: 0020         	<unknown>
     136: 6424         	<unknown>
     138: 2e00         	<unknown>
     13a: 6c4c         	<unknown>
     13c: 6e69         	<unknown>
     13e: 5f65         	<unknown>
     140: 6174         	<unknown>
     142: 6c62         	<unknown>
     144: 5f65         	<unknown>
     146: 72617473     	csrrci	s0, mhpmevent6h, 0x2
     14a: 3074         	<unknown>
     14c: 2e00         	<unknown>
     14e: 304c         	<unknown>
     150: 0020         	<unknown>
     152: 4c2e         	<unknown>
     154: 2030         	<unknown>
     156: 2400         	<unknown>
     158: 0064         	<unknown>
     15a: 6424         	<unknown>
     15c: 2400         	<unknown>
     15e: 0064         	<unknown>
     160: 6424         	<unknown>
     162: 2400         	<unknown>
     164: 0064         	<unknown>
     166: 4c2e         	<unknown>
     168: 2030         	<unknown>
     16a: 2400         	<unknown>
     16c: 0064         	<unknown>
     16e: 6424         	<unknown>
     170: 6800         	<unknown>
     172: 7069         	<unknown>
     174: 6f70         	<unknown>
     176: 656d         	<unknown>
     178: 656e         	<unknown>
     17a: 74725f73     	csrrwi	t5, mseccfg, 0x4
     17e: 392e         	<unknown>
     180: 3264         	<unknown>
     182: 3162         	<unknown>
     184: 3161         	<unknown>
     186: 6465         	<unknown>
     188: 33653937     	lui	s2, 0x33653
     18c: 3936         	<unknown>
     18e: 2d64         	<unknown>
     190: 2e756763     	bltu	a0, t2, 0x47e <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0x31e>
     194: 0030         	<unknown>
     196: 615f 7362 735f       	<unknown>
     19c: 6174         	<unknown>
     19e: 7472         	<unknown>
     1a0: 2e00         	<unknown>
     1a2: 304c         	<unknown>
     1a4: 0020         	<unknown>
     1a6: 4c2e         	<unknown>
     1a8: 6370         	<unknown>
     1aa: 6572         	<unknown>
     1ac: 5f6c         	<unknown>
     1ae: 6968         	<unknown>
     1b0: 0030         	<unknown>
     1b2: 7824         	<unknown>
     1b4: 2e00         	<unknown>
     1b6: 704c         	<unknown>
     1b8: 6c657263     	bgeu	a0, t1, 0x87c <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0x71c>
     1bc: 685f 3169 2e00       	<unknown>
     1c2: 704c         	<unknown>
     1c4: 6c657263     	bgeu	a0, t1, 0x888 <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0x728>
     1c8: 685f 3269 2e00       	<unknown>
     1ce: 704c         	<unknown>
     1d0: 6c657263     	bgeu	a0, t1, 0x894 <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0x734>
     1d4: 685f 3369 2e00       	<unknown>
     1da: 704c         	<unknown>
     1dc: 6c657263     	bgeu	a0, t1, 0x8a0 <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0x740>
     1e0: 685f 3469 2e00       	<unknown>
     1e6: 704c         	<unknown>
     1e8: 6c657263     	bgeu	a0, t1, 0x8ac <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0x74c>
     1ec: 685f 3569 2e00       	<unknown>
     1f2: 704c         	<unknown>
     1f4: 6c657263     	bgeu	a0, t1, 0x8b8 <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0x758>
     1f8: 685f 3669 2e00       	<unknown>
     1fe: 304c         	<unknown>
     200: 0020         	<unknown>
     202: 4c2e         	<unknown>
     204: 2030         	<unknown>
     206: 2e00         	<unknown>
     208: 304c         	<unknown>
     20a: 0020         	<unknown>
     20c: 7824         	<unknown>
     20e: 2e00         	<unknown>
     210: 304c         	<unknown>
     212: 0020         	<unknown>
     214: 4c2e         	<unknown>
     216: 2030         	<unknown>
     218: 2e00         	<unknown>
     21a: 304c         	<unknown>
     21c: 0020         	<unknown>
     21e: 4c2e         	<unknown>
     220: 2030         	<unknown>
     222: 2e00         	<unknown>
     224: 304c         	<unknown>
     226: 0020         	<unknown>
     228: 4c2e         	<unknown>
     22a: 2030         	<unknown>
     22c: 2e00         	<unknown>
     22e: 304c         	<unknown>
     230: 0020         	<unknown>
     232: 4c2e         	<unknown>
     234: 2030         	<unknown>
     236: 2e00         	<unknown>
     238: 304c         	<unknown>
     23a: 0020         	<unknown>
     23c: 4c2e         	<unknown>
     23e: 2030         	<unknown>
     240: 2e00         	<unknown>
     242: 304c         	<unknown>
     244: 0020         	<unknown>
     246: 4c2e         	<unknown>
     248: 2030         	<unknown>
     24a: 2e00         	<unknown>
     24c: 304c         	<unknown>
     24e: 0020         	<unknown>
     250: 4c2e         	<unknown>
     252: 2030         	<unknown>
     254: 2e00         	<unknown>
     256: 304c         	<unknown>
     258: 0020         	<unknown>
     25a: 4c2e         	<unknown>
     25c: 2030         	<unknown>
     25e: 2400         	<unknown>
     260: 0078         	<unknown>
     262: 4c2e         	<unknown>
     264: 2030         	<unknown>
     266: 2e00         	<unknown>
     268: 304c         	<unknown>
     26a: 0020         	<unknown>
     26c: 6424         	<unknown>
     26e: 2e00         	<unknown>
     270: 304c         	<unknown>
     272: 0020         	<unknown>
     274: 6424         	<unknown>
     276: 2e00         	<unknown>
     278: 6c4c         	<unknown>
     27a: 6e69         	<unknown>
     27c: 5f65         	<unknown>
     27e: 6174         	<unknown>
     280: 6c62         	<unknown>
     282: 5f65         	<unknown>
     284: 72617473     	csrrci	s0, mhpmevent6h, 0x2
     288: 3074         	<unknown>
     28a: 2e00         	<unknown>
     28c: 304c         	<unknown>
     28e: 0020         	<unknown>
     290: 6424         	<unknown>
     292: 2400         	<unknown>
     294: 0064         	<unknown>
     296: 6424         	<unknown>
     298: 2400         	<unknown>
     29a: 0064         	<unknown>
     29c: 6424         	<unknown>
     29e: 2e00         	<unknown>
     2a0: 304c         	<unknown>
     2a2: 0020         	<unknown>
     2a4: 6424         	<unknown>
     2a6: 2400         	<unknown>
     2a8: 0064         	<unknown>
     2aa: 6968         	<unknown>
     2ac: 7070         	<unknown>
     2ae: 6e656d6f     	jal	s10, 0x56994 <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0x56834>
     2b2: 7365         	<unknown>
     2b4: 635f 726f 2e65       	<unknown>
     2ba: 3766         	<unknown>
     2bc: 35346163     	bltu	s0, s3, 0x5fe <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0x49e>
     2c0: 30396537     	lui	a0, 0x30396
     2c4: 3561         	<unknown>
     2c6: 39643663     	<unknown>
     2ca: 632d         	<unknown>
     2cc: 302e7567     	<unknown>
     2d0: 2e00         	<unknown>
     2d2: 304c         	<unknown>
     2d4: 0020         	<unknown>
     2d6: 4c2e         	<unknown>
     2d8: 2030         	<unknown>
     2da: 2400         	<unknown>
     2dc: 0078         	<unknown>
     2de: 4c2e         	<unknown>
     2e0: 2030         	<unknown>
     2e2: 2e00         	<unknown>
     2e4: 304c         	<unknown>
     2e6: 0020         	<unknown>
     2e8: 4c2e         	<unknown>
     2ea: 2030         	<unknown>
     2ec: 2e00         	<unknown>
     2ee: 304c         	<unknown>
     2f0: 0020         	<unknown>
     2f2: 4c2e         	<unknown>
     2f4: 2030         	<unknown>
     2f6: 2e00         	<unknown>
     2f8: 304c         	<unknown>
     2fa: 0020         	<unknown>
     2fc: 4c2e         	<unknown>
     2fe: 2030         	<unknown>
     300: 2e00         	<unknown>
     302: 304c         	<unknown>
     304: 0020         	<unknown>
     306: 4c2e         	<unknown>
     308: 2030         	<unknown>
     30a: 2e00         	<unknown>
     30c: 304c         	<unknown>
     30e: 0020         	<unknown>
     310: 4c2e         	<unknown>
     312: 2030         	<unknown>
     314: 2e00         	<unknown>
     316: 304c         	<unknown>
     318: 0020         	<unknown>
     31a: 4c2e         	<unknown>
     31c: 2030         	<unknown>
     31e: 2e00         	<unknown>
     320: 304c         	<unknown>
     322: 0020         	<unknown>
     324: 4c2e         	<unknown>
     326: 2030         	<unknown>
     328: 2e00         	<unknown>
     32a: 304c         	<unknown>
     32c: 0020         	<unknown>
     32e: 6424         	<unknown>
     330: 2e00         	<unknown>
     332: 304c         	<unknown>
     334: 0020         	<unknown>
     336: 4c2e         	<unknown>
     338: 2030         	<unknown>
     33a: 2e00         	<unknown>
     33c: 304c         	<unknown>
     33e: 0020         	<unknown>
     340: 6424         	<unknown>
     342: 2e00         	<unknown>
     344: 304c         	<unknown>
     346: 0020         	<unknown>
     348: 6424         	<unknown>
     34a: 2e00         	<unknown>
     34c: 6c4c         	<unknown>
     34e: 6e69         	<unknown>
     350: 5f65         	<unknown>
     352: 6174         	<unknown>
     354: 6c62         	<unknown>
     356: 5f65         	<unknown>
     358: 72617473     	csrrci	s0, mhpmevent6h, 0x2
     35c: 3074         	<unknown>
     35e: 2e00         	<unknown>
     360: 304c         	<unknown>
     362: 0020         	<unknown>
     364: 4c2e         	<unknown>
     366: 2030         	<unknown>
     368: 2e00         	<unknown>
     36a: 304c         	<unknown>
     36c: 0020         	<unknown>
     36e: 4c2e         	<unknown>
     370: 2030         	<unknown>
     372: 2e00         	<unknown>
     374: 304c         	<unknown>
     376: 0020         	<unknown>
     378: 6424         	<unknown>
     37a: 2400         	<unknown>
     37c: 0064         	<unknown>
     37e: 6424         	<unknown>
     380: 2400         	<unknown>
     382: 0064         	<unknown>
     384: 6424         	<unknown>
     386: 2e00         	<unknown>
     388: 304c         	<unknown>
     38a: 0020         	<unknown>
     38c: 6424         	<unknown>
     38e: 2400         	<unknown>
     390: 0064         	<unknown>
     392: 6544         	<unknown>
     394: 6166         	<unknown>
     396: 6c75         	<unknown>
     398: 4874         	<unknown>
     39a: 6e61         	<unknown>
     39c: 6c64         	<unknown>
     39e: 7265         	<unknown>
     3a0: 4900         	<unknown>
     3a2: 746e         	<unknown>
     3a4: 7265         	<unknown>
     3a6: 7572         	<unknown>
     3a8: 7470         	<unknown>
     3aa: 0031         	<unknown>
     3ac: 6d5f 6d65 7865       	<unknown>
     3b2: 6b00         	<unknown>
     3b4: 7965         	<unknown>
     3b6: 726f7473     	csrrci	s0, mhpmevent6h, 0x1e
     3ba: 0065         	<unknown>
     3bc: 616d         	<unknown>
     3be: 6e69         	<unknown>
     3c0: 4400         	<unknown>
     3c2: 6665         	<unknown>
     3c4: 7561         	<unknown>
     3c6: 746c         	<unknown>
     3c8: 6e49         	<unknown>
     3ca: 6574         	<unknown>
     3cc: 7272         	<unknown>
     3ce: 7075         	<unknown>
     3d0: 4874         	<unknown>
     3d2: 6e61         	<unknown>
     3d4: 6c64         	<unknown>
     3d6: 7265         	<unknown>
     3d8: 5f00         	<unknown>
     3da: 75746573     	csrrsi	a0, mseccfgh, 0x8
     3de: 5f70         	<unknown>
     3e0: 6e69         	<unknown>
     3e2: 6574         	<unknown>
     3e4: 7272         	<unknown>
     3e6: 7075         	<unknown>
     3e8: 7374         	<unknown>
     3ea: 5f00         	<unknown>
     3ec: 4e5a         	<unknown>
     3ee: 3835         	<unknown>
     3f0: 245f 544c 6824       	<unknown>
     3f6: 7069         	<unknown>
     3f8: 6f70         	<unknown>
     3fa: 656d         	<unknown>
     3fc: 656e         	<unknown>
     3fe: 6f635f73     	csrrwi	t5, 0x6f6, 0x6
     402: 6572         	<unknown>
     404: 2e2e         	<unknown>
     406: 4155         	<unknown>
     408: 5452         	<unknown>
     40a: 7524         	<unknown>
     40c: 3032         	<unknown>
     40e: 6124         	<unknown>
     410: 32752473     	csrrs	s0, mhpmevent7, a0
     414: 2430         	<unknown>
     416: 65726f63     	bltu	tp, s7, 0xa74 <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0x914>
     41a: 2e2e         	<unknown>
     41c: 6d66         	<unknown>
     41e: 2e74         	<unknown>
     420: 572e         	<unknown>
     422: 6972         	<unknown>
     424: 6574         	<unknown>
     426: 4724         	<unknown>
     428: 2454         	<unknown>
     42a: 7739         	<unknown>
     42c: 6972         	<unknown>
     42e: 6574         	<unknown>
     430: 735f 7274 3731       	<unknown>
     436: 6368         	<unknown>
     438: 3338         	<unknown>
     43a: 3836         	<unknown>
     43c: 31646563     	bltu	s0, s6, 0x746 <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0x5e6>
     440: 3631         	<unknown>
     442: 6166         	<unknown>
     444: 3165         	<unknown>
     446: 4536         	<unknown>
     448: 5f00         	<unknown>
     44a: 72617473     	csrrci	s0, mhpmevent6h, 0x2
     44e: 0074         	<unknown>
     450: 5f5f 6c67 626f       	<unknown>
     456: 6c61         	<unknown>
     458: 705f 696f 746e       	<unknown>
     45e: 7265         	<unknown>
     460: 0024         	<unknown>
     462: 735f 6174 6b63       	<unknown>
     468: 735f 6174 7472       	<unknown>
     46e: 5f00         	<unknown>
     470: 74616473     	csrrsi	s0, 0x746, 0x2
     474: 0061         	<unknown>
     476: 655f 6164 6174       	<unknown>
     47c: 5f00         	<unknown>
     47e: 61646973     	csrrsi	s2, 0x616, 0x8
     482: 6174         	<unknown>
     484: 5f00         	<unknown>
     486: 73736273     	csrrsi	tp, mhpmevent23h, 0x6
     48a: 5f00         	<unknown>
     48c: 6265         	<unknown>
     48e: 49007373     	csrrci	t1, 0x490, 0x0
     492: 746e         	<unknown>
     494: 7265         	<unknown>
     496: 7572         	<unknown>
     498: 7470         	<unknown>
     49a: 0030         	<unknown>
     49c: 6e49         	<unknown>
     49e: 6574         	<unknown>
     4a0: 7272         	<unknown>
     4a2: 7075         	<unknown>
     4a4: 3274         	<unknown>
     4a6: 5f00         	<unknown>
     4a8: 78657473     	csrrci	s0, 0x786, 0xa
     4ac: 0074         	<unknown>
     4ae: 685f 6165 5f70       	<unknown>
     4b4: 657a6973     	csrrsi	s2, hviprio2h, 0x14
     4b8: 5f00         	<unknown>
     4ba: 61656873     	csrrsi	a6, 0x616, 0xa
     4be: 0070         	<unknown>
     4c0: 6d5f 7861 685f       	<unknown>
     4c6: 7261         	<unknown>
     4c8: 5f74         	<unknown>
     4ca: 6469         	<unknown>
     4cc: 5f00         	<unknown>
     4ce: 6168         	<unknown>
     4d0: 7472         	<unknown>
     4d2: 735f 6174 6b63       	<unknown>
     4d8: 735f 7a69 0065       	<unknown>
     4de: 5f5f 7573 696e       	<unknown>
     4e4: 696e         	<unknown>
     4e6: 0074         	<unknown>
     4e8: 5f5f 7565 696e       	<unknown>
     4ee: 696e         	<unknown>
     4f0: 0074         	<unknown>
     4f2: 655f 6568 7061       	<unknown>
     4f8: 5f00         	<unknown>
     4fa: 7365         	<unknown>
     4fc: 6174         	<unknown>
     4fe: 5f006b63     	bltu	zero, a6, 0xaf4 <<hippomenes_core::UART as core::fmt::Write>::write_str::hc8368ced116fae16+0x994>
     502: 61747373     	csrrci	t1, 0x617, 0x8
     506: 63           	<unknown>
     507: 6b           	<unknown>
     508: 00           	<unknown>
