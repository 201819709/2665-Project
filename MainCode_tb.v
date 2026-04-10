`timescale 1ns/1ns

module MainCode_tb;

	reg CLK_50MHz;
	reg rst_n;
	wire [6:0] HexH;
	wire [6:0] HexL;
	wire Green;
	wire Red;
	wire Amber;
	integer StepCount;

	MainCode DUT (
		.CLK_50MHz(CLK_50MHz),
		.rst_n(rst_n),
		.HexH(HexH),
		.HexL(HexL),
		.Green(Green),
		.Red(Red),
		.Amber(Amber)
	);

	initial begin
		CLK_50MHz = 1'b0;
	end

	always #10 CLK_50MHz = ~CLK_50MHz;

	initial begin
		rst_n = 1'b0;
		StepCount = 0;

		#100;
		rst_n = 1'b1;

		repeat (30) begin
			DUT.MainClockDivider.CountReg = 26'd24_999_997;
			#60;
		end

		$stop;
	end

	always @(posedge DUT.MainClockDivider.Clk1HzReg) begin
		StepCount = StepCount + 1;
		$display("Step %0d  State=%b  Count=%0d  Lights R=%b A=%b G=%b",
			StepCount,
			DUT.MainCoreLogic.StateReg,
			DUT.MainCoreLogic.CounterValue,
			Red,
			Amber,
			Green
		);
	end

endmodule
