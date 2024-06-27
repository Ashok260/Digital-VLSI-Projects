module rca_16bit(a,b,cin,s,cout
    );
	 parameter size=16;
	 input [size-1:0]a,b;
	 input cin;
	 output [size-1:0]s;
	 output cout;
	 wire [size:0]c;
	 assign c[0]=cin;
	 genvar i;
	 generate 
	   for(i=0;i<size;i=i+1)
		  fad_str fnf(a[i],b[i],c[i],s[i],c[i+1]); 
	endgenerate
	assign cout=c[size];
endmodule
module rca_gen_tb;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg cin;

	// Outputs
	wire [15:0] s;
	wire cout;

	// Instantiate the Design Under Test (DUT)
	rca_16bit dut (a,b,cin,s,cout
	);

	initial cin=1'b0;
	initial b=16'b0000000000000000;
	initial a=16'b0000000000000000;
	always #1 cin=cin+1'b1;
	always #2 b=b+16'b0001000000100001;
	always #4 a=a+16'b0000010010000001;
      
endmodule

