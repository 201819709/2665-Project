//Note: You MUST Build the CoreLogic Module using this submodule
//Note: This CounterUnit MUST count upwards!

module CounterUnit (
	
	input CLK,
	input [3:0] Setting,
	input Enable,
	input rst_n,
	output [3:0] Count,
	output Overflow

);

	// Stores the current count value
	reg [3:0] CountReg;
	// Holds the reset value used when the count wraps
	reg [3:0] ZeroCount;

	// Next value after adding 1 to the current count
	wire [3:0] CountAfterAdd;
	// Goes high when the next count reaches the setting value
	wire TargetCountReached;
	// Overflow only happens when counting is enabled and the target is reached
	wire CountEnableAndTarget;
	// Output of the wrap-or-keep-counting mux
	wire [3:0] CountToLoad;
	// Final value that will be loaded into the register
	wire [3:0] CountHoldOrLoad;

	initial begin
		ZeroCount = 4'b0000;
	end

	// Add 1 to the current counter value.
	IncrementAdder4 CounterAdder (
		.A(CountReg),
		.Sum(CountAfterAdd)	
	);

	// Check whether the counter has reached the target value.
	Comparator4 CounterComparator (
		.A(CountAfterAdd),
		.B(Setting),
		.Equal(TargetCountReached)	// output equal comparison result
	);

	// Only raise overflow when the counter is enabled and reaches the target
	and OverflowAndGate (CountEnableAndTarget, Enable, TargetCountReached);

	// If the target is reached, clear the counter. Otherwise keep counting up.
	Mux2_4 CounterMux (
		.A0(CountAfterAdd),
		.A1(ZeroCount),
		.Sel(TargetCountReached),	// base on compare result clear count register or load the +1 into wire
		.Y(CountToLoad) 			// This is a 4 bit wire
	);

	// For cascaded counters, enable only the counter that needs to count
	Mux2_4 EnableMux (
		.A0(CountReg),
		.A1(CountToLoad),
		.Sel(Enable),
		.Y(CountHoldOrLoad)
	);

	always @(posedge CLK or negedge rst_n) begin
		if (!rst_n) begin
			CountReg <= ZeroCount;   // On power up set to 0, countLoad now 1
		end
		else begin
			CountReg <= CountHoldOrLoad;    // countReg now + 1
		end
	end

	assign Count = CountReg;
	assign Overflow = CountEnableAndTarget;

endmodule
