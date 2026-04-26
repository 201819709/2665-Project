`timescale 1ns/1ns

module ClockDivider_tb;

	reg CLK_50MHz;
	reg rst_n;
	wire CLK_1Hz;
	wire CLK_sync;

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

		#25;
		rst_n = 1'b1;

		DUT.Clk1HzReg = 1'b0;
		run_divider_steps(4);
		$stop;
	end

	task run_divider_steps;
		input integer NumberOfSteps;
		integer StepIndex;
		begin
			for (StepIndex = 0; StepIndex < NumberOfSteps; StepIndex = StepIndex + 1) begin
				DUT.CounterStage0.CountReg = 4'b1001;
				DUT.CounterStage1.CountReg = 4'b1001;
				DUT.CounterStage2.CountReg = 4'b1001;
				DUT.CounterStage3.CountReg = 4'b1001;
				DUT.CounterStage4.CountReg = 4'b1001;
				DUT.CounterStage5.CountReg = 4'b1001;
				DUT.CounterStage6.CountReg = 4'b0100;
				DUT.CounterStage7.CountReg = 4'b0100;
				#60;
			end
		end
	endtask

endmodule
