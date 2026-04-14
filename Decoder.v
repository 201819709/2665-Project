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

	assign Count = CountDown;

	assign Red = ~ControlSignal[5] & ~ControlSignal[4];
	assign Amber = ControlSignal[4];
	assign Green = ControlSignal[5] & ~ControlSignal[4];

endmodule
