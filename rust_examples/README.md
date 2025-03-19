# Hippomenes Rust Examples

This crate contains simple code examples for Hippomenes.

## Disclaimer

Some of the steps described in the `Tooling` and `Compiling` sections assume a Vivado-based workflow.
Most of the steps can be applied to any target and workflow, however the `elf2mem` utility and associated scripts (runner, ``../fpga/program_arty.sh``, ``../fpga/program_arty.cmd``) are intended to be used with Vivado.
If you are aware of an open-source alternative to `updatemem`, let us know!

## Tooling

This crate requires the Rust compiler for compiling, and the ``elf2mem`` utility for generating the binary dump file that SystemVerilog uses to populate the ROM and RAM components.

To set up the Rust toolchain, consult [Install Rust](https://www.rust-lang.org/tools/install).

On Linux, this amounts to running:

```shell
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Hippomenes implements the ``riscv32i`` instruction set, so to compile for Hippomenes, we must set-up the toolchain for that specific target. This can be done by

```shell
rustup target add riscv32i-unknown-none-elf
```

### Simulation specific

With the Rust toolchain set up, ``elf2mem`` can be installed by cloning the ``elf2mem`` repository, and installing the tool via ``cargo``:

```shell
git clone git@github.com:onsdagens/elf2mem.git
```

```shell
cargo install --path ./elf2mem
```

By default, we use Verilator to simulate Hippomenes, for instructions, refer to the [Verilator page](https://verilator.org/guide/latest/install.html)

### FPGA specific

With the Rust toolchain set up, we use ``hippo-progammer`` to program the device. ``hippo-programmer`` can be installed by cloning the ``hippo-host`` repository, and installing the tool via ``cargo``:


```shell
git clone git@github.com:onsdagens/hippo-host.git
```

```shell
cargo install --path ./hippo-tools/hippo-programmer
```

The final prerequisite for using the default FPGA workflow is Vivado. Make sure to also add the Vivado bin path (typically ``/home/<USER>/.local/bin/Xilinx/Vivado/<VERSION>/bin``) to your `PATH` variable, we use the Vivado `updatemem` CLI to replace the Block RAM on the fly.

## Compiling

To compile one of the examples use:

```shell
cargo build --example <EXAMPLE> --release
```

To dump the generated binary as a SystemVerilog ``.mem`` file use:

```shell
elf2mem -f ./target/riscv32i-unknown-none-elf/release/examples/<EXAMPLE> -t binary.mem 
```

## Running the examples

### Simulation

This repo comes with convenience scripts in ``build.rs``. To simulate Hippomenes running and example using Verilator, run:
```shell
cargo run --example <EXAMPLE> --release
```
### FPGA

Assuming you have synthesized and flashed Hippomenes to a Digilent Arty A7 board, and it is connected, you can program Hippomenes by running
```shell
cargo run --example <EXAMPLE> --release --features=fpga
```

## The examples

The examples are generally split into three categories: very simple pure assembly sanity checks, more advanced Rust examples, and fully-fledged RTIC applications.
The source code of each example contains a simple explanation along with expected behavior.
Because the Rust-based examples take advantage of the ``hippomenes-rt`` runtime crate, there is quite a lot of setup before ``main()`` is hit.
It is therefore recommended to first ensure the assembly examples are working as intended before moving on to trying the Rust examples when working on changes to Hippomenes.

### RTIC disclaimer

Currently, the Hippomenes fork of the RTIC framework is an early WiP, ONLY supporting hardware tasks WITH shared resources.


