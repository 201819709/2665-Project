`timescale 1ns/1ns

module Subtractor4_tb;

	reg [3:0] A;
	reg [3:0] B;
	wire [3:0] Diff;

	Subtractor4 DUT (
		.A(A),
		.B(B),
		.Diff(Diff)
	);

	initial begin
		A = 4'b1010; B = 4'b0000; #20;
		A = 4'b1010; B = 4'b0001; #20;
		A = 4'b1010; B = 4'b0011; #20;
		A = 4'b0011; B = 4'b0011; #20;
		$stop;
	end

endmodule
