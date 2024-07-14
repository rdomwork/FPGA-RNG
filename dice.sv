module dice(input logic clk, reset,
			input logic number_catch,
			output logic [6:0] segments);

	logic [3:0] data, RNG;
	

	// synchronous reset
  always_ff @(posedge clk)
	begin
     if (reset) RNG <= 4'b0001;
	 
	 //resets q back to 1 
	 else if (RNG == 6) RNG <= 1;

	 //increases q
     else       RNG <= RNG + 1;
	end

	//sets RNG value to data when number_catch is active
	always_ff @ (posedge number_catch)
	begin
	data <= RNG;
	end
	
	//segments for display
	always_comb
		case(data)
		(4'b0001):	segments = 7'b111_1001;
		(4'b0010):	segments = 7'b010_0100;
		(4'b0011):	segments = 7'b011_0000;
		(4'b0100):	segments = 7'b001_1001;
		(4'b0101):	segments = 7'b001_0010;
		(4'b0110):	segments = 7'b000_0010;
		
		//sets any value not 1-6 to F
		default:	segments = 7'b000_1110;
		
		endcase
endmodule
