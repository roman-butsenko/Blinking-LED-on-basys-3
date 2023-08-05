`timescale 1ns / 1ps

module clk_sim();

reg CLK100MHZ;

// instantiating the module from circut_behavior and connecting
// my CLK100MHZ simulated signal to module's CLK100MHZ input

sync_gen dut(
    .CLK100MHZ (CLK100MHZ)
    );

initial begin
    
    CLK100MHZ = 1'b1;
    forever
    #5 CLK100MHZ = ~CLK100MHZ;
end

endmodule
