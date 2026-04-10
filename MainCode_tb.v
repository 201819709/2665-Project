`timescale 1ns/1ps

module MainCode_tb;

	reg CLK_50MHz;
	reg rst_n;
	wire [6:0] HexH;
	wire [6:0] HexL;
	wire Green;
	wire Red;
	wire Amber;

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

		#100;
		rst_n = 1'b1;

		// Push the divider close to rollover so the 1 Hz domain can be observed in simulation
		DUT.MainClockDivider.CountReg = 26'd24_999_997;
		DUT.MainClockDivider.Clk1HzReg = 1'b0;

		#200;

		DUT.MainClockDivider.CountReg = 26'd24_999_997;

		#200;

		DUT.MainClockDivider.CountReg = 26'd24_999_997;

		#200;

		DUT.MainClockDivider.CountReg = 26'd24_999_997;

		#200;

		DUT.MainClockDivider.CountReg = 26'd24_999_997;

		#200;

		DUT.MainClockDivider.CountReg = 26'd24_999_997;

		#200;

		DUT.MainClockDivider.CountReg = 26'd24_999_997;

		#200;

		$stop;
	end

endmodule
