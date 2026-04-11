`timescale 1ns/1ns

module CounterUnit_tb;

	reg CLK;
	reg [3:0] Setting;
	reg Enable;
	reg rst_n;
	wire [3:0] Count;
	wire Overflow;
	integer StepCount;

	CounterUnit DUT (
		.CLK(CLK),
		.Setting(Setting),
		.Enable(Enable),
		.rst_n(rst_n),
		.Count(Count),
		.Overflow(Overflow)
	);

	initial begin
		CLK = 1'b0;
	end

	always #10 CLK = ~CLK;

	initial begin
		Setting = 4'b1111;
		Enable = 1'b1;
		rst_n = 1'b0;
		StepCount = 0;

		#40;
		rst_n = 1'b1;

		#400;
		$stop;
	end

	always @(posedge CLK) begin
		StepCount = StepCount + 1;
		$display("Step %0d  Enable=%b  Setting=%b  Count=%b  Overflow=%b",
			StepCount,
			Enable,
			Setting,
			Count,
			Overflow
		);
	end

endmodule
