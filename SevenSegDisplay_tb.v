`timescale 1ns/1ns

module SevenSegDisplay_tb;

	reg [3:0] Count;
	wire [6:0] SevenSegH;
	wire [6:0] SevenSegL;

	SevenSegDisplay DUT (
		.Count(Count),
		.SevenSegH(SevenSegH),
		.SevenSegL(SevenSegL)
	);

	initial begin
		Count = 4'b0000; #20;
		Count = 4'b0011; #20;
		Count = 4'b1000; #20;
		Count = 4'b1001; #20;
		Count = 4'b1010; #20;
		$stop;
	end

endmodule
