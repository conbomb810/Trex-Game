`timescale 1ns / 1ps

module jumpDelay(
    input gameClk,
    input jumpButton,
    output jumpDelayed4,
    output jumpDelayed2
    );

//Button Pressed jump delay preventing holding of the button to infinitely jump
wire jumpDelayed, jumpButtonNot, jumpDelayed3;
not notJumpButton(jumpButtonNot, jumpButton);
and jumpDelayedAnd(jumpDelayed4, jumpDelayed, jumpDelayed3);
dff jumpPressDelay(
	.in_D(jumpButton), 
	.in_CLK(gameClk),
	.data_out(jumpDelayed)
);
dff jumpPressDelayNot(
	.in_D(jumpButtonNot), 
	.in_CLK(gameClk),
	.data_out(jumpDelayed2)
);
dff jumpPressDelayNot2(
	.in_D(jumpDelayed2), 
	.in_CLK(gameClk),
	.data_out(jumpDelayed3)
);



endmodule
