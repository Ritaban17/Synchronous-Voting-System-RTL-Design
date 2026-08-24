# SVM System RTL Design

## Overview
This repository contains the Verilog RTL implementation and testbench for the `svm` module, a digital logic circuit designed to route, decode, count, and sum input signals. The project demonstrates structural Verilog design methodologies, integrating various standard digital components.

## Architecture
The system is built from several sub-modules:
- **`svm.v`**: The top-level module that instantiates and connects all sub-components.
- **`mux4x1.v`**: A 4-to-1 multiplexer that selects one of the four data inputs (`D0`-`D3`) based on a 2-bit `sel` signal.
- **`decoder2x4.v`**: A 2-to-4 line decoder that takes the `sel` signal and enables one of four output lines.
- **`register.v`**: A 1-bit register (D flip-flop) with a synchronous reset, used to latch the decoder outputs.
- **`upcounter.v`**: A 4-bit up-counter with an enable signal. Four of these are used to maintain independent counts (`C0`-`C3`).
- **`add.v`**: A combinatorial adder that calculates the 5-bit `Total` sum of the four 4-bit counter values.

## Simulation
The project includes a comprehensive testbench (`svm_tb.v`) to verify the functionality of the design. Simulation can be performed using Verilator.

### Running Simulation
Execute the following commands to compile and run the simulation using Verilator:

```bash
verilator --binary -j 0 --Wall mux4x1.v decoder2x4.v register.v upcounter.v add.v svm.v svm_tb.v -top svm_tb --timing --CFLAGS "-std=c++20" --trace

cd obj_dir

make -f Vsvm_tb.mk Vsvm_tb

./Vsvm_tb
```
To view the waveform, use GTKWave:
```bash
gtkwave svm.vcd
```

## Synthesis
The design has been synthesized using Yosys targeting the `gf180mcuD` Process Design Kit (PDK).

### Synthesis Script
The following script synthesizes the design and maps it to the standard cell library:
```tcl
read_verilog svm.v mux4x1.v decoder2x4.v add.v register.v upcounter.v

hierarchy -check -top svm

proc; opt; fsm; opt; memory; opt

techmap; opt

dfflibmap -liberty /home/vboxuser/OpenLaneUser/designs/reproducibles/2065/issue_reproducible/pdk/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu9t5v0/liberty/gf180mcu_fd_sc_mcu9t5v0__ss_125C_4v50.lib

abc -liberty /home/vboxuser/OpenLaneUser/designs/reproducibles/2065/issue_reproducible/pdk/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu9t5v0/liberty/gf180mcu_fd_sc_mcu9t5v0__ss_125C_4v50.lib 

clean

show svm

write_verilog svm_synth.v
```

## Gate-Level Output
The synthesis process generates a gate-level netlist. You can refer to the included image `gatelevel.png` which shows the Yosys and ABC synthesis console output and standard cell mapping statistics.

## Author
Ritaban Pal
