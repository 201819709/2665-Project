module Decoder (

	input [5:0] ControlSignal,
	output [3:0] Count,			//in binary format!
	output Green,
	output Red,
	output Amber

);

	wire [3:0] CountUp;
	wire [3:0] TargetValue;
	wire [3:0] CountDown;
	wire CountIsResetValue;
	wire [3:0] DisplayCount;

	assign CountUp = ControlSignal[3:0];

	// Amber phases count 3 to 1, red and green phases count 10 to 1
	Mux2_4 CountSelectMux (
		.A0(4'b1010),
		.A1(4'b0011),
		.Sel(ControlSignal[4]),
		.Y(TargetValue)
	);

	Subtractor4 CountSubtractor (
		.A(TargetValue),
		.B(CountUp),
		.Diff(CountDown)
	);

	// 1111 only appears during reset, not during normal counting
	Comparator4 ResetValueComparator (
		.A(CountUp),
		.B(4'b1111),
		.Equal(CountIsResetValue)
	);

	// While reset value is present, show the phase start number
	Mux2_4 ResetDisplayMux (
		.A0(CountDown),
		.A1(TargetValue),
		.Sel(CountIsResetValue),
		.Y(DisplayCount)
	);

	assign Count = DisplayCount;

	assign Red = ~ControlSignal[5] & ~ControlSignal[4];
	assign Amber = ControlSignal[4];
	assign Green = ControlSignal[5] & ~ControlSignal[4];

endmodule
