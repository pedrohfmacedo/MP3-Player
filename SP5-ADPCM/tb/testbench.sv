module testbench_ADPCMD;
  
    // Specifying time units for the simulation
    timeunit 1ns;
    timeprecision 1ps;
  
    // DUT parameters
    localparam int WIDTH = 16; 
    localparam int DWIDTH = 8;
  	logic        clk;
    logic        nrst;
    logic        sop;       // Start of packet
    logic        eop;       // End of packet
    logic [ 3:0] coded;   // Compressed (encoded) input data
    logic [15:0] decoded; // Decompressed (decoded) output data
  
  ADPCMD #(.WIDTH(WIDTH),
          .DWIDTH(DWIDTH)
         ) DUT (
    	  .clk(clk),
  		  .nrst(nrst),
    	  .sop(sop),      
    	  .eop(eop),      
  		  .coded(coded),  
          .decoded(decoded) 
);
  
   // Clock Generator
   initial begin
     repeat(100)begin #1 clk = ~clk;end
   end
  
  // Tests
	initial begin
    	clk = 0; 
      $display ("duvida sobre o arquivo.wav");
    	#500 $finish;
	end
  
	initial begin
    $display("*------------S T A R T------------*");
      $monitor("Time =%3d, clk=%b , nrst =%b, sop=%b, eop=%b, input=%b out=%b", $time , clk, nrst, sop, eop, coded, decoded);
      
    //Dump
    $dumpfile("dump.vcd");
    $dumpvars(1, testbench_ADPCMD);
  end 
  
  
endmodule
