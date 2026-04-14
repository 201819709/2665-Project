module BCDToSevenSeg (

	input [3:0] BCD,
	output [6:0] SevenSeg

);

	wire A;
	wire B;
	wire C;
	wire D;

	wire NotA;
	wire NotB;
	wire NotC;
	wire NotD;

	assign A = BCD[3];
	assign B = BCD[2];
	assign C = BCD[1];
	assign D = BCD[0];

	not NotGateA (NotA, A);
	not NotGateB (NotB, B);
	not NotGateC (NotC, C);
	not NotGateD (NotD, D);

	assign SevenSeg[0] = (NotA & NotB & NotC & D) | (NotA & B & NotC & NotD);
	assign SevenSeg[1] = (NotA & B & NotC & D) | (NotA & B & C & NotD);
	assign SevenSeg[2] = (NotA & NotB & C & NotD);
	assign SevenSeg[3] = (NotA & NotB & NotC & D) | (NotA & B & NotC & NotD) | (NotA & B & C & D);
	assign SevenSeg[4] = (NotA & D) | (NotA & B & NotC) | (A & NotB & NotC & D);
	assign SevenSeg[5] = (NotA & NotB & D) | (NotA & NotB & C) | (NotA & C & D);
	assign SevenSeg[6] = (NotA & NotB & NotC) | (NotA & B & C & D);

endmodule

