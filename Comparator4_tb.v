`timescale 1ns/1ns

module Comparator4_tb;

	reg [3:0] A;
	reg [3:0] B;
	wire Equal;

	Comparator4 DUT (
		.A(A),
		.B(B),
		.Equal(Equal)
	);

	initial begin
		A = 4'b0000; B = 4'b0000; #20;
		A = 4'b0011; B = 4'b0011; #20;
		A = 4'b0011; B = 4'b0100; #20;
		A = 4'b1111; B = 4'b1111; #20;
		A = 4'b1010; B = 4'b0111; #20;
		$stop;
	end

endmodule
