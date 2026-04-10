module CoreLogic (
	
	input CLK,
	input CLK_sync,	//This is optional, remove if you do not need it.
	input rst_n,
	output [5:0] ControlSignal  //Do NOT modify this signal!

);

	wire [1:0] StateReg;
	wire [3:0] CounterSetting;
	wire [3:0] CounterValue;
	wire PhaseDone;

	// Counts the seconds inside the current light phase
	CounterUnit StateCounter (
		.CLK(CLK),
		.Setting(CounterSetting),
		.rst_n(rst_n),
		.Count(CounterValue),
		.Done(PhaseDone)
	);

	// Moves through 00 01 10 11 and only advances when a phase finishes
	StateCounter2Bit LightStateCounter (
		.CLK(CLK),
		.Enable(PhaseDone),
		.rst_n(rst_n),
		.State(StateReg)
	);

	// Bit 0 of the state show whether this is an amber phase
	Mux2_4 SettingMux (
		.A0(4'b1010),
		.A1(4'b0011),
		.Sel(StateReg[0]),
		.Y(CounterSetting)
	);

	// Upper bits carry the light state, lower bits carry the current count
	assign ControlSignal[5:4] = StateReg;
	assign ControlSignal[3:0] = CounterValue;

endmodule
