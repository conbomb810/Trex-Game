module mux #(parameter NUM_INPUTS = 2, parameter NUM_OUTPUTS = 1) (

	input [(NUM_INPUTS-1):0] data_in,
	input [$clog2(NUM_INPUTS)-1:0] select_in,
	output data_out
);

reg [NUM_INPUTS:0] D;

assign data_out = data_in[select_in];

endmodule