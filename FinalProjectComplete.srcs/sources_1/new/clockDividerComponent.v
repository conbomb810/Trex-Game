`timescale 1ns / 1ps

module clockDividerComponent(
    input clk,
    output Qout
    );
    
wire notToD;

//D flip flop set up for use in a clock divider
not notClock (notToD, Qout);
dff clkDivComp (
    .data_out(Qout),
    .in_D(notToD),
    .in_CLK(clk)
);

endmodule
