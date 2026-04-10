module IncrementAdder26 (

	input [25:0] A,
	output [25:0] Sum

);

	wire [25:0] Carry;

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

	FullAdder Bit4 (
		.A(A[4]),
		.B(1'b0),
		.Cin(Carry[3]),
		.Sum(Sum[4]),
		.Cout(Carry[4])
	);

	FullAdder Bit5 (
		.A(A[5]),
		.B(1'b0),
		.Cin(Carry[4]),
		.Sum(Sum[5]),
		.Cout(Carry[5])
	);

	FullAdder Bit6 (
		.A(A[6]),
		.B(1'b0),
		.Cin(Carry[5]),
		.Sum(Sum[6]),
		.Cout(Carry[6])
	);

	FullAdder Bit7 (
		.A(A[7]),
		.B(1'b0),
		.Cin(Carry[6]),
		.Sum(Sum[7]),
		.Cout(Carry[7])
	);

	FullAdder Bit8 (
		.A(A[8]),
		.B(1'b0),
		.Cin(Carry[7]),
		.Sum(Sum[8]),
		.Cout(Carry[8])
	);

	FullAdder Bit9 (
		.A(A[9]),
		.B(1'b0),
		.Cin(Carry[8]),
		.Sum(Sum[9]),
		.Cout(Carry[9])
	);

	FullAdder Bit10 (
		.A(A[10]),
		.B(1'b0),
		.Cin(Carry[9]),
		.Sum(Sum[10]),
		.Cout(Carry[10])
	);

	FullAdder Bit11 (
		.A(A[11]),
		.B(1'b0),
		.Cin(Carry[10]),
		.Sum(Sum[11]),
		.Cout(Carry[11])
	);

	FullAdder Bit12 (
		.A(A[12]),
		.B(1'b0),
		.Cin(Carry[11]),
		.Sum(Sum[12]),
		.Cout(Carry[12])
	);

	FullAdder Bit13 (
		.A(A[13]),
		.B(1'b0),
		.Cin(Carry[12]),
		.Sum(Sum[13]),
		.Cout(Carry[13])
	);

	FullAdder Bit14 (
		.A(A[14]),
		.B(1'b0),
		.Cin(Carry[13]),
		.Sum(Sum[14]),
		.Cout(Carry[14])
	);

	FullAdder Bit15 (
		.A(A[15]),
		.B(1'b0),
		.Cin(Carry[14]),
		.Sum(Sum[15]),
		.Cout(Carry[15])
	);

	FullAdder Bit16 (
		.A(A[16]),
		.B(1'b0),
		.Cin(Carry[15]),
		.Sum(Sum[16]),
		.Cout(Carry[16])
	);

	FullAdder Bit17 (
		.A(A[17]),
		.B(1'b0),
		.Cin(Carry[16]),
		.Sum(Sum[17]),
		.Cout(Carry[17])
	);

	FullAdder Bit18 (
		.A(A[18]),
		.B(1'b0),
		.Cin(Carry[17]),
		.Sum(Sum[18]),
		.Cout(Carry[18])
	);

	FullAdder Bit19 (
		.A(A[19]),
		.B(1'b0),
		.Cin(Carry[18]),
		.Sum(Sum[19]),
		.Cout(Carry[19])
	);

	FullAdder Bit20 (
		.A(A[20]),
		.B(1'b0),
		.Cin(Carry[19]),
		.Sum(Sum[20]),
		.Cout(Carry[20])
	);

	FullAdder Bit21 (
		.A(A[21]),
		.B(1'b0),
		.Cin(Carry[20]),
		.Sum(Sum[21]),
		.Cout(Carry[21])
	);

	FullAdder Bit22 (
		.A(A[22]),
		.B(1'b0),
		.Cin(Carry[21]),
		.Sum(Sum[22]),
		.Cout(Carry[22])
	);

	FullAdder Bit23 (
		.A(A[23]),
		.B(1'b0),
		.Cin(Carry[22]),
		.Sum(Sum[23]),
		.Cout(Carry[23])
	);

	FullAdder Bit24 (
		.A(A[24]),
		.B(1'b0),
		.Cin(Carry[23]),
		.Sum(Sum[24]),
		.Cout(Carry[24])
	);

	FullAdder Bit25 (
		.A(A[25]),
		.B(1'b0),
		.Cin(Carry[24]),
		.Sum(Sum[25]),
		.Cout(Carry[25])
	);

endmodule
