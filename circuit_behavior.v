`timescale 1ns / 1ps

module sync_gen(
    input CLK100MHZ,
    output CLK1HZ
    );
    
    reg [25:0] counter_reg = 0;
    reg clk_out_reg = 0;
    
    // This circuit counts to 50 million incrementing the number by one 100 million times a second
    // This will lead to clk_out_reg changing its state once every 0.5 seconds (1 second for a full 0 to 1 to 0 cycle)
    
    always @(posedge CLK100MHZ) begin
        if(counter_reg == 49_999_999) begin     // during the simulation I've changed this to 49_999 and set the simulation time to 2ms
                                               // so that results are visible and The computer doesn't have to simulate 12 trillion ps
            counter_reg <= 0;
            clk_out_reg <= ~clk_out_reg;
        end
        else
            counter_reg <= counter_reg + 1;
    end
    
    assign CLK1HZ = clk_out_reg;
    
endmodule    
