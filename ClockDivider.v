module ClockDivider (

	input CLK_50MHz, 
	input rst_n,
	output CLK_1Hz,
	output CLK_sync //This is optional, remove if you do not need it.

);

	reg Clk1HzReg;

	wire [3:0] Count0;
	wire [3:0] Count1;
	wire [3:0] Count2;
	wire [3:0] Count3;
	wire [3:0] Count4;
	wire [3:0] Count5;
	wire [3:0] Count6;
	wire [3:0] Count7;

	wire Overflow0;
	wire Overflow1;
	wire Overflow2;
	wire Overflow3;
	wire Overflow4;
	wire Overflow5;
	wire Overflow6;
	wire Overflow7;

	wire Clk1HzToggle;
	wire Clk1HzNext;

	// Six decade stages and two divide-by-5 stages give 25,000,000 input clocks per toggle
	CounterUnit CounterStage0 (
		.CLK(CLK_50MHz),
		.Setting(4'b1010),
		.Enable(1'b1),
		.rst_n(rst_n),
		.Count(Count0),
		.Overflow(Overflow0)
	);

	CounterUnit CounterStage1 (
		.CLK(CLK_50MHz),
		.Setting(4'b1010),
		.Enable(Overflow0),
		.rst_n(rst_n),
		.Count(Count1),
		.Overflow(Overflow1)
	);

	CounterUnit CounterStage2 (
		.CLK(CLK_50MHz),
		.Setting(4'b1010),
		.Enable(Overflow1),
		.rst_n(rst_n),
		.Count(Count2),
		.Overflow(Overflow2)
	);

	CounterUnit CounterStage3 (
		.CLK(CLK_50MHz),
		.Setting(4'b1010),
		.Enable(Overflow2),
		.rst_n(rst_n),
		.Count(Count3),
		.Overflow(Overflow3)
	);

	CounterUnit CounterStage4 (
		.CLK(CLK_50MHz),
		.Setting(4'b1010),
		.Enable(Overflow3),
		.rst_n(rst_n),
		.Count(Count4),
		.Overflow(Overflow4)
	);

	CounterUnit CounterStage5 (
		.CLK(CLK_50MHz),
		.Setting(4'b1010),
		.Enable(Overflow4),
		.rst_n(rst_n),
		.Count(Count5),
		.Overflow(Overflow5)
	);

	CounterUnit CounterStage6 (
		.CLK(CLK_50MHz),
		.Setting(4'b0101),
		.Enable(Overflow5),
		.rst_n(rst_n),
		.Count(Count6),
		.Overflow(Overflow6)
	);

	CounterUnit CounterStage7 (
		.CLK(CLK_50MHz),
		.Setting(4'b0101),
		.Enable(Overflow6),
		.rst_n(rst_n),
		.Count(Count7),
		.Overflow(Overflow7)
	);

	not ClockToggleGate (Clk1HzToggle, Clk1HzReg);

	Mux2_1 ClockMux (
		.A0(Clk1HzReg),
		.A1(Clk1HzToggle),
		.Sel(Overflow7),
		.Y(Clk1HzNext)
	);

	always @(posedge CLK_50MHz or negedge rst_n) begin
		if (!rst_n) begin
			Clk1HzReg <= 1'b0;
		end
		else begin
			Clk1HzReg <= Clk1HzNext;
		end
	end

	assign CLK_1Hz = Clk1HzReg;
	assign CLK_sync = Overflow7;

endmodule
