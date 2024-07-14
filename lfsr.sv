module lfsr(input  logic clk, reset,
			input  logic number_catch, load_shift,
			input  logic [3:0] seed,
			output logic [6:0] segments,
			output logic [3:0] RNG);
			
	logic [3:0] data;
	
	//calls the modules
	shift_register ishift_reg(clk, reset, load_shift, seed, data);
	register ireg(number_catch, reset, data, RNG);
	sevenseg iseg(RNG, segments);
	
endmodule

module shift_register(input  logic clk, reset,
					  input  logic load_shift,
					  input  logic [3:0] seed,
					  output logic [3:0] RNG);
					 
					
	assign SER = RNG[0] ^ RNG[2];
	// synchronous reset
  always_ff @(posedge clk)
	begin
	 if			(reset) 		RNG <= 4'b0;
	 else if 	(load_shift)	RNG <= seed;
	 else						RNG <= {RNG[2:0], SER};
	end

endmodule

module register(input  logic number_catch, reset,
				input  logic [3:0] data,
				output logic [3:0] RNG);
				
	//takes the number when number_catch is active
	always_ff @ (posedge number_catch)
	begin
		//resets the value
		if			(reset)			RNG <= 4'b0;
		else						RNG  <= data; 
	end
	
endmodule
	
module sevenseg(input  logic [3:0] data,
				output logic [6:0] segments);
				
	//segments
	always_comb
		case(data)
		(4'b0001):	segments = 7'b111_1001;
		(4'b0010):	segments = 7'b010_0100;
		(4'b0011):	segments = 7'b011_0000;
		(4'b0100):	segments = 7'b001_1001;
		(4'b0101):	segments = 7'b001_0010;
		(4'b0110):	segments = 7'b000_0010;
		(4'b0111):	segments = 7'b111_1000;
		(4'b1000):	segments = 7'b000_0000;
		(4'b1001):	segments = 7'b001_1000;
		(4'b1010):	segments = 7'b000_1000;
		(4'b1011):	segments = 7'b000_0011;
		(4'b1100):	segments = 7'b010_0111;
		(4'b1101):	segments = 7'b010_0001;
		(4'b1110):	segments = 7'b000_0110;
		(4'b1111):	segments = 7'b000_1110;

		default:	segments = 7'b000_0000;
		
		endcase		

endmodule
				
		