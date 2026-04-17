module OverrideMux6 (

	input [5:0] NormalSignal,
	input [5:0] GreenSignal,
	input [5:0] AmberSignal,
	input [5:0] RedSignal,
	input ForceGreen,
	input ForceAmber,
	input ForceRed,
	output [5:0] Y

);

	wire [5:0] GreenOrNormal;
	wire [5:0] AmberOrPrevious;

	// Green has lowest manual priority
	Mux2_6 GreenMux (
		.A0(NormalSignal),
		.A1(GreenSignal),
		.Sel(ForceGreen),
		.Y(GreenOrNormal)
	);

	// Amber wins over green
	Mux2_6 AmberMux (
		.A0(GreenOrNormal),
		.A1(AmberSignal),
		.Sel(ForceAmber),
		.Y(AmberOrPrevious)
	);

	// Red wins over all manual modes
	Mux2_6 RedMux (
		.A0(AmberOrPrevious),
		.A1(RedSignal),
		.Sel(ForceRed),
		.Y(Y)
	);

endmodule
