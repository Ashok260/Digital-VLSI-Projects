module encoder4to2(i,e,y
    );
	 input [3:0]i;
	 input e;
	 output [1:0]y;
	 
	 or i1(y[1],i[3:2],e);
	 or i2(y[0],i[3],i[1],e);
	 


endmodule
module encoder2to4_tb;

	// Inputs
	reg [3:0] i;
	reg e;

	// Outputs
	wire [1:0] y;

	// Instantiate theDesign Under Test (DUT)
	encoder2to4 dut (i,e,y
	);

	initial begin
		// Initialize Inputs
		e=0;i=4'b0001;#100;
		e=0;i=4'b0010;#100;
		e=0;i=4'b0100;#100;
		e=1;i=4'b1000;#100;
		e=1;i=4'b0001;#100;
		e=1;i=4'b0010;#100;
		e=1;i=4'b0100;#100;
		e=1;i=4'b1000;#100;


	end
      
endmodule
