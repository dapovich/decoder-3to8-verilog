`include "decoder3to8.v"
`timescale 1ns / 1ns

module decoder3to8_tb();

// Modeling clock signal
reg i_clk;
initial i_clk = 0;
always #5 i_clk = ~i_clk;

// Create 3-bit counter
reg [2:0] i_counter;
initial i_counter = 0;
always @(posedge i_clk)
begin
  i_counter = i_counter + 1;
end

// Modeling wires connected to exit of decoder
wire w_sel_a0, w_sel_a1, w_sel_a2, w_sel_a3, w_sel_a4, w_sel_a5, w_sel_a6, w_sel_a7;

// The Unit Under Test declaration
decoder3to8 uut(
    .i_addr(i_counter),
    .o_selector( {w_sel_a0, w_sel_a1, w_sel_a2, w_sel_a3, w_sel_a4, w_sel_a5, w_sel_a6, w_sel_a7} )
);

initial begin
    $dumpfile("out.vcd");
    $dumpvars(0, decoder3to8_tb);
    #200;
    $display("Test is over.");
    $finish;
end

endmodule
