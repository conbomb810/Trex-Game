`timescale 1ns / 1ps

module fourBitReg(
	input clk,
	input [3:0] D,
	output [3:0] Q
);

//4 bit register
dff reg0 (
	.data_out(Q[0]),
	.in_D(D[0]),
	.in_CLK(clk)
);

dff reg1 (
	.data_out(Q[1]),
	.in_D(D[1]),
	.in_CLK(clk)
);

dff reg2 (
	.data_out(Q[2]),
	.in_D(D[2]),
	.in_CLK(clk)
);
dff reg3 (
	.data_out(Q[3]),
	.in_D(D[3]),
	.in_CLK(clk)
);

endmodule
