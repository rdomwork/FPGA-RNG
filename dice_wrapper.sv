module dice_wrapper(input  logic CLOCK_50,
					input  logic [0:0] SW, KEY,
					output logic [6:0] HEX7);

  
  dice dw(CLOCK_50, SW, ~KEY[0], HEX7);

endmodule