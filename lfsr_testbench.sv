module lfsr_testbench();
	logic			clk, reset, number_catch, load_shift, SER;
	logic			[3:0] seed, RNG;
	logic			[6:0] segments;
	
	lfsr dut(clk, reset, number_catch, load_shift, seed, segments, RNG);
	
	//generates the clock
	always
		begin
			clk = 1'b1; #5; clk = 1'b0; #5;
		end
	
	//generates caught number
	always
		begin
			number_catch = 1'b1; #5 number_catch = 1'b0; #5;
		end
		
	//tests the system
	initial
		begin
	seed = 4'b1010;
	reset = 1; load_shift = 0; #10;
	reset = 0; load_shift = 1; #10;
	load_shift = 0; #50;
	seed = 4'b0010; #10;
	reset = 1; load_shift = 0; #10;
	reset = 0;	load_shift = 1; #10;
	load_shift = 0; #50;
	end
	
	
endmodule