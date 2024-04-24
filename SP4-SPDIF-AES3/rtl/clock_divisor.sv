module clock_divider#(parameter WIDTH = 16)(
			input logic 	clk2,
  			input logic    nrst,
			output logic 	clk_o
);
  logic aux;
  always_ff @(posedge clk_o or negedge nrst) begin

    if(~nrst) begin
      aux <= 0;
    end
    else begin
      aux = ~ aux;
    end
end
  assign out = aux;
  
endmodule