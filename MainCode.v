module MainCode (

	input CLK_50MHz,
	input rst_n,
	input ForceRed,
	input ForceAmber,
	input ForceGreen,
	output [6:0] HexH,
	output [6:0] HexL,
	output Green,
	output Red,
	output Amber

);

	wire CLK_1Hz;
	wire CLK_sync;
	wire [5:0] ControlSignal;
	wire [3:0] Count;

	ClockDivider MainClockDivider (
		.CLK_50MHz(CLK_50MHz),
		.rst_n(rst_n),
		.CLK_1Hz(CLK_1Hz),
		.CLK_sync(CLK_sync)
	);

	CoreLogic MainCoreLogic (
		.CLK(CLK_1Hz),
		.CLK_sync(CLK_sync),
		.rst_n(rst_n),
		.ForceRed(ForceRed),
		.ForceAmber(ForceAmber),
		.ForceGreen(ForceGreen),
		.ControlSignal(ControlSignal)
	);

	Decoder MainDecoder (
		.ControlSignal(ControlSignal),
		.Count(Count),
		.Green(Green),
		.Red(Red),
		.Amber(Amber)
	);

	SevenSegDisplay MainDisplay (
		.Count(Count),
		.SevenSegH(HexH),
		.SevenSegL(HexL)
	);

endmodule
