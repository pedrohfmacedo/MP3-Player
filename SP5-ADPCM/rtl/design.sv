// Code your design here
module ADPCMD # (parameter WIDTH= 16,
                 parameter DWIDTH= 8)(
  				 input logic clk,     		 //Clock Signal
  				 input logic nrst,     		 //Reset Low-Signal
  				 input logic sop,      		 //Arutr idea
  				 input logic eop,      		 //Artur idea
  				 input logic [3:0] coded,	 //Input encoder
  				 output logic [15:0] decoded //ADCPM code
);
  //Decoding Table of index changes
  logic signed [7:0] indextable [16] = '{
        -1, -1, -1, -1, 2, 4, 6, 8,
        -1, -1, -1, -1, 2, 4, 6, 8
    };
  
  //Quantizer step size lookup table
  logic signed [15:0] stepsizetable [89] = '{ 
            7,     8,     9,    10,    11,    12,    13,    14,    16,    17, 
           19,    21,    23,    25,    28,    31,    34,    37,    41,    45, 
           50,    55,    60,    66,    73,    80,    88,    97,   107,   118, 
          130,   143,   157,   173,   190,   209,   230,   253,   279,   307,
          337,   371,   408,   449,   494,   544,   598,   658,   724,   796,
          876,   963,  1060,  1166,  1282,  1411,  1552,  1707,  1878,  2066, 
         2272,  2499,  2749,  3024,  3327,  3660,  4026,  4428,  4871,  5358,
         5894,  6484,  7132,  7845,  8630,  9493, 10442, 11487, 12635, 13899, 
        15289, 16818, 18500, 20350, 22385, 24623, 27086, 29794, 32767 
    };

  //Internal Variables
  logic signed [WIDTH:0] predsample , predsample_n ; // Output ADCM
  logic signed [DWIDTH-1:0] index, index_n; 		 // Index
  logic signed [WIDTH-1:0] step, step_n;			 // StepSize
  logic signed [WIDTH:0] diffq; 					 // Dequantized difference
  logic [3:0] coded_q;
  logic decoding;   								 //Arutr idea
  logic decoding_l; 								 //Arutr idea
  
 // Buffer in the input data
  always_ff @(posedge clk) begin
    if(!nrst) begin
          coded_q <= '0;
      end
      else if (sop || decoding) begin
          coded_q <= coded;
      end
    end
  
  // Update decoding status
  always_ff @(posedge clk) begin
    if(!nrst) begin
            decoding   <= 1'b0;
            decoding_l <= 1'b0;
        end
        else begin
            if (sop)
                decoding <= 1'b1;
            else if (eop)
                decoding <= 1'b0;
            	decoding_l <= decoding;
        end
    end
  
 // Update registers of decoding process
  always_ff @(posedge clk) begin
    if(!nrst) begin
            predsample  <= '0;
            index <= '0;
            step <= stepsizetable[0];
        end
        else if (decoding || decoding_l) begin
            predsample  <= predsample_n;
            index <= index_n;
            step <= step_n;
        end
    end

 // Calculate next value of registers
  always_comb begin
      index_n = index + index_n[coded_q];
    if (index_n <  0) begin
      index_n = 0;
    end
    else if (index_n > 88) begin
      index_n = 88;
    end
        
        step_n       = stepsizetable[index_n];
        predsample_n  = predsample_n + diffq;
    if (predsample_n < -32768) begin
      predsample_n = -32768;
    end
    else if (predsample_n >  32767) begin 
      predsample_n =  32767;
    end
  end
  
 // Calculate diff
 // Inverse quantize the ADPCM code into a difference using the quantizer step size

    always_comb begin
        // diff = step >> 3;
        // if (coded_i_buf[2])
        //     diff += (step     );
        // if (coded_i_buf[1])
        //     diff += (step >> 1);
        // if (coded_i_buf[0])
        //     diff += (step >> 2);
        // if (coded_i_buf[3])
        //     diff = -diff;
      logic [19:0] diff;
      diff = 0;
      if (coded_q[2])
            diff += (step << 3);
      if (coded_q[1])
            diff += (step << 2);
      if (coded_q[0])
            diff += (step << 1);  
        // Account for signal
     
        //if(code & 8)
 		//	predsample -= diffq;
		//else
 		//	predsample += diffq;
      
      if (coded_q[3])
            diff = -diff;
       
      //index += IndexTable[code];    
      diff += step;
      if (coded_q[3])
            diff += {16'b0, diff[2], 3'b0};
        diff = diff >> 3;
    end
    
    // Return ( predsample );
  	assign decoded = predsample[WIDTH-1:0];

endmodule
  
  