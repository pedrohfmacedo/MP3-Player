// Code your testbench here
// or browse Examples
module clk_divider_tb;
  
  
    // Specifying time units for the simulation
    timeunit 1ns;
    timeprecision 1ps;

    // DUT signals
  	logic out, clk, nrst;
  	localparam int WIDTH = 16;
  
  	//DUT
  SPDIF #(.WIDTH(WIDTH)
         ) DUT (.clk(clk),
                .nrst(nrst),
                .out(out)
 );
  
  initial begin
    repeat(100)
    begin #1 clk = ~clk;end
  end
  
 initial begin
        clk = 0;
   		nrst = 0;
     #1 nrst = 1;
 end
    initial begin
    $display("------------Initiate------------*");
    $monitor("Time =%3d",clk);
    $dumpfile("dump.vcd");
      $dumpvars(1, SPDIF_tb);
    end
  
endmodule