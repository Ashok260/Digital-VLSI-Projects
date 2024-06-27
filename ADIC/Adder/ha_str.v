module ha_str(a,b,sum,cout
    );
	 input a,b;
	 output sum,cout;
	 xor n1(sum,a,b);
	 and n2(cout,a,b);
	 
endmodule
module ha_str_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire sum;
	wire cout;

	// Instantiate the Design Under Test (DUT)
	ha_str dut (a,b,sum,cout
	);

	initial a=1'b0;
	initial b=1'b0;
	always #50 b=b+1'b1;
	always #100 a=a+1'b1;      
endmodule
