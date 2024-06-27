module fad_str(a,b,cin,sum,cout
    );
	 input a,b,cin;
	 output sum,cout;
	 wire w1,w2,w3;
	 
	 ha_str i1(a,b,w1,w2);
	 ha_str i2(w1,cin,sum,w3);
	 or i3(cout,w2,w3);
endmodule
module ha_str(a,b,sum,cout
    );
	 input a,b;
	 output sum,cout;
	 xor n1(sum,a,b);
	 and n2(cout,a,b);
endmodule
module fad_str_tb;

	// Inputs
	reg a;
	reg b;
	reg cin;

	// Outputs
	wire sum;
	wire cout;

	// Instantiate the Design Under Test (DUT)
	fad_str uut (a,b,cin,sum,cout
	);

	initial a=1'b0;
	initial b=1'b0;
	initial cin=1'b0;
	always #20 cin=cin+1'b1;
	always #40 b=b+1'b1;
	always #80 a=a+1'b1;
	

      
endmodule

