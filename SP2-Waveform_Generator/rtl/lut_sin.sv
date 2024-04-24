// SystemVerilog module to generate a sine wave using a Look-Up Table (LUT)
// Signals generated by chatgpt

module sine_lut #(int OUT_WIDTH = 16,               // Width of the output data (default: 16 bits)
                  int LUT_SIZE = 32,                // Size of the Look-Up Table (default: 32 entries)
                  int SEL_WIDTH = $clog2(LUT_SIZE)  // Width of the Look-Up Table selector (calculated as log2 of LUT size)
)(   input  logic clk,
  	  input logic rst,
      input logic [SEL_WIDTH-1:0] index,
      output logic signed [OUT_WIDTH-1:0] sine);
  
	always_ff @(posedge clk) begin
      if (~rst) begin
   	     sine <= 0;                // If the reset signal is active, set the output to zero
  	  end else begin
    	    case (index)
            0: sine <= 16'sd0;    // Signal at minimum (bottom) // The sine wave starts at zero
            1: sine <= 16'sd6393;
            2: sine <= 16'sd12539;
            3: sine <= 16'sd18204;
            4: sine <= 16'sd23170;
            5: sine <= 16'sd27245;
            6: sine <= 16'sd30273;
            7: sine <= 16'sd32137;
            8: sine <= 16'sd32767; // Signal at maximum  // the sine = 1;
            9: sine <= 16'sd32137;
            10: sine <= 16'sd30273;
            11: sine <= 16'sd27245;
            12: sine <= 16'sd23170;
            13: sine <= 16'sd18204;
            14: sine <= 16'sd12539;
            15: sine <= 16'sd6393;
            16: sine <= 16'sd0;
            17: sine <= -16'sd6393;
            18: sine <= -16'sd12539;
            19: sine <= -16'sd18204;
            20: sine <= -16'sd23170;
            21: sine <= -16'sd27245;
            22: sine <= -16'sd30273;
            23: sine <= -16'sd32137;
            24: sine <= -16'sd32767;
            25: sine <= -16'sd32137;
            26: sine <= -16'sd30273;
            27: sine <= -16'sd27245;
            28: sine <= -16'sd23170;
            29: sine <= -16'sd18204;
            30: sine <= -16'sd12539;
            31: sine <= -16'sd6393; // Signal at minimum (bottom)
            default: sine <= 0;     // Default value if the selector is out of the known range
        endcase
    end
    end
  

endmodule