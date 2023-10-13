`timescale 1ns / 1ps

module LevelCycler(
    input gameClk,
    output [3:0] Qwire
    );
    
wire [3:0] Dwire;
//4 bit register and the counter fsm
fourBitReg ssegRegitster(
	.clk(gameClk),
	.D({Dwire}),
	.Q({Qwire})
);

//setup for counter fsm below
wire notq0wire, notq1wire, notq2wire, notq3wire, D1connect1, D1connect2, D2connect1, D2connect2, D2connect3, 
D3connect1, D3connect2, D3connect3, D3connect4; 

not notq0 (notq0wire, Qwire[0]);
not notq1 (notq1wire, Qwire[1]);
not notq2 (notq2wire, Qwire[2]);
not notq3 (notq3wire, Qwire[3]);

//D[0]
not D0not (Dwire[0], Qwire[0]);

//D[1]
and D1and1 (D1connect1, notq1wire, Qwire[0]);
and D1and2 (D1connect2, notq0wire, Qwire[1]);
or D1or (Dwire[1], D1connect1, D1connect2);

//D[2]
and D2and1 (D2connect1, notq1wire, Qwire[2]);
and D2and2 (D2connect2, notq0wire, Qwire[2]);
and D2and3 (D2connect3, notq2wire, Qwire[1], Qwire[0]);
or D2or (Dwire[2], D2connect1, D2connect2, D2connect3);

//D[3]
and D3and1 (D3connect1, notq1wire, Qwire[3]);
and D3and2 (D3connect2, notq0wire, Qwire[3]);
and D3and3 (D3connect3, notq2wire, Qwire[3]);
and D3and4 (D3connect4, notq3wire, Qwire[2], Qwire[1], Qwire[0]);
or D3or (Dwire[3], D3connect1, D3connect2, D3connect3, D3connect4);

endmodule
