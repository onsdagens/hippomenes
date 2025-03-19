use std::io::Write;

fn main() {
    let mut file = std::fs::File::create("run.sh").unwrap();
    file.write_all(
        b"#!/bin/bash
        ",
    )
    .unwrap();
    #[cfg(not(feature = "fpga"))]
    file.write_all(
        b"elf2mem -f $1
cd ..
make verilate
make simv
make wave
        ",
    )
    .unwrap();

    #[cfg(feature = "fpga")]
    file.write_all(
        b"hippo-programmer --elf $1 --imem-start=0x0 --imem-size=4096 --dmem-start=0x50000000 --dmem-size=4096",
    )
    .unwrap();
}
