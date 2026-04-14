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
	reg [8*6-1:0] LightName;

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

		#40;
		rst_n = 1'b1;

		repeat (30) begin
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

		$stop;
	end

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
		$display("Step %0d  Light=%0s  Display=%0d  State=%b  RawCount=%0d",
			StepCount,
			LightName,
			DUT.MainDecoder.Count,
			DUT.MainCoreLogic.StateReg,
			DUT.MainCoreLogic.CounterValue
		);
	end

endmodule
