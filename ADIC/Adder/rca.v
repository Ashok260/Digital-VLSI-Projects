module rca(a,b,cin,s,cout
    );
input [3:0]a;
input [3:0]b;
input cin;
output cout;
output [3:0]s;
wire [2:0]c;
assign s[0]=a[0]^b[0]^cin;
assign c[0]=(a[0]&b[0])|(cin&(a[0]|b[0]));

assign s[1]=a[1]^b[1]^c[0];
assign c[1]=(a[1]&b[1])|(c[0]&(a[1]|b[1]));

assign s[2]=a[2]^b[2]^c[1];
assign c[2]=(a[2]&b[2])|(c[1]&(a[2]|b[2]));

assign s[3]=a[3]^b[3]^c[2];
assign cout=(a[3]&b[3])|(c[2]&(a[3]|b[3]));
endmodule
module rca_tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg cin;

	// Outputs
	wire [3:0] s;
	wire cout;

	// Instantiate the Design Under Test (DUT)
	rca dut (a,b,cin,s,cout
	);

	
		// Initialize Inputs
		initial a=4'b0000;
		initial b=4'b0000;
		initial cin=1'b0;
		
		always #20 a=a+4'b0001;
		always #20 b=b+4'b0001;
		always #20 cin=cin+1'b1;

endmodule

