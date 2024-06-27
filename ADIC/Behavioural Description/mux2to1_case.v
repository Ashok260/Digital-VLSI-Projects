
module mux2to1_case(s,i,y
    );
	 input [1:0]i;
	 input s;
	 output reg y;
	 always @(*)
	  begin 
	   case(s)
		 1'b0:y=i[0];
		 1'b1:y=i[1];
		endcase
	end


endmodule
module mux2to1_case_tb;

	// Inputs
	reg s;
	reg [1:0] i;

	// Outputs
	wire y;

	// Instantiate the Design Under Test (DUT)
	mux2to1_case dut (s,i,y
	);

	initial begin
		// Initialize Inputs
		s=1'b0;i=2'b01;#20;
		s=1'b1;i=2'b11;#20;
		s=1'b0;i=2'b10;#20;
		s=1'b1;i=2'b01;#20;

	end
      
endmodule
