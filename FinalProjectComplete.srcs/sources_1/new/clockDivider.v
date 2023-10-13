`timescale 1ns / 1ps

module clockDivider(
    input clk,
    output newclk
    );
    
wire connect1, connect2, connect3, connect4, connect5, connect6, connect7, connect8, connect9, connect10, connect11, connect12,
connect13, connect14, connect15, connect16, connect17, connect18, connect19, connect20, connect21, connect22, connect23, connect24, connect25;
 
clockDividerComponent clkDff1(
    .clk(clk),
    .Qout(connect1)
    );
clockDividerComponent clkDff2(
    .clk(connect1),
    .Qout(connect2)
    );
clockDividerComponent clkDff3(
    .clk(connect2),
    .Qout(connect3)
    );
clockDividerComponent clkDff4(
    .clk(connect3),
    .Qout(connect4)
    );
clockDividerComponent clkDff5(
    .clk(connect4),
    .Qout(connect5)
    );
clockDividerComponent clkDff6(
    .clk(connect5),
    .Qout(connect6)
    );
clockDividerComponent clkDff7(
    .clk(connect6),
    .Qout(connect7)
    );
clockDividerComponent clkDff8(
    .clk(connect7),
    .Qout(connect8)
    );
clockDividerComponent clkDff9(
    .clk(connect8),
    .Qout(connect9)
    );
clockDividerComponent clkDff10(
    .clk(connect9),
    .Qout(connect10)
    );
clockDividerComponent clkDff11(
    .clk(connect10),
    .Qout(connect11)
    );
clockDividerComponent clkDff12(
    .clk(connect11),
    .Qout(connect12)
    );
clockDividerComponent clkDff13(
    .clk(connect12),
    .Qout(connect13)
    );
clockDividerComponent clkDff14(
    .clk(connect13),
    .Qout(connect14)
    );
clockDividerComponent clkDff15(
    .clk(connect14),
    .Qout(connect15)
    );
clockDividerComponent clkDff16(
    .clk(connect15),
    .Qout(connect16)
    );
clockDividerComponent clkDff17(
    .clk(connect16),
    .Qout(connect17)
    );
clockDividerComponent clkDff18(
    .clk(connect17),
    .Qout(connect18)
    );
clockDividerComponent clkDff19(
    .clk(connect18),
    .Qout(connect19)
    );
clockDividerComponent clkDff20(
    .clk(connect19),
    .Qout(connect20)
    );
clockDividerComponent clkDff21(
    .clk(connect20),
    .Qout(connect21)
    );
clockDividerComponent clkDff22(
    .clk(connect21),
    .Qout(connect22)
    );
clockDividerComponent clkDff23(
    .clk(connect22),
    .Qout(connect23)
    );
clockDividerComponent clkDff24(
    .clk(connect23),
    .Qout(connect24)
    );
clockDividerComponent clkDff25(
    .clk(connect24),
    .Qout(connect25)
    );
clockDividerComponent clkDff26(
    .clk(connect25),
    .Qout(newclk)
    );

endmodule