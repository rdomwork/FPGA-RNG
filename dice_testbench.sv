module dice_testbench();
  logic        clk, reset, number_catch;
  logic		   [3:0] data;
  logic			[6:0] segments;
  
  // instantiate device under test
  dice dut(clk, reset, number_catch, segments);

  // generate clock
  always 
    begin
      clk = 1'b1; #5; clk = 1'b0; #5;
    end

  // pulses number_catch with the clock
  always
	begin
	  number_catch = 1'b1; #5; number_catch = 1'b0; #5;
	end
	
	
  initial	
	begin
  //increments RNG
  reset = 1'b1; #0;
  reset = 1'b0; #5;
	end
endmodule
