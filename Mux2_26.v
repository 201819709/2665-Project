module Mux2_26 (

	input [25:0] A0,
	input [25:0] A1,
	input Sel,
	output [25:0] Y

);

	Mux2_1 Bit0 (.A0(A0[0]), .A1(A1[0]), .Sel(Sel), .Y(Y[0]));
	Mux2_1 Bit1 (.A0(A0[1]), .A1(A1[1]), .Sel(Sel), .Y(Y[1]));
	Mux2_1 Bit2 (.A0(A0[2]), .A1(A1[2]), .Sel(Sel), .Y(Y[2]));
	Mux2_1 Bit3 (.A0(A0[3]), .A1(A1[3]), .Sel(Sel), .Y(Y[3]));
	Mux2_1 Bit4 (.A0(A0[4]), .A1(A1[4]), .Sel(Sel), .Y(Y[4]));
	Mux2_1 Bit5 (.A0(A0[5]), .A1(A1[5]), .Sel(Sel), .Y(Y[5]));
	Mux2_1 Bit6 (.A0(A0[6]), .A1(A1[6]), .Sel(Sel), .Y(Y[6]));
	Mux2_1 Bit7 (.A0(A0[7]), .A1(A1[7]), .Sel(Sel), .Y(Y[7]));
	Mux2_1 Bit8 (.A0(A0[8]), .A1(A1[8]), .Sel(Sel), .Y(Y[8]));
	Mux2_1 Bit9 (.A0(A0[9]), .A1(A1[9]), .Sel(Sel), .Y(Y[9]));
	Mux2_1 Bit10 (.A0(A0[10]), .A1(A1[10]), .Sel(Sel), .Y(Y[10]));
	Mux2_1 Bit11 (.A0(A0[11]), .A1(A1[11]), .Sel(Sel), .Y(Y[11]));
	Mux2_1 Bit12 (.A0(A0[12]), .A1(A1[12]), .Sel(Sel), .Y(Y[12]));
	Mux2_1 Bit13 (.A0(A0[13]), .A1(A1[13]), .Sel(Sel), .Y(Y[13]));
	Mux2_1 Bit14 (.A0(A0[14]), .A1(A1[14]), .Sel(Sel), .Y(Y[14]));
	Mux2_1 Bit15 (.A0(A0[15]), .A1(A1[15]), .Sel(Sel), .Y(Y[15]));
	Mux2_1 Bit16 (.A0(A0[16]), .A1(A1[16]), .Sel(Sel), .Y(Y[16]));
	Mux2_1 Bit17 (.A0(A0[17]), .A1(A1[17]), .Sel(Sel), .Y(Y[17]));
	Mux2_1 Bit18 (.A0(A0[18]), .A1(A1[18]), .Sel(Sel), .Y(Y[18]));
	Mux2_1 Bit19 (.A0(A0[19]), .A1(A1[19]), .Sel(Sel), .Y(Y[19]));
	Mux2_1 Bit20 (.A0(A0[20]), .A1(A1[20]), .Sel(Sel), .Y(Y[20]));
	Mux2_1 Bit21 (.A0(A0[21]), .A1(A1[21]), .Sel(Sel), .Y(Y[21]));
	Mux2_1 Bit22 (.A0(A0[22]), .A1(A1[22]), .Sel(Sel), .Y(Y[22]));
	Mux2_1 Bit23 (.A0(A0[23]), .A1(A1[23]), .Sel(Sel), .Y(Y[23]));
	Mux2_1 Bit24 (.A0(A0[24]), .A1(A1[24]), .Sel(Sel), .Y(Y[24]));
	Mux2_1 Bit25 (.A0(A0[25]), .A1(A1[25]), .Sel(Sel), .Y(Y[25]));

endmodule
