`timescale 1ns/1ns

module FullAdder_tb;

	reg A;
	reg B;
	reg Cin;
	wire Sum;
	wire Cout;

	FullAdder DUT (
		.A(A),
		.B(B),
		.Cin(Cin),
		.Sum(Sum),
		.Cout(Cout)
	);

	initial begin
		A = 1'b0; B = 1'b0; Cin = 1'b0; #20;
		A = 1'b0; B = 1'b0; Cin = 1'b1; #20;
		A = 1'b0; B = 1'b1; Cin = 1'b0; #20;
		A = 1'b0; B = 1'b1; Cin = 1'b1; #20;
		A = 1'b1; B = 1'b0; Cin = 1'b0; #20;
		A = 1'b1; B = 1'b0; Cin = 1'b1; #20;
		A = 1'b1; B = 1'b1; Cin = 1'b0; #20;
		A = 1'b1; B = 1'b1; Cin = 1'b1; #20;
		$stop;
	end

endmodule
