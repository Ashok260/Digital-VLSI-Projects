module ha_case(a,b,s,cout
    );
	 input a,b;
	 output reg s,cout;
	 always @(*)
	  begin
	   case({a,b})
		  2'b00 :{s,cout}=2'b00;
		  2'b01 :{s,cout}=2'b10;
		  2'b10 :{s,cout}=2'b10;
		  2'b11 :{s,cout}=2'b01;
		 endcase
		end
endmodule
module ha_case_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire s;
	wire cout;

	// Instantiate the Design Under Test (DUT)
	ha_case dut (a,b,s,cout
	);

	initial begin
		// Initialize Inputs
		{a,b}=2'b00;#20;
		{a,b}=2'b01;#20;
		{a,b}=2'b10;#20;
		{a,b}=2'b11;#20;

	end
      
endmodule
