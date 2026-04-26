`timescale 1ns/1ns

module OverrideMux6_tb;

	reg [5:0] NormalSignal;
	reg [5:0] GreenSignal;
	reg [5:0] AmberSignal;
	reg [5:0] RedSignal;
	reg ForceGreen;
	reg ForceAmber;
	reg ForceRed;
	wire [5:0] Y;

	OverrideMux6 DUT (
		.NormalSignal(NormalSignal),
		.GreenSignal(GreenSignal),
		.AmberSignal(AmberSignal),
		.RedSignal(RedSignal),
		.ForceGreen(ForceGreen),
		.ForceAmber(ForceAmber),
		.ForceRed(ForceRed),
		.Y(Y)
	);

	initial begin
		NormalSignal = 6'b00_0010;
		GreenSignal = 6'b10_1111;
		AmberSignal = 6'b01_1111;
		RedSignal = 6'b00_1111;
		ForceGreen = 1'b0;
		ForceAmber = 1'b0;
		ForceRed = 1'b0;

		#20;
		ForceGreen = 1'b1;

		#20;
		ForceGreen = 1'b0;
		ForceAmber = 1'b1;

		#20;
		ForceGreen = 1'b1;

		#20;
		ForceRed = 1'b1;

		#20;
		ForceGreen = 1'b0;
		ForceAmber = 1'b0;
		ForceRed = 1'b0;

		#20;
		$stop;
	end

endmodule
