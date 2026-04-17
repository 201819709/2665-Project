module Mux2_6 (

	input [5:0] A0,
	input [5:0] A1,
	input Sel,
	output [5:0] Y

);

	Mux2_1 MuxBit0 (
		.A0(A0[0]),
		.A1(A1[0]),
		.Sel(Sel),
		.Y(Y[0])
	);

	Mux2_1 MuxBit1 (
		.A0(A0[1]),
		.A1(A1[1]),
		.Sel(Sel),
		.Y(Y[1])
	);

	Mux2_1 MuxBit2 (
		.A0(A0[2]),
		.A1(A1[2]),
		.Sel(Sel),
		.Y(Y[2])
	);

	Mux2_1 MuxBit3 (
		.A0(A0[3]),
		.A1(A1[3]),
		.Sel(Sel),
		.Y(Y[3])
	);

	Mux2_1 MuxBit4 (
		.A0(A0[4]),
		.A1(A1[4]),
		.Sel(Sel),
		.Y(Y[4])
	);

	Mux2_1 MuxBit5 (
		.A0(A0[5]),
		.A1(A1[5]),
		.Sel(Sel),
		.Y(Y[5])
	);

endmodule
