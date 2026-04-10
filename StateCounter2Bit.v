module StateCounter2Bit (

	input CLK,
	input Enable,
	input rst_n,
	output [1:0] State

);

	reg [1:0] StateReg;

	wire [1:0] StateAddOne;
	wire [1:0] StateLoad;

	IncrementAdder2 StateAdder (
		.A(StateReg),
		.Sum(StateAddOne)
	);

	Mux2_1 StateMux0 (
		.A0(StateReg[0]),
		.A1(StateAddOne[0]),
		.Sel(Enable),
		.Y(StateLoad[0])
	);

	Mux2_1 StateMux1 (
		.A0(StateReg[1]),
		.A1(StateAddOne[1]),
		.Sel(Enable),
		.Y(StateLoad[1])
	);

	always @(posedge CLK or negedge rst_n) begin
		if (!rst_n) begin
			StateReg <= 2'b00;
		end
		else begin
			StateReg <= StateLoad;
		end
	end

	assign State = StateReg;

endmodule
