module Mux2_1 (

	input A0,
	input A1,
	input Sel,
	output Y

);

	wire SelBar;
	wire Path0;
	wire Path1;

	not MuxNot0 (SelBar, Sel);
	and MuxAnd0 (Path0, A0, SelBar);
	and MuxAnd1 (Path1, A1, Sel);
	or MuxOr0 (Y, Path0, Path1);

endmodule
