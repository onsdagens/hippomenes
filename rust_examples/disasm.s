warning: unknown and unstable feature specified for `-Ctarget-feature`: `zmmul`
  |
  = note: it is still passed through to the codegen backend, but use of this feature might be unsound and the behavior of this feature can change in the future
  = help: consider filing a feature request


asm_rodata:	file format elf32-littleriscv

Disassembly of section .text:

00000000 <init>:
       0: 50001117     	auipc	sp, 0x50001
       4: 00010113     	mv	sp, sp

00000008 <main>:
       8: 50000397     	auipc	t2, 0x50000
       c: 00438393     	addi	t2, t2, 0x4
      10: 0003a283     	lw	t0, 0x0(t2)
      14: 00029073     	csrw	0x0, t0
      18: 0012c293     	xori	t0, t0, 0x1
      1c: 0053a023     	sw	t0, 0x0(t2)

00000020 <.Lpcrel_hi2>:
      20: 50000297     	auipc	t0, 0x50000
      24: fe028293     	addi	t0, t0, -0x20

00000028 <loop>:
      28: 0002a303     	lw	t1, 0x0(t0)
      2c: 05131073     	csrw	0x51, t1
      30: 00128293     	addi	t0, t0, 0x1
      34: fe729ae3     	bne	t0, t2, 0x28 <loop>
      38: 004c5eb7     	lui	t4, 0x4c5
      3c: b40e8e93     	addi	t4, t4, -0x4c0

00000040 <loop2>:
      40: fffe8e93     	addi	t4, t4, -0x1
      44: fe0e9ee3     	bnez	t4, 0x40 <loop2>
      48: fc1ff06f     	j	0x8 <main>

0000004c <stop>:
      4c: 0000006f     	j	0x4c <stop>
