
module hs_case(a,b,d,bout
    );
	 input a,b;
	 output reg d,bout;
	 always @(*)
	  begin 
	    case({a,b})
		  2'b00:{d,bout}=2'b00;
		  2'b01:{d,bout}=2'b11;
		  2'b10:{d,bout}=2'b10;
		  2'b11:{d,bout}=2'b00;
		 endcase
	  end

endmodule
module hs_case_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire d;
	wire bout;

	// Instantiate the Design  Under Test (DUT)
	hs_case dut (a,b,d,bout
	);

	initial begin
		// Initialize Inputs
		{a,b}=2'b00;#20;
		{a,b}=2'b01;#20;
		{a,b}=2'b10;#20;
		{a,b}=2'b11;#20;

	end
      
endmodule

