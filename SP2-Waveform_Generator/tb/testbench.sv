
module waveform_tb;

    // Specifying time units for the simulation
    timeunit 1ns;
    timeprecision 1ps;

    // Import packages
   

    // DUT parameters
    localparam int WIDTH = 16; 
    localparam int WAVE_WIDTH = 16;
    localparam int CNT_WIDTH = 16;
  

    // DUT signals
  bit  clk;
  logic rst;
  logic [WIDTH-1:0] freq_sel;
  logic [WAVE_WIDTH-1:0]out; 
  logic wave_sel;
  logic [CNT_WIDTH-1:0] duty_cyc;
  
    // The DUT
  wave_gen #(.WIDTH(WIDTH),
             .WAVE_WIDTH(WAVE_WIDTH),
             .CNT_WIDTH(CNT_WIDTH)
            )dut (.out(out),
                 .clk(clk),
                 .rst(rst),
                 .freq_in(freq_sel),
                  .wave_sel(wave_sel),
                  .duty_cyc(duty_cyc)
                );
  
   // Clock Generator
  initial begin
  repeat(100)begin #5 clk = ~clk;end
  end
  
  // Tests
   initial begin
      	wave_sel = 3;
      	duty_cyc = 0.7 * (2**CNT_WIDTH-1);
        clk = 0;
        rst = 1;
      freq_sel = $urandom();
    #5    
         rst = 0;
      freq_sel = $urandom();
    #5
      	rst = 1;
        freq_sel = $urandom();
     #5 
      freq_sel = $urandom();
      #5
      freq_sel = $urandom();
      #5
      freq_sel = $urandom();
      
    end

  
  initial begin
    $display("*------------S T A R T------------*");
    $monitor("Time =%3d, clk=%b , freq_in=%d, rst =%b, out=%b", $time , clk, freq_sel, rst, out);
    $dumpfile("dump.vcd");
    $dumpvars(1, waveform_tb);
  end 
  

    
  

    
endmodule
