/*The I2S Transmitter module converts digital audio signals into a suitable format for transmission, enabling efficient communication and audio playback on connected devices." */

module i2s # (
  int WIDTH = 16
)(
  input logic clk, 	// Input clock for the audio interface
  input logic rst, 	// Reset input for the audio interface (active high)
  input logic [WIDTH-1:0] Tx, //Transmission data
  
  //I2S interface
   output logic ready, // Ready signal to indicate a new data transmission
   output logic SCLK,  // Serial Clock for the I2S
   output logic WS,    // Left/Right clock
   output logic SD     // Serial data for the I2S 
);
  
  //States
  typedef enum logic [1:0] {
  	S0,
 	S1,
    S2
  }State;
  
  State state, next_state;
  
  //Internal Variables
  logic ready_temp = 0;
  logic WS_temp    = 0;
  logic SD_temp    = 0;
  logic enable     = 0;
  logic [WIDTH-1:0] Tx_temp;
  
  localparam int BIT_WIDTH = $clog2(2*WIDTH);
  logic [BIT_WIDTH-1:0] bit_cnt; // Counter of bits transmitted
  
  //Next State
  always@(*) begin
  	case (state)
    S0: begin
      enable       = 1;
      next_state   = S1;
    end
    S1: begin
      bit_cnt      = 0;
      Tx_temp      = Tx;
      next_state   = S2;
    end
    S2:begin
      bit_cnt      = bit_cnt + 1;

      if (bit_cnt > (WIDTH - 1)) begin
        WS_temp    = 1;
      end
      else if (bit_cnt < (2*WIDTH-1)) begin
        ready_temp = 1;
        state      = S1;
      end
      else begin
        ready_temp = 1;
        Tx_temp    = Tx;
        next_state = S0;
      end
		SD_temp = (Tx_temp & (1 << bit_cnt)) ? 1'b1 : 1'b0; 
    end
    endcase
  end
  
  //Register Level
  always@(posedge clk or posedge rst)begin
    if (rst) begin
      state   <= S0;
      bit_cnt <= 0;
    end
    else begin
      bit_cnt <= bit_cnt+1;
      state   <= next_state;
    end
  end
  
 //OUT 
    assign ready = ready_temp;
    assign SCLK  = clk & enable;
    assign WS    = WS_temp;
 	assign SD    = SD_temp;
  
endmodule