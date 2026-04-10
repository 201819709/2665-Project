module ClockDivider (
	
	input CLK_50MHz, 
	input rst_n,
	output CLK_1Hz,
	output CLK_sync //This is optional, remove if you do not need it.

);

	// 24,999,999 is used so the output flips every 25,000,000 input clocks.
	// That gives a full 1 Hz square wave from the 50 MHz board clock.
	localparam [25:0] TARGET_COUNT = 26'b01011111010111100000111111;
	localparam [25:0] ZERO_COUNT = 26'b00000000000000000000000000;

	reg [25:0] CountReg;
	reg Clk1HzReg;

	wire [25:0] CountAddOne;
	wire TargetCountReached;
	wire [25:0] CountLoad;
	wire Clk1HzToggle;
	wire Clk1HzNext;

	// Add 1 to the current counter value.
	IncrementAdder26 CounterAdder (
		.A(CountReg),
		.Sum(CountAddOne)	
	);

	// Check whether the counter has reached the target value.
	Comparator26 CounterComparator (
		.A(CountReg),
		.B(TARGET_COUNT),
		.Equal(TargetCountReached)	// output equal comparison result
	);

	// If the target is reached, clear the counter. Otherwise keep counting up.
	Mux2_26 CounterMux (
		.A0(CountAddOne),
		.A1(ZERO_COUNT),
		.Sel(TargetCountReached),	// base on compare result clear count register or load the +1 into wire
		.Y(CountLoad) 			// This is a 26 bit wire
	);

	not ClockToggleGate (Clk1HzToggle, Clk1HzReg);

	// Only flip the 1 Hz output when the counter hits the target count.
	Mux2_1 ClockMux (
		.A0(Clk1HzReg),
		.A1(Clk1HzToggle),
		.Sel(TargetCountReached),   // base on compare result output kept same or toggle
		.Y(Clk1HzNext)
	);

	always @(posedge CLK_50MHz or negedge rst_n) begin
		if (!rst_n) begin
			CountReg <= ZERO_COUNT;   // On power up set to 0, countLoad now 1
			Clk1HzReg <= 1'b0;
		end
		else begin
			CountReg <= CountLoad;    // countReg now + 1
			Clk1HzReg <= Clk1HzNext;  // output reg follows the mux output, either keep previous or invert
		end
	end

	assign CLK_1Hz = Clk1HzReg;
	assign CLK_sync = 1'b0;

endmodule
