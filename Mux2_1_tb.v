`timescale 1ns/1ns

module Mux2_1_tb;

	reg A0;
	reg A1;
	reg Sel;
	wire Y;

	Mux2_1 DUT (
		.A0(A0),
		.A1(A1),
		.Sel(Sel),
		.Y(Y)
	);

	initial begin
		A0 = 1'b0; A1 = 1'b1; Sel = 1'b0; #20;
		A0 = 1'b0; A1 = 1'b1; Sel = 1'b1; #20;
		A0 = 1'b1; A1 = 1'b0; Sel = 1'b0; #20;
		A0 = 1'b1; A1 = 1'b0; Sel = 1'b1; #20;
		$stop;
	end

endmodule
