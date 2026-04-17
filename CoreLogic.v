module CoreLogic (
	
	input CLK,
	input CLK_sync,	//This is optional, remove if you do not need it.
	input rst_n,
	input ForceRed,
	input ForceAmber,
	input ForceGreen,
	output [5:0] ControlSignal  //Do NOT modify this signal!

);

	reg [1:0] StateReg;

	wire [1:0] StateAfterAdd;
	wire [1:0] StateNext;
	wire [3:0] CounterSetting;
	wire [3:0] CounterValue;
	wire PhaseDone;
	wire [5:0] NormalControlSignal;
	wire [5:0] GreenOverrideSignal;
	wire [5:0] AmberOverrideSignal;
	wire [5:0] RedOverrideSignal;

	IncrementAdder2 StateAdder (
		.A(StateReg),
		.Sum(StateAfterAdd)
	);

	CounterUnit PhaseCounter (
		.CLK(CLK),
		.Setting(CounterSetting),
		.Enable(1'b1),
		.rst_n(rst_n),
		.Count(CounterValue),
		.Overflow(PhaseDone)
	);

	// State bit 0 separates the 10-second phases from the 3-second phases
	Mux2_4 SettingMux (
		.A0(4'b1010),
		.A1(4'b0011),
		.Sel(StateReg[0]),
		.Y(CounterSetting)
	);

	Mux2_1 StateMux0 (
		.A0(StateReg[0]),
		.A1(StateAfterAdd[0]),
		.Sel(PhaseDone),
		.Y(StateNext[0])
	);

	Mux2_1 StateMux1 (
		.A0(StateReg[1]),
		.A1(StateAfterAdd[1]),
		.Sel(PhaseDone),
		.Y(StateNext[1])
	);

	always @(posedge CLK or negedge rst_n) begin
		if (!rst_n) begin
			StateReg <= 2'b00;
		end
		else begin
			StateReg <= StateNext;
		end
	end

	assign NormalControlSignal = {StateReg, CounterValue};
	assign GreenOverrideSignal = 6'b10_1111;
	assign AmberOverrideSignal = 6'b01_1111;
	assign RedOverrideSignal = 6'b00_1111;

	OverrideMux6 ManualOverrideMux (
		.NormalSignal(NormalControlSignal),
		.GreenSignal(GreenOverrideSignal),
		.AmberSignal(AmberOverrideSignal),
		.RedSignal(RedOverrideSignal),
		.ForceGreen(ForceGreen),
		.ForceAmber(ForceAmber),
		.ForceRed(ForceRed),
		.Y(ControlSignal)
	);

endmodule
