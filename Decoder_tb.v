`timescale 1ns/1ns

module Decoder_tb;

	reg [5:0] ControlSignal;
	wire [3:0] Count;
	wire Green;
	wire Red;
	wire Amber;

	Decoder DUT (
		.ControlSignal(ControlSignal),
		.Count(Count),
		.Green(Green),
		.Red(Red),
		.Amber(Amber)
	);

	initial begin
		ControlSignal = 6'b00_1111; #20;
		ControlSignal = 6'b00_0001; #20;
		ControlSignal = 6'b01_1111; #20;
		ControlSignal = 6'b01_0010; #20;
		ControlSignal = 6'b10_0000; #20;
		ControlSignal = 6'b11_0001; #20;
		$stop;
	end

endmodule
