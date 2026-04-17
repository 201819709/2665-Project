`timescale 1ns/1ns

module MainCode_tb;

	reg CLK_50MHz;
	reg rst_n;
	reg ForceRed;
	reg ForceAmber;
	reg ForceGreen;
	wire [6:0] HexH;
	wire [6:0] HexL;
	wire Green;
	wire Red;
	wire Amber;
	integer StepCount;
	reg [8*6-1:0] LightName;

	MainCode DUT (
		.CLK_50MHz(CLK_50MHz),
		.rst_n(rst_n),
		.ForceRed(ForceRed),
		.ForceAmber(ForceAmber),
		.ForceGreen(ForceGreen),
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
		ForceRed = 1'b0;
		ForceAmber = 1'b0;
		ForceGreen = 1'b0;
		StepCount = 0;

		#40;
		rst_n = 1'b1;

		run_divider_steps(8);

		ForceGreen = 1'b1;
		run_divider_steps(4);
		ForceGreen = 1'b0;

		ForceAmber = 1'b1;
		run_divider_steps(4);
		ForceAmber = 1'b0;

		ForceRed = 1'b1;
		run_divider_steps(4);
		ForceRed = 1'b0;

		run_divider_steps(8);

		$stop;
	end

	task run_divider_steps;
		input integer NumberOfSteps;
		integer StepIndex;
		begin
			for (StepIndex = 0; StepIndex < NumberOfSteps; StepIndex = StepIndex + 1) begin
				DUT.MainClockDivider.CounterStage0.CountReg = 4'b1001;
				DUT.MainClockDivider.CounterStage1.CountReg = 4'b1001;
				DUT.MainClockDivider.CounterStage2.CountReg = 4'b1001;
				DUT.MainClockDivider.CounterStage3.CountReg = 4'b1001;
				DUT.MainClockDivider.CounterStage4.CountReg = 4'b1001;
				DUT.MainClockDivider.CounterStage5.CountReg = 4'b1001;
				DUT.MainClockDivider.CounterStage6.CountReg = 4'b0100;
				DUT.MainClockDivider.CounterStage7.CountReg = 4'b0100;
				#60;
			end
		end
	endtask

	always @(*) begin
		if (Red) begin
			LightName = "RED   ";
		end
		else if (Amber) begin
			LightName = "AMBER ";
		end
		else if (Green) begin
			LightName = "GREEN ";
		end
		else begin
			LightName = "OFF   ";
		end
	end

	always @(posedge DUT.MainClockDivider.Clk1HzReg) begin
		StepCount = StepCount + 1;
		$display("Step %0d  Light=%0s  Display=%0d  State=%b  RawCount=%0d  Override R=%b A=%b G=%b",
			StepCount,
			LightName,
			DUT.MainDecoder.Count,
			DUT.MainCoreLogic.StateReg,
			DUT.MainCoreLogic.CounterValue,
			ForceRed,
			ForceAmber,
			ForceGreen
		);
	end

endmodule
