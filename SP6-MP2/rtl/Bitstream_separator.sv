/*module bitstream_separator #(
  parameter WIDTH = 32,
  parameter DWIDTH = 8)(
  input logic clk,          			// Entrada de clock
  input logic nrst,    					// Entrada serial de 32 bits
  input logic [WIDTH-1:0] data_serial,
  output logic  [DWIDTH-1:0] bitstream, // Saída serial de 8 bits
  output logic done          			// Sinal para indicar quando todos os bits foram mostrados
);

	logic [4:0] counter;  				// Contador de 5 bits para controlar o índice dos bits de entrada serial
	logic [31:0] serial_data_reg;  		// Registrador para armazenar a entrada serial

	// Processo para carregar a entrada serial no registrador
	always @(posedge clk) begin
      serial_data_reg <= {serial_data_reg[30:0], data_serial[counter]};	
	end

	// Processo para mostrar os bits de entrada serial
  always_ff @(posedge clk or negedge nrst) begin
    counter = 0;
    if(!nrst) begin
      counter <=0;
    end
    else begin
        if (counter < WIDTH) begin
        	bitstream <= serial_data_reg[counter: 8];  // Mostra os próximos 8 bits a cada pulso de clock
        	counter <= counter + 8;  					// Incrementa o contador para apontar para os próximos 8 bits
    	end 
        else begin
        	done <= 1;  								// Sinaliza que todos os bits foram mostrados
    	end
	end
  end

endmodule
*/

module bitstream_separator #(
  parameter WIDTH = 32,
  parameter DWIDTH = 8)(
  input logic clk,
  input logic nrst,
  input logic [WIDTH-1:0] data_serial,
  output logic [DWIDTH-1:0] bitstream);
  
  //Counter
  logic [DWIDTH:0] counter;
  
  always_ff @(posedge clk or negedge nrst) begin
    counter = 0;
    if(!nrst) begin
      counter <=0;
    end
    else begin
      counter <= counter + 1;
  end
  end
  
	always_comb begin
    logic [4:0] a, b;
    if (counter == 0) begin
      a = 0;
      b = 0;
    end
    else begin
      a = 7 * counter + counter;
      b = 7 * (counter - 1) + counter;
    end
      bitstream = {a , b};
  end
  
endmodule
  //  assign bitstream = [7*(counter+1) + counter: 7*(counter-1) + counter];
  


/*
module bitstream_separator #(
  parameter WIDTH = 32,
  parameter DWIDTH = 8)(
  input logic clk,
  input logic nrst,
  input logic [WIDTH-1:0] data_serial,
  output logic [DWIDTH-1:0] bitstream);
  
  //Counter
  logic [DWIDTH:0] counter;
  logic [4:0] a, b;
  
  always_ff @(posedge clk or negedge nrst) begin
    counter = 0;
    if(!nrst) begin
      counter <=0;
    end
    else begin
      a = 7*(counter+1) + counter;
      b = 7*(counter-1) + counter;
      counter <= counter + 1;
  end
  end
  
  assign bitstream = [a+:b-];
  
  //  assign bitstream = [7*(counter+1) + counter: 7*(counter-1) + counter];
  
endmodule

*/
//Decoder Huffman to input serial
