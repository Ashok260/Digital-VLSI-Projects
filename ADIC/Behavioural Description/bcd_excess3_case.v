module bcd_excess3_case(b,e
    );
	 input [3:0]b;
	 output reg [3:0]e;
	 always @(b)
	  begin
	   case(b)
		 4'b0000:e=4'b0011;
		 4'b0001:e=4'b0100;
		 4'b0010:e=4'b0101;
		 4'b0011:e=4'b0110;
		 4'b0100:e=4'b0111;
		 4'b0101:e=4'b1000;
		 4'b0110:e=4'b1001;
		 4'b0111:e=4'b1010;
		 4'b1000:e=4'b1011;
		 4'b1001:e=4'b1100;
		endcase
		casex(b)
		 4'b1010:e=4'bxxxx;
		 4'b1011:e=4'bxxxx;
		 4'b1100:e=4'bxxxx;
		 4'b1101:e=4'bxxxx;
		 4'b1110:e=4'bxxxx;
		 4'b1111:e=4'bxxxx;
		 endcase
		end
endmodule
module bcdtoexcess3_case_tb;

	// Inputs
	reg [3:0] b;

	// Outputs
	wire [3:0] e;

	// Instantiate the Design Under Test (DUT)
	bcd_excess3_case dut (b,e
	);

	initial b=4'b0000;
	always #50 b=b+4'b0001;

endmodule
