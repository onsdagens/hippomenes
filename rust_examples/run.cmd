if %1%=="" echo "empty"

cargo build --example %1 --release
elf2mem -f ./target/riscv32i-unknown-none-elf/release/examples/%1
updatemem --bit ../fpga/arty/arty.runs/impl_1/fpga_arty.bit --meminfo ../fpga/arty/arty.runs/impl_1/fpga_arty.mmi --data ./text.mem --proc hippo/imem/xpm_memory_spram_inst/xpm_memory_base_inst --data ./data_0.mem --proc hippo/dmem/block_0/xpm_memory_spram_inst/xpm_memory_base_inst --data ./data_1.mem --proc hippo/dmem/block_1/xpm_memory_spram_inst/xpm_memory_base_inst --data ./data_2.mem --proc hippo/dmem/block_2/xpm_memory_spram_inst/xpm_memory_base_inst --data ./data_3.mem --proc hippo/dmem/block_3/xpm_memory_spram_inst/xpm_memory_base_inst -out ../fpga/arty/arty.runs/impl_1/fpga_arty.bit -force
echo "DONE"
