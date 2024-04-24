module bistream_separator_tb;
  
   // Specifying time units for the simulation
  timeunit 1ns;
  timeprecision 1ps;

  // DUT signals
  localparam int WIDTH = 32;
  localparam int DWIDTH = 8;
  logic [WIDTH-1:0] data_serial;
  logic [DWIDTH-1:0] bitstream;
  logic done;
  logic clk, nrst;
  
  //DUT
  bitstream_separator #(.WIDTH(WIDTH),
                        .DWIDTH(DWIDTH)
         ) DUT (.clk(clk),
                .nrst(nrst),
                .data_serial(data_serial),
                .bitstream(bitstream)
                //.done(done)
 );

  //Clock
  initial begin
  repeat(100)begin #5 clk = ~clk;end
  end
  
  //Initiate Test
 initial begin
        clk = 0;
   		nrst = 0;
     	#0.1 nrst = 1;
        #2 data_serial = 32'b10110100111010101101111011111011;
   		//data = 32'b10110100111010101101111011111011
		//3,206,022,171
 end
  //Dump
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(1, bistream_separator_tb);
      $monitor("TIME:%g, CLK= %g:, NRST:%d, DATA_IN:%b, DATA_OUT:%b.", $time, clk, nrst, data_serial, bitstream);
    end
  
endmodule
  
