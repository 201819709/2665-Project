module FullAdder (

	input A,
	input B,
	input Cin,
	output Sum,
	output Cout

);

	wire AxorB;
	wire AndAB;
	wire AndACin;
	wire AndBCin;

	xor SumXor0 (AxorB, A, B);
	xor SumXor1 (Sum, AxorB, Cin);

	and CarryAnd0 (AndAB, A, B);
	and CarryAnd1 (AndACin, A, Cin);
	and CarryAnd2 (AndBCin, B, Cin);
	or CarryOr0 (Cout, AndAB, AndACin, AndBCin);

endmodule
