module SPDIF_tb;
  
  // Specifying time units for the simulation
  timeunit 1ns;
  timeprecision 1ps;

  // DUT signals
  localparam int WIDTH = 16;
  logic out, clk1, nrst, dataDMC, clk2, data;
  //logic [WIDTH-1:0] data;
  
  //DUT
  SPDIF #(.WIDTH(WIDTH)
         ) DUT (.clk1(clk1),
                .clk2(clk2),
                .nrst(nrst),
                .data(data),
                .dataDMC(dataDMC)
 );
  
  Clock_divider #(.WIDTH(WIDTH)
                 )DUT2 (.clk1(clk1),
                        .nrst(nrst),
                        .clk2(clk2)
 );
  
  //Clock
  initial begin
    repeat(15)
    begin #1 clk1 = ~clk1;end
  end
  
  //Initiate Test
 initial begin
        clk1 = 0;
   		nrst = 0;
   		data = 1;
     	#0.1 nrst = 1;
		#1 data = 1;
   		#1 data = 1;
   		#1 data = 1;
   		#1 data = 0;
   		#1 data = 1;
   		#1 data = 0;
        #1 data = 0;
        #1 data = 0;
   		#1 data = 0;
   		#1 data = 1;
   		//data = 11'b11110100001;
   		//data = 11'b11110100001;
		# 15 $finish;
 end
  //Dump
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(1, SPDIF_tb);
      $monitor("TIME:%g, CLK2F= %g:, CLK1F:%d, DATA_IN:%d, DATA_OUT:%d.", $time, clk2, clk1, data, dataDMC);
    end
  
endmodule