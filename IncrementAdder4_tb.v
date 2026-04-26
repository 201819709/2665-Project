`timescale 1ns/1ns

module IncrementAdder4_tb;

	reg [3:0] A;
	wire [3:0] Sum;

	IncrementAdder4 DUT (
		.A(A),
		.Sum(Sum)
	);

	initial begin
		A = 4'b0000; #20;
		A = 4'b0001; #20;
		A = 4'b1001; #20;
		A = 4'b1111; #20;
		$stop;
	end

endmodule
