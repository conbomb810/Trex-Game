`timescale 1ns / 1ps

module levelObstacles(
    input [3:0] Qwire,
    output [3:0] rock
    );

wire obsconnect1, obsconnect2, obsconnect3, obsconnect4, obsconnect5;

not notq0 (notq0wire, Qwire[0]);
not notq1 (notq1wire, Qwire[1]);
not notq2 (notq2wire, Qwire[2]);
not notq3 (notq3wire, Qwire[3]);

//C, E, G Segments (C=E=G for AN[0-2])
and obsand1 (obsconnect1, notq1wire, notq2wire);
and obsand2 (obsconnect2, notq0wire, notq3wire);
and obsand3 (obsconnect3, notq1wire, Qwire[0]);
and obsand4 (obsconnect4, notq0wire, Qwire[2], Qwire[1]);
and obsand5 (obsconnect5, notq2wire, Qwire[3], Qwire[0]);
or obsor (levelMuxWire, obsconnect1, obsconnect2, obsconnect3, obsconnect4, obsconnect5);

//convert to 4bit bus for sseg_mux
assign rock[0] = levelMuxWire;
assign rock[1] = levelMuxWire;
assign rock[2] = levelMuxWire;
assign rock[3] = levelMuxWire;

endmodule
