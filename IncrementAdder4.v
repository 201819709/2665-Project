module IncrementAdder4 (

	input [3:0] A,
	output [3:0] Sum

);

	wire [3:0] Carry;

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

	FullAdder Bit2 (
		.A(A[2]),
		.B(1'b0),
		.Cin(Carry[1]),
		.Sum(Sum[2]),
		.Cout(Carry[2])
	);

	FullAdder Bit3 (
		.A(A[3]),
		.B(1'b0),
		.Cin(Carry[2]),
		.Sum(Sum[3]),
		.Cout(Carry[3])
	);

endmodule
