module And26 (

	input [25:0] A,
	output Y

);

	wire [24:0] AndStage;

	and AndGate0 (AndStage[0], A[0], A[1]);
	and AndGate1 (AndStage[1], AndStage[0], A[2]);
	and AndGate2 (AndStage[2], AndStage[1], A[3]);
	and AndGate3 (AndStage[3], AndStage[2], A[4]);
	and AndGate4 (AndStage[4], AndStage[3], A[5]);
	and AndGate5 (AndStage[5], AndStage[4], A[6]);
	and AndGate6 (AndStage[6], AndStage[5], A[7]);
	and AndGate7 (AndStage[7], AndStage[6], A[8]);
	and AndGate8 (AndStage[8], AndStage[7], A[9]);
	and AndGate9 (AndStage[9], AndStage[8], A[10]);
	and AndGate10 (AndStage[10], AndStage[9], A[11]);
	and AndGate11 (AndStage[11], AndStage[10], A[12]);
	and AndGate12 (AndStage[12], AndStage[11], A[13]);
	and AndGate13 (AndStage[13], AndStage[12], A[14]);
	and AndGate14 (AndStage[14], AndStage[13], A[15]);
	and AndGate15 (AndStage[15], AndStage[14], A[16]);
	and AndGate16 (AndStage[16], AndStage[15], A[17]);
	and AndGate17 (AndStage[17], AndStage[16], A[18]);
	and AndGate18 (AndStage[18], AndStage[17], A[19]);
	and AndGate19 (AndStage[19], AndStage[18], A[20]);
	and AndGate20 (AndStage[20], AndStage[19], A[21]);
	and AndGate21 (AndStage[21], AndStage[20], A[22]);
	and AndGate22 (AndStage[22], AndStage[21], A[23]);
	and AndGate23 (AndStage[23], AndStage[22], A[24]);
	and AndGate24 (Y, AndStage[23], A[25]);

endmodule
