`include "geradorfrequencia.sv"
`include "lut_sin.sv"
`include "lut_rectangular.sv"
`include "lut_sawtooth.sv"

module wave_gen #(
  int WIDTH = 16, 
  int WAVE_WIDTH = 16, 
  int CNT_WIDTH = 16
)(
  output logic [WAVE_WIDTH-1:0] out,
  input logic clk,
  input logic rst,
  input logic [WIDTH-1:0] freq_in,
  input logic wave_sel,
  input logic [CNT_WIDTH-1:0] duty_cyc
);
 
  localparam int OUT_WIDTH = 16;
  localparam int LUT_SIZE = 32;
  localparam int SEL_WIDTH = $clog2(LUT_SIZE);

  localparam logic [1:0] SINE_WAVE = 2'b00;
  localparam logic [1:0] RECTANGULAR_WAVE = 2'b01;
  localparam logic [1:0] SAWTOOTH_WAVE = 2'b10;
  
  logic signed [WAVE_WIDTH-1:0] wave_outsen;
  logic signed [WAVE_WIDTH-1:0] wave_rectangular;
  logic signed [WAVE_WIDTH-1:0] wave_sawtooth;
  
  logic [CNT_WIDTH-1:0] counter;
  
  // Frequency generator
  freq_gen #(.WIDTH(WIDTH)
               ) clk_gen(
    			.clk(clk),
    			.nrst(rst),
    			.freq_sel(freq_in),
    			.clk_out(clk_o)
);
 //Cordic and LUTs instantiations
  
  sine_lut #(.OUT_WIDTH(OUT_WIDTH),
             .LUT_SIZE(LUT_SIZE),
             .SEL_WIDTH(SEL_WIDTH)
            ) dut_sen(
    			.clk(clk),
    			.rst(rst),
    			.index(counter),
    			.sine(wave_outsen)
  );
  
  lut_rectangular #(.OUT_WIDTH(OUT_WIDTH),
             		.LUT_SIZE(LUT_SIZE),
             		.SEL_WIDTH(SEL_WIDTH)
              ) dut_rec(
    			.clk(clk),
    			.rst(rst),
    			.index(counter),
    			.duty_cycle(dut_cyc),
    			.rectangular(wave_rectangular)
  );
  
   lut_sawtooth #(.OUT_WIDTH(OUT_WIDTH),
             	  .LUT_SIZE(LUT_SIZE),
             	  .SEL_WIDTH(SEL_WIDTH)
              ) dut_saw(
    			.clk(clk),
    			.rst(rst),
    			.index(counter),
     			.sawtooth(wave_sawtooth)
  );
  
  // The counter 
  always @(clk_o)begin
    if(~rst)begin
      counter <= 0;
    end else begin 
      counter <= counter + 1;
    end
  end
  
  // Drive output
  always_comb begin
    case(wave_sel)
      SINE_WAVE: out = wave_outsen;
      RECTANGULAR_WAVE: out = wave_rectangular;
      SAWTOOTH_WAVE: out = wave_sawtooth;
      default: out = 0;
    endcase
  end
  
  
  endmodule
