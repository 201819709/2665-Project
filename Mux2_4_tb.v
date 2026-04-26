`timescale 1ns/1ns

module Mux2_4_tb;

	reg [3:0] A0;
	reg [3:0] A1;
	reg Sel;
	wire [3:0] Y;

	Mux2_4 DUT (
		.A0(A0),
		.A1(A1),
		.Sel(Sel),
		.Y(Y)
	);

	initial begin
		A0 = 4'b0011; A1 = 4'b1100; Sel = 1'b0; #20;
		A0 = 4'b0011; A1 = 4'b1100; Sel = 1'b1; #20;
		A0 = 4'b0101; A1 = 4'b1010; Sel = 1'b0; #20;
		A0 = 4'b0101; A1 = 4'b1010; Sel = 1'b1; #20;
		$stop;
	end

endmodule
