Blinking LED on Basys 3

This repository contains all the files needed to make an LED on the Basys 3 board blink.

Three files are required for this project:

1) Verilog code that describes the FPGA behavior.
2) A file that maps nets in the Verilog code to physical pins on the FPGA (constraints file).
3) Verilog code that describes the inputs for simulation (more details below).
In Vivado, these files are respectively referred to as Design source, constraints, and simulation source.

The project itself is not complicated and was undertaken to gain familiarity with the design flow in Vivado.

The simulation source file, also known as the "test bench," may not be necessary for such a simple project, but it was still worth creating and experimenting with. In more complicated projects, the test bench becomes essential. A controlling device is only useful if it can receive and output information externally. The test bench allows us to create simulated inputs to the FPGA and see if the design works as intended without the need to physically provide those input signals.

The Basys 3 board's FPGA does not have an internal oscillator. Instead, it relies on an externally provided 100 MHz meander signal. During simulation, the 100 MHz clock signal would not be visible because Vivado is unaware of the actual external connections to the FPGA.

The simulation source file allows us to supply a simulated FPGA with an input (100 MHz clock in this case) that will be physically supplied from components outside the FPGA itself (such as the external oscillator on the Basys 3 board).

Resources used for this project:

Basys 3 documentation:
https://digilent.com/reference/_media/reference/programmable-logic/basys-3/basys-3_sch.pdf
https://digilent.com/reference/_media/reference/programmable-logic/basys-3/basys3_rm.pdf

Basys 3 universal constraints file (copy it, comment out unused parts, and ensure the names after "get_port" match those in the design):
https://github.com/Digilent/Basys3/blob/master/Projects/XADC_Demo/src/constraints/Basys3_Master.xdc
Some useful guides:

A short summary of the entire project (not written by me): https://circuitfever.com/led-blinking-in-fpga-verilog
Sequence of programming an FPGA can be observed here: https://users.wpi.edu/~rjduck/Basys3%20Vivado%20Decoder%20Tutorial.pdf
Or here: https://digilent.com/reference/learn/programmable-logic/tutorials/basys-3-programming-guide/start
Or here: https://www.youtube.com/watch?v=G6T0v-qJ180 (this was my main source of "inspiration")

Some messages that I encountered in the console and their solutions:

Error 56354 - Vivado write_bitstream - ERROR: [Drc 23-20] Rule violation (NSTD-1) Unspecified I/O Standard - X out of Y logical ports use I/O standard (IOSTANDARD) value 'DEFAULT,' instead of a user-assigned specific value. Solution: Ensure that pin names in the constraints file and the design match correctly. For more details, see: https://support.xilinx.com/s/article/56354?language=en_US

(No particular message) Hardware manager cannot establish the connection between PC and the board. Solution: Change the USB cable (even expensive ones can suffer from not being able to provide a data signal). For screenshots and descriptions of how the PC should behave with the right cable, refer to: https://forum.digilent.com/topic/22715-basys-3-not-recognized-by-xilinx-vivado/
