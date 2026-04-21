module Mux4_6 (

	input [5:0] A0,
	input [5:0] A1,
	input [5:0] A2,
	input [5:0] A3,
	input [1:0] Sel,
	output [5:0] Y

);

	wire [5:0] LowChoice;
	wire [5:0] HighChoice;

	Mux2_6 LowMux (
		.A0(A0),
		.A1(A1),
		.Sel(Sel[0]),
		.Y(LowChoice)
	);

	Mux2_6 HighMux (
		.A0(A2),
		.A1(A3),
		.Sel(Sel[0]),
		.Y(HighChoice)
	);

	Mux2_6 FinalMux (
		.A0(LowChoice),
		.A1(HighChoice),
		.Sel(Sel[1]),
		.Y(Y)
	);

endmodule
