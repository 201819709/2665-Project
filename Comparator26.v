module Comparator26 (

	input [25:0] A,
	input [25:0] B,
	output Equal

);

	wire [25:0] EqualBits;

	xnor Xnor0 (EqualBits[0], A[0], B[0]);
	xnor Xnor1 (EqualBits[1], A[1], B[1]);
	xnor Xnor2 (EqualBits[2], A[2], B[2]);
	xnor Xnor3 (EqualBits[3], A[3], B[3]);
	xnor Xnor4 (EqualBits[4], A[4], B[4]);
	xnor Xnor5 (EqualBits[5], A[5], B[5]);
	xnor Xnor6 (EqualBits[6], A[6], B[6]);
	xnor Xnor7 (EqualBits[7], A[7], B[7]);
	xnor Xnor8 (EqualBits[8], A[8], B[8]);
	xnor Xnor9 (EqualBits[9], A[9], B[9]);
	xnor Xnor10 (EqualBits[10], A[10], B[10]);
	xnor Xnor11 (EqualBits[11], A[11], B[11]);
	xnor Xnor12 (EqualBits[12], A[12], B[12]);
	xnor Xnor13 (EqualBits[13], A[13], B[13]);
	xnor Xnor14 (EqualBits[14], A[14], B[14]);
	xnor Xnor15 (EqualBits[15], A[15], B[15]);
	xnor Xnor16 (EqualBits[16], A[16], B[16]);
	xnor Xnor17 (EqualBits[17], A[17], B[17]);
	xnor Xnor18 (EqualBits[18], A[18], B[18]);
	xnor Xnor19 (EqualBits[19], A[19], B[19]);
	xnor Xnor20 (EqualBits[20], A[20], B[20]);
	xnor Xnor21 (EqualBits[21], A[21], B[21]);
	xnor Xnor22 (EqualBits[22], A[22], B[22]);
	xnor Xnor23 (EqualBits[23], A[23], B[23]);
	xnor Xnor24 (EqualBits[24], A[24], B[24]);
	xnor Xnor25 (EqualBits[25], A[25], B[25]);

	And26 FinalAnd (
		.A(EqualBits),
		.Y(Equal)
	);

endmodule
