// to connect the FPGA pins to which the external oscilator is connected to CLK100MHZ net:
set_property PACKAGE_PIN W5 [get_ports CLK100MHZ]							
	set_property IOSTANDARD LVCMOS33 [get_ports CLK100MHZ]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports CLK100MHZ]
 
// to connect the FPGA pins to which the 7th LED is connected to CLK1HZ net:
  set_property PACKAGE_PIN V14 [get_ports {CLK1HZ}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {CLK1HZ}]

// to see what is connected where - open the schematic file of basys 3 in readme
