`timescale 1ns / 1ps

module Collision(
    input rockDelay2out,
    input jumpDelayed,
    input [3:0] AN,
    input gameClk,
    output [3:0] ANConstraint
    );

//Extra clock delay to rockDelay2out
dff rockOutCollisionDelay (
	.data_out(rockCollisionWire),
	.in_D(rockDelay2out),
	.in_CLK(gameClk)
);

//Logic for determining when collision occurs
not rockNot (rockNotWire, rockCollisionWire);
not jumpDelayedNot (jumpDelayedNotWire, jumpDelayed);
and anodeToggle (anodeToggleWire, rockNotWire, jumpDelayedNotWire);
not anodeToggleNot (anodeToggleNotWire, anodeToggleWire);

//Muxes to swap between states of 'no collision' and 'collision'
mux#(2,1) AN0toggle(
    .data_out(ANConstraint[0]),
    .select_in(anodeToggleNotWire),
    .data_in({AN[0], 1'b1})
);
mux#(2,1) AN1toggle(
    .data_out(ANConstraint[1]),
    .select_in(anodeToggleNotWire),
    .data_in({AN[1], 1'b1})
);
mux#(2,1) AN2toggle(
    .data_out(ANConstraint[2]),
    .select_in(anodeToggleNotWire),
    .data_in({AN[2], 1'b1})
);
mux#(2,1) AN3toggle(
    .data_out(ANConstraint[3]),
    .select_in(anodeToggleNotWire),
    .data_in({AN[3], 1'b1})
);

endmodule
