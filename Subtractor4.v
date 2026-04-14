module Subtractor4 (

	input [3:0] A,
	input [3:0] B,
	output [3:0] Diff

);

	wire [3:0] BInvert;
	wire [3:0] Carry;

	not BNot0 (BInvert[0], B[0]);
	not BNot1 (BInvert[1], B[1]);
	not BNot2 (BInvert[2], B[2]);
	not BNot3 (BInvert[3], B[3]);

	FullAdder Bit0 (
		.A(A[0]),
		.B(BInvert[0]),
		.Cin(1'b1),
		.Sum(Diff[0]),
		.Cout(Carry[0])
	);

	FullAdder Bit1 (
		.A(A[1]),
		.B(BInvert[1]),
		.Cin(Carry[0]),
		.Sum(Diff[1]),
		.Cout(Carry[1])
	);

	FullAdder Bit2 (
		.A(A[2]),
		.B(BInvert[2]),
		.Cin(Carry[1]),
		.Sum(Diff[2]),
		.Cout(Carry[2])
	);

	FullAdder Bit3 (
		.A(A[3]),
		.B(BInvert[3]),
		.Cin(Carry[2]),
		.Sum(Diff[3]),
		.Cout(Carry[3])
	);

endmodule
