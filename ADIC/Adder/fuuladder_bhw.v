
module fuuladder_bhw(a,b,cin,s,cout
    );
	 input a,b,cin;
	 output s,cout;
	 reg s,cout;
	 always @(a,b,cin)
	 begin
	 s=a^b^cin;
	 cout=(a&b)+(cin&(a+b));
	 end
endmodule
module fulladder_bhw_tb;

	// Inputs
	reg a;
	reg b;
	reg cin;

	// Outputs
	wire s;
	wire cout;

	// Instantiate the Design Under Test (DUT)
	fuuladder_bhw dut (a,b,cin,s,cout
	);

	initial a=0;
	initial b=0;
	initial cin=0;
	
	always #20 cin=cin+1;
	always #40 b=b+1;
	always #80 a=a+1;

endmodule
