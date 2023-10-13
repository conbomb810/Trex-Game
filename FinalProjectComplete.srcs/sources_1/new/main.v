`timescale 1ns / 1ps

module main(
input CLK,
input DiffSelect,
input jumpButton,
output A,
output B,
output C,
output D,
output E,
output F,
output G,
output [3:0] ANConstraint
);

wire [3:0] AN;
wire [3:0] jumpButtonBus;

//Clock Divider and Difficulty Selection
wire gameClk;
difficultySelect difficultySelectionModule(
    .clk(CLK),
    .diffSelect(DiffSelect),
    .newClk(gameClk)
    );
assign out = gameClk;

//Rock calculations
//new counter for rock creation
wire [3:0] levelCyclerOut;
LevelCycler levelCycler(
    .gameClk(gameClk),
    .Qwire({levelCyclerOut})
    );

//determines when a rock appears on AN0
levelObstacles segmentsCEG(
    .Qwire(levelCyclerOut),
    .rock(rockout)
    );

//determines when a rock appears on AN1
fourBitReg rockDelay1(
   .clk(gameClk),
   .D(rockout),
   .Q(rockdelay1out)
);

//determines when a rock appears on AN2
fourBitReg rockDelay2(
   .clk(gameClk),
   .D(rockdelay1out),
   .Q(rockDelay2out)
);


//seven segment multiplexing   
wire [3:0] ssegMuxWireOut;
wire [3:0] ssegCounterOut;

sseg_mux SegmentMultiplexer(
    .clk(CLK),
    .leftmost(jumpButtonBus),
    .left_center(rockDelay2out),
    .right_center(rockdelay1out),
    .rightmost(rockout),

    .data_out(ssegMuxWireOut),
    .anode({AN})
    );


//Driver
//Floor
assign D = 0;

//Rock
assign C = ssegMuxWireOut;
assign G = ssegMuxWireOut;
assign E = ssegMuxWireOut;

//Player
//convert to 4bit bus for sseg_mux
assign jumpButtonBus[0] = jumpDelayed;
assign jumpButtonBus[1] = jumpDelayed;
assign jumpButtonBus[2] = jumpDelayed;
assign jumpButtonBus[3] = jumpDelayed;
//Button Pressed jump delay preventing holding
jumpDelay JumpDelay(
    .gameClk(gameClk),
    .jumpButton(jumpButton),
    .jumpDelayed4(jumpDelayed),
    .jumpDelayed2(jumpDelayedQ)
    );

//Jumped Player
not an3not (an3wire, ssegMuxWireOut[3]);
assign A = an3wire;
assign B = an3wire;
assign F = an3wire;

//Player Collision Detection
Collision playerCollision(
    .rockDelay2out(rockDelay2out),
    .jumpDelayed(jumpDelayed),
    .AN({AN}),
    .gameClk(gameClk),
    .ANConstraint({ANConstraint})
    );

endmodule
