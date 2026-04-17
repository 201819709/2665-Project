`timescale 1ns/1ns

module CoreLogic_tb;

	reg CLK;
	reg CLK_sync;
	reg rst_n;
	reg ForceRed;
	reg ForceAmber;
	reg ForceGreen;
	wire [5:0] ControlSignal;
	integer StepCount;

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
		StepCount = 0;

		#40;
		rst_n = 1'b1;

		#700;
		$stop;
	end

	always @(posedge CLK) begin
		StepCount = StepCount + 1;
		$display("Step %0d  State=%b  Count=%b  ControlSignal=%b",
			StepCount,
			DUT.StateReg,
			DUT.CounterValue,
			ControlSignal
		);
	end

endmodule
