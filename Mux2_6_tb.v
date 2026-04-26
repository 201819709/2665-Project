`timescale 1ns/1ns

module Mux2_6_tb;

	reg [5:0] A0;
	reg [5:0] A1;
	reg Sel;
	wire [5:0] Y;

	Mux2_6 DUT (
		.A0(A0),
		.A1(A1),
		.Sel(Sel),
		.Y(Y)
	);

	initial begin
		A0 = 6'b00_0000; A1 = 6'b10_1111; Sel = 1'b0; #20;
		A0 = 6'b00_0000; A1 = 6'b10_1111; Sel = 1'b1; #20;
		A0 = 6'b01_0011; A1 = 6'b11_0001; Sel = 1'b0; #20;
		A0 = 6'b01_0011; A1 = 6'b11_0001; Sel = 1'b1; #20;
		$stop;
	end

endmodule
