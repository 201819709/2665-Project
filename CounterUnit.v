//Note: You MUST Build the CoreLogic Module using this submodule
//Note: This CounterUnit MUST count upwards!

module CounterUnit (
	
	input CLK,
	input [3:0] Setting,
	input rst_n,
	output [3:0] Count,
	output Done

);

	reg [3:0] CountReg;

	wire [3:0] CountAddOne;
	wire CountAtTarget;
	wire [3:0] CountLoad;

	IncrementAdder4 CounterAdder (
		.A(CountReg),
		.Sum(CountAddOne)
	);

	Comparator4 CounterComparator (
		.A(CountAddOne),
		.B(Setting),
		.Equal(CountAtTarget)
	);

	Mux2_4 CounterMux (
		.A0(CountAddOne),
		.A1(4'b0000),
		.Sel(CountAtTarget),
		.Y(CountLoad)
	);

	always @(posedge CLK or negedge rst_n) begin
		if (!rst_n) begin
			CountReg <= 4'b0000;
		end
		else begin
			CountReg <= CountLoad;
		end
	end

	assign Count = CountReg;
	assign Done = CountAtTarget;

endmodule
