//`include "clock_divisor.sv"

module SPDIF#(parameter WIDTH = 16)(
  			input logic     clk1,
  			input logic     clk2,
			input logic 	nrst,
  			input logic		data,             //data parallelo
  			//input logic 	[WIDTH-1:0] data, //data serial
			output logic 	dataDMC
);
  
    //Internals Variables
  logic data_first;
  
  always_ff @(posedge clk2 or posedge clk1 or negedge nrst) begin
    if (!nrst) begin
        data_first = 0;
    end
    else begin 
        data_first = dataDMC;
    end
	end
  
 	//Logical Next_State
  always_comb begin
  case(data)
        1: begin
          if (clk1 == 1 && clk2 == 1) begin
                dataDMC <= data_first;
            end
          else if (clk1 == 1 && clk2 == 0) begin
                dataDMC <= ~data_first;
            end
        end
        0: begin
          if (clk1 == 1 && clk2 == 1) begin
                dataDMC <= ~data_first;
            end
          else if (clk1 == 1 && clk2 == 0) begin
                dataDMC <= ~data_first;
            end
        end
        default: begin
            dataDMC <= 0;
        end
    endcase
  end

 
endmodule

//Module dividir signal Clock
module Clock_divider#(parameter WIDTH = 16)(
			input logic 	clk1,
  			input logic    nrst,
			output logic 	clk2
);
  logic aux;
  always_ff @(posedge clk1 or negedge nrst) begin

    if(~nrst) begin
      aux <= 0;
    end
    else begin
      aux = ~ aux;
    end
end
  assign clk2 = aux;
  
endmodule