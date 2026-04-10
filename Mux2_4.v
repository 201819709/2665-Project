module Mux2_4 (

	input [3:0] A0,
	input [3:0] A1,
	input Sel,
	output [3:0] Y

);

	Mux2_1 Bit0 (.A0(A0[0]), .A1(A1[0]), .Sel(Sel), .Y(Y[0]));
	Mux2_1 Bit1 (.A0(A0[1]), .A1(A1[1]), .Sel(Sel), .Y(Y[1]));
	Mux2_1 Bit2 (.A0(A0[2]), .A1(A1[2]), .Sel(Sel), .Y(Y[2]));
	Mux2_1 Bit3 (.A0(A0[3]), .A1(A1[3]), .Sel(Sel), .Y(Y[3]));

endmodule
