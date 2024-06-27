module claa(a,b,cin,s,cout
    );
	 input [3:0]a;
	 input [3:0]b;
	 input cin;
	 output [3:0]s;
	 output cout;
	 wire [3:0]p;
	 wire [3:0]g;
	 wire [3:1]c;
	 assign p[0]=a[0]^b[0];
	 assign g[0]=a[0]&b[0];
	 assign s[0]=p[0]^cin;
	 assign c[1]=g[0]|(p[0]&cin);
	 
	 assign p[1]=a[1]^b[1];
	 assign g[1]=a[1]&b[1];
	 assign s[1]=p[1]^c[1];
	 assign c[2]=g[1]|(p[1]&g[0])|(p[1]&cin);
	 
	 assign p[2]=a[2]^b[2];
	 assign g[2]=a[2]&b[2];
	 assign s[2]=p[2]^c[2];
	 assign c[2]=g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&cin);
	 
	 assign p[3]=a[3]^b[3];
	 assign g[3]=a[3]&b[3];
	 assign s[3]=p[3]^c[3];
	 assign cout=g[3]&p[3]&c[3];
	 
endmodule


module claa_tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg cin;

	// Outputs
	wire [3:0] s;
	wire cout;

	// Instantiate the design Under Test (DUT)
	claa dut (a,b,c,s,cout);

	initial a=4'b0000;
	initial b=4'b0000;
	initial cin=1'b0;
	always #80 a=a+4'b0001;
	always #20 b=b+4'b0001;
	always #20 cin=cin+1'b1;
endmodule

