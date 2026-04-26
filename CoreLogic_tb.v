`timescale 1ns/1ns

module CoreLogic_tb;

	reg CLK;
	reg CLK_sync;
	reg rst_n;
	reg ForceRed;
	reg ForceAmber;
	reg ForceGreen;
	wire [5:0] ControlSignal;

	CoreLogic DUT (
		.CLK(CLK),
		.CLK_sync(CLK_sync),
		.rst_n(rst_n),
		.ForceRed(ForceRed),
		.ForceAmber(ForceAmber),
		.ForceGreen(ForceGreen),
		.ControlSignal(ControlSignal)
	);

	initial begin
		CLK = 1'b0;
		CLK_sync = 1'b0;
	end

	always #10 CLK = ~CLK;

	initial begin
		rst_n = 1'b0;
		ForceRed = 1'b0;
		ForceAmber = 1'b0;
		ForceGreen = 1'b0;

		#25;
		rst_n = 1'b1;

		#240;
		ForceGreen = 1'b1;

		#80;
		ForceGreen = 1'b0;
		ForceAmber = 1'b1;

		#80;
		ForceAmber = 1'b0;
		ForceRed = 1'b1;

		#80;
		ForceRed = 1'b0;

		#120;
		$stop;
	end

endmodule
