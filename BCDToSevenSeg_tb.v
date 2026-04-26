`timescale 1ns/1ns

module BCDToSevenSeg_tb;

	reg [3:0] BCD;
	wire [6:0] SevenSeg;
	integer Digit;

	BCDToSevenSeg DUT (
		.BCD(BCD),
		.SevenSeg(SevenSeg)
	);

	initial begin
		for (Digit = 0; Digit <= 10; Digit = Digit + 1) begin
			BCD = Digit[3:0];
			#20;
		end

		$stop;
	end

endmodule
