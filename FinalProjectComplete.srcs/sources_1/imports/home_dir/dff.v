// -- Meghana Jain, Binghamton University
// -- Digital Logic Design / Sophomore Design

module dff(
	input in_D, in_CLK,
	output reg data_out
	);

	always @ (posedge in_CLK)
		data_out<=in_D;

endmodule