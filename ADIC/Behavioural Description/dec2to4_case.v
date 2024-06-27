module dec2to4_case(i,y
    );
	 input [1:0]i;
	 output reg [3:0]y;
	 always @(i)
	  begin
	   case(i)
		 2'b00:y=4'b0001;
		 2'b01:y=4'b0010;
		 2'b10:y=4'b0100;
		 2'b11:y=4'b1000;
		endcase
	end
endmodule
module dec2to4_case_tb;

	// Inputs
	reg [1:0] i;

	// Outputs
	wire [3:0] y;

	// Instantiate the Design Test (DUT)
	dec2to4_case dut (i,y
	);

	initial begin
		// Initialize Inputs
		i=2'b00;#50;
		i=2'b01;#50;
		i=2'b10;#50;
		i=2'b11;#50;

	end
      
endmodule

