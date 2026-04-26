`timescale 1ns/1ns

module CounterUnit_tb;

	reg CLK;
	reg [3:0] Setting;
	reg Enable;
	reg rst_n;
	wire [3:0] Count;
	wire Overflow;

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
		Setting = 4'b0101;
		Enable = 1'b0;
		rst_n = 1'b0;

		#25;
		rst_n = 1'b1;

		#20;
		Enable = 1'b1;

		#120;
		Enable = 1'b0;

		#40;
		Setting = 4'b0011;
		Enable = 1'b1;

		#100;
		$stop;
	end

endmodule
