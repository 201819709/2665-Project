module SevenSegDisplay(

	input [3:0] Count,
	output [6:0] SevenSegH,
	output [6:0] SevenSegL

);

	wire CountIsTen;
	wire [3:0] TensDigit;
	wire [3:0] OnesDigit;

	Comparator4 TenComparator (
		.A(Count),
		.B(4'b1010),
		.Equal(CountIsTen)
	);

	Mux2_4 HighDigitMux (
		.A0(4'b0000),
		.A1(4'b0001),
		.Sel(CountIsTen),
		.Y(TensDigit)
	);

	Mux2_4 LowDigitMux (
		.A0(Count),
		.A1(4'b0000),
		.Sel(CountIsTen),
		.Y(OnesDigit)
	);

	BCDToSevenSeg HighDisplay (
		.BCD(TensDigit),
		.SevenSeg(SevenSegH)
	);

	BCDToSevenSeg LowDisplay (
		.BCD(OnesDigit),
		.SevenSeg(SevenSegL)
	);

endmodule
