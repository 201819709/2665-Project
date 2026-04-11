`timescale 1ns/1ns

module ClockDivider_tb;

	reg CLK_50MHz;
	reg rst_n;
	wire CLK_1Hz;
	wire CLK_sync;
	integer StepCount;

	ClockDivider DUT (
		.CLK_50MHz(CLK_50MHz),
		.rst_n(rst_n),
		.CLK_1Hz(CLK_1Hz),
		.CLK_sync(CLK_sync)
	);

	initial begin
		CLK_50MHz = 1'b0;
	end

	always #10 CLK_50MHz = ~CLK_50MHz;

	initial begin
		rst_n = 1'b0;
		StepCount = 0;

		#40;
		rst_n = 1'b1;

		// Put the cascaded counters near their wrap point so the divider can be observed quickly
		DUT.CounterStage0.CountReg = 4'b1001;
		DUT.CounterStage1.CountReg = 4'b1001;
		DUT.CounterStage2.CountReg = 4'b1001;
		DUT.CounterStage3.CountReg = 4'b1001;
		DUT.CounterStage4.CountReg = 4'b1001;
		DUT.CounterStage5.CountReg = 4'b1001;
		DUT.CounterStage6.CountReg = 4'b0100;
		DUT.CounterStage7.CountReg = 4'b0100;
		DUT.Clk1HzReg = 1'b0;

		#200;

		DUT.CounterStage0.CountReg = 4'b1001;
		DUT.CounterStage1.CountReg = 4'b1001;
		DUT.CounterStage2.CountReg = 4'b1001;
		DUT.CounterStage3.CountReg = 4'b1001;
		DUT.CounterStage4.CountReg = 4'b1001;
		DUT.CounterStage5.CountReg = 4'b1001;
		DUT.CounterStage6.CountReg = 4'b0100;
		DUT.CounterStage7.CountReg = 4'b0100;

		#200;

		DUT.CounterStage0.CountReg = 4'b1001;
		DUT.CounterStage1.CountReg = 4'b1001;
		DUT.CounterStage2.CountReg = 4'b1001;
		DUT.CounterStage3.CountReg = 4'b1001;
		DUT.CounterStage4.CountReg = 4'b1001;
		DUT.CounterStage5.CountReg = 4'b1001;
		DUT.CounterStage6.CountReg = 4'b0100;
		DUT.CounterStage7.CountReg = 4'b0100;

		#200;

		DUT.CounterStage0.CountReg = 4'b1001;
		DUT.CounterStage1.CountReg = 4'b1001;
		DUT.CounterStage2.CountReg = 4'b1001;
		DUT.CounterStage3.CountReg = 4'b1001;
		DUT.CounterStage4.CountReg = 4'b1001;
		DUT.CounterStage5.CountReg = 4'b1001;
		DUT.CounterStage6.CountReg = 4'b0100;
		DUT.CounterStage7.CountReg = 4'b0100;

		#200;
		$stop;
	end

	always @(posedge CLK_1Hz) begin
		StepCount = StepCount + 1;
		$display("Step %0d  CLK_1Hz=%b  CLK_sync=%b", StepCount, CLK_1Hz, CLK_sync);
	end

endmodule
