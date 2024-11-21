# Course project for ELEC 374 at Queen's University: Digital Systems Engineering.

The CPU design project uses Field Programmable Gate Array (FPGA) devices and associated CAD tools, as well as GPU computing through nVidia CUDA or OpenCL languages.

## This repository contains a collection of Verilog modules and testbenches, primarily focused on arithmetic and data processing components. Below is an overview of the files and their purpose:

## Files and Description
### Arithmetic Units
ALU.v: Arithmetic Logic Unit module.
BoothsAlgorithim.v: Booth's Multiplication Algorithm implementation.
FourBitAdder.v: 4-bit adder module.
SixteenBitAdder.v: 16-bit adder module.
NonRestoringDivision.v: Non-restoring division module.
carrylookaheadlogic.v: Carry lookahead logic for fast addition.
lookaheadadder.v: Lookahead adder implementation.
thirtyTwoBitAdder.v: 32-bit adder module.

### Data Path and Register Units
datapath.v: Data path implementation for connecting arithmetic and logic components.
register.v: Basic register module.
MDR.v: Memory Data Register (MDR) module.

### Multiplexers
ZMux.v: Multiplexer for handling control signals and data paths.

### Miscellaneous
bus.v: Implementation of a bus for connecting different components in the design.
boothmult.v: Booth multiplier implementation.

### Testbenches
and_tb.v: Testbench for verifying and gate functionality.


## Usage
Open the Verilog files in your preferred hardware design environment, such as ModelSim or Vivado.
Use the testbench files (*_tb.v) to simulate and verify the functionality of the modules.
