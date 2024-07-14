module lfsr_wrapper(input  logic CLOCK_50,
					input  logic [3:0] KEY, SW,
					output logic [6:0] HEX0);
		
	lfsr lw(CLOCK_50, ~KEY[3], ~KEY[0], ~KEY[2], SW[3:0], HEX0);

endmodule