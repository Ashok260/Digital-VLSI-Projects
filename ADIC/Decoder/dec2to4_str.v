module dec2to4_str(i,e,y
    );
	 input [1:0]i;
	 input e;
	 output [3:0]y;
	 wire w[2:1];
	 not n1(w[1],i[0]);
	 not n2(w[2],i[1]);
	 and n3(y[0],e,w[2],w[1]);
	 and n4(y[1],e,i[0],w[2]);
	 and n5(y[2],e,w[1],i[1]);
	 and n6(y[3],e,i[0],i[1]);
endmodule
module dec2to4_str_tb;

	// Inputs
	reg [1:0] i;
	reg e;

	// Outputs
	wire [3:0] y;

	// Instantiate the Design Under Test (DUT)
	dec2to4_str dut (i,e,y
	);

	initial begin
		// Initialize Inputs
	e=0;#100;
	e=1;
	i=2'b00;#200;
	i=2'b01;#200;
	i=2'b10;#200;
	i=2'b11;#200;
	end
      
endmodule

