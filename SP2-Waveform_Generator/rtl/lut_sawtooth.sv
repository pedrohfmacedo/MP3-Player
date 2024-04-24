// SystemVerilog module to generate a rectangular wave using a Look-Up Table (LUT)
// Signals generated by Idea Artur

module lut_sawtooth #(
     int OUT_WIDTH = 16,
     int LUT_SIZE = 32,
     int SEL_WIDTH = $clog2(LUT_SIZE)
) (
    input  logic                        clk,
    input  logic                        rst,
  	input  logic        [SEL_WIDTH-1:0] index,
    output logic signed [OUT_WIDTH-1:0] sawtooth
);

always_ff @(posedge clk) begin
  if (~rst) begin
        sawtooth <= 0;
    end else begin
      case(index)
            0: sawtooth <= 16'sd0;
            1: sawtooth <= 16'sd2048;
            2: sawtooth <= 16'sd4096;
            3: sawtooth <= 16'sd6144;
            4: sawtooth <= 16'sd8192;
            5: sawtooth <= 16'sd10240;
            6: sawtooth <= 16'sd12288;
            7: sawtooth <= 16'sd14336;
            8: sawtooth <= 16'sd16384;
            9: sawtooth <= 16'sd18431;
            10: sawtooth <= 16'sd20479;
            11: sawtooth <= 16'sd22527;
            12: sawtooth <= 16'sd24575;
            13: sawtooth <= 16'sd26623;
            14: sawtooth <= 16'sd28671;
            15: sawtooth <= 16'sd30719;
            16: sawtooth <= 16'sd32767;
            17: sawtooth <= -16'sd30719;
            18: sawtooth <= -16'sd28671;
            19: sawtooth <= -16'sd26623;
            20: sawtooth <= -16'sd24575;
            21: sawtooth <= -16'sd22527;
            22: sawtooth <= -16'sd20479;
            23: sawtooth <= -16'sd18431;
            24: sawtooth <= -16'sd16384;
            25: sawtooth <= -16'sd14336;
            26: sawtooth <= -16'sd12288;
            27: sawtooth <= -16'sd10240;
            28: sawtooth <= -16'sd8192;
            29: sawtooth <= -16'sd6144;
            30: sawtooth <= -16'sd4096;
            31: sawtooth <= -16'sd2048;
        endcase
    end
end

endmodule