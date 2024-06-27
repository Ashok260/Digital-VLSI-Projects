module halfadder_bhw(a,b,s,cout
    );
	 input a,b;
	 output s,cout;
	 reg s,cout;
	 always @(a,b)
	 begin 
	   s=a^b;
	   cout=a&b;
	 end
endmodule
module halfadder_bhw_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire s;
	wire cout;

	// Instantiate the Design Under Test (DUT)
	halfadder_bhw dut (a,b,s,cout
	);

	initial begin
		// Initialize Inputss
		a = 0;b=0;#5;
		a=0;b=1;#5;
		a=1;b=0;#5;
		a=1;b=1;#5;

	end
      
endmodule
