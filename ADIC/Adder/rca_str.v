module rca_str(a,b,cin,sum,cout
    );
	 input [3:0]a;
	 input [3:0]b;
	 input cin;
	 output [3:0]sum;
	 output cout;
	 wire [3:1]c;
	 fad_str i1(a[0],b[0],cin,sum[0],c[1]);
	 fad_str i2(a[1],b[1],c[1],sum[1],c[2]);
	 fad_str i3(a[2],b[2],c[2],sum[2],c[3]);
	 fad_str i4(a[3],b[3],c[3],sum[3],cout);
endmodule
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
module rca_str_tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg cin;

	// Outputs
	wire [3:0] sum;
	wire cout;

	// Instantiate the Design Under Test (DUT)
	rca_str dut (a,b,cin,sum,cout
	);

	initial a=4'b0;
	initial b=4'b0;
	initial cin=1'b0;
	always #40 cin=cin+1'b1;
	always #80 b=b+4'b0001;
	always #160 a=a+4'b0001;

      
endmodule

