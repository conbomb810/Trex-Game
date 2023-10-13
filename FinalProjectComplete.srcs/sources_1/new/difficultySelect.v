`timescale 1ns / 1ps

module difficultySelect(
    input clk,
    input diffSelect,
    output newClk
    );
    
wire hardWire, extraComp, notClkWire, hardAndWire, easyAndWire;

//Hard Difficulty
clockDivider hardDifficulty(
    .clk(clk),
    .newclk(hardWire)
    );

//Easy Difficulty
not notClk (notClkWire ,clk);
clockDivider easyDifficulty(
    .clk(notClkWire),
    .newclk(extraComp)
    );
clockDividerComponent clkDff1(
    .clk(extraComp),
    .Qout(easyWire)
    );


//Difficulty Selection
mux#(2,1) difficultySelection(
    .data_out(newClk),
    .select_in(diffSelect),
    .data_in({hardWire, easyWire})
);

endmodule
