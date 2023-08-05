# Blinking-LED-on-basys-3
Blinking LED on basys 3

This is a repository to which I put all the files that I needed to make an LED on Basys 3 LED blink.

Three files are required for that:
1) verilog code that descrbes an FPGA behaviour
2) File, which describes which nets in verilog files attach to which physical pins on an FPGA
3) Verilog code that describes the inputs for simulation (I'll get more in depth below)

These files in Vivado are called respectively: Design source, constraints and simulation source

The project itself is not complicated at all and was done just to get more familiar with the design flow in Vivado

The simulation source file, also referred to as "test bench" is not particulary required in such a simple project, but still was worth creating and messing around with, since it is unavoidable nessessaty in any of the more complicated project.
Any controlling device is useless if it cannot recive and output the information outside. What this file does is it allows us to create some inputs to an FPGA and see if the design works as intended wothout any need to provide that input signal physicaly.

An FPGA on basys 3 board doesn't have an internal oscilator. 100 MHz meander signal is provided externally. If I were to try and run the simulation, I wouldn't
see that signal, because Vivado is not aware what actually is connected to an FPGA. 

With simulation source we supply a simulated FPGA with an input (100 MHz clock in this case) that physicaly will be supplyed from components outside of an FPGA itself (external oscilator on basys 3 board).

Resources that were used:
Basys 3 documentaion:
https://digilent.com/reference/_media/reference/programmable-logic/basys-3/basys-3_sch.pdf
https://digilent.com/reference/_media/reference/programmable-logic/basys-3/basys3_rm.pdf

Basys 3 universal constrains file (copy it, comment not used, make sure the names after "get_port" match those in the design):
https://github.com/Digilent/Basys3/blob/master/Projects/XADC_Demo/src/constraints/Basys3_Master.xdc

Some more usefull guides:
Basucally a short summary of the entire project (not written by me): https://circuitfever.com/led-blinking-in-fpga-verilog

Sequence of progtamming an FPGA can be observed here: https://users.wpi.edu/~rjduck/Basys3%20Vivado%20Decoder%20Tutorial.pdf
Or here: https://digilent.com/reference/learn/programmable-logic/tutorials/basys-3-programming-guide/start
Or here: https://www.youtube.com/watch?v=G6T0v-qJ180 (this was my main source of "insparation")

Some messages that I had in the console and their solutions:

56354 - Vivado write_bitstream - ERROR: [Drc 23-20] Rule violation (NSTD-1) Unspecified I/O Standard - X out of Y logical ports use I/O standard (IOSTANDARD) value 'DEFAULT', instead of a user assigned specific value
https://support.xilinx.com/s/article/56354?language=en_US 
Solution: pin names in the constraints file and design weren't matching

(no particular messege) Hardware manager cannot establish the connection between PC and the board 
Solution: Change the USB cable (I had pretty decent one I though, but turns out even more expencive one can suffer from not being able to provide a data signal). 
There are some screenshots and describtions on how the PC should behave with the right cable
https://forum.digilent.com/topic/22715-basys-3-not-recognized-by-xilinx-vivado/
