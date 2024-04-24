//  Single port ROM: 8 words x 32bit
module ROM(input  logic Adress[7:0],
           output logic [31:0] Data_out);
 
  always_comb begin
    case(Adress)
	 8'd0:Data_out = 32'b_001000_00000_00001_00000_00000_000011;
	 8'd1:Data_out = 32'b_001000_00000_00010_00000_00000_001001;
	 8'd2:Data_out = 32'b_000000_00001_00010_00010_00000_100000;
	 8'd3:Data_out = 32'b_000000_00001_00010_00011_00000_100100;
     8'd4:Data_out = 32'b_000000_00001_00010_00100_00000_100101;
	 8'd5:Data_out = 32'b_000000_00001_00010_00101_00000_100111;
	 8'd6:Data_out = 32'b_000000_00101_00100_00110_00000_101010;
	 default:Data_out = 32'b_000000_00000_00000_00000_00000_000000;
      endcase
  end
  
endmodule 
