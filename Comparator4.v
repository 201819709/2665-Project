module Comparator4 (

	input [3:0] A,
	input [3:0] B,
	output Equal

);

	wire [3:0] EqualBits;

	xnor Xnor0 (EqualBits[0], A[0], B[0]);
	xnor Xnor1 (EqualBits[1], A[1], B[1]);
	xnor Xnor2 (EqualBits[2], A[2], B[2]);
	xnor Xnor3 (EqualBits[3], A[3], B[3]);

	and FinalAnd (Equal, EqualBits[0], EqualBits[1], EqualBits[2], EqualBits[3]);

endmodule
