`timescale 1ns/1ns

module IncrementAdder2_tb;

	reg [1:0] A;
	wire [1:0] Sum;

	IncrementAdder2 DUT (
		.A(A),
		.Sum(Sum)
	);

	initial begin
		A = 2'b00; #20;
		A = 2'b01; #20;
		A = 2'b10; #20;
		A = 2'b11; #20;
		$stop;
	end

endmodule
