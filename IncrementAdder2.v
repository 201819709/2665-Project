module IncrementAdder2 (

	input [1:0] A,
	output [1:0] Sum

);

	wire [1:0] Carry;

	FullAdder Bit0 (
		.A(A[0]),
		.B(1'b1),
		.Cin(1'b0),
		.Sum(Sum[0]),
		.Cout(Carry[0])
	);

	FullAdder Bit1 (
		.A(A[1]),
		.B(1'b0),
		.Cin(Carry[0]),
		.Sum(Sum[1]),
		.Cout(Carry[1])
	);

endmodule
