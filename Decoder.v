module Decoder (

	input [5:0] ControlSignal,
	output [3:0] Count,			//in binary format!
	output Green,
	output Red,
	output Amber

);

	assign Count = ControlSignal[3:0];

	assign Red = ~ControlSignal[5] & ~ControlSignal[4];
	assign Amber = ControlSignal[4];
	assign Green = ControlSignal[5] & ~ControlSignal[4];

endmodule
