
module encoder8to3(y,a);
input [7:0] y;
output [2:0]a;
assign a[2]=y[4]|y[5]|y[6]|y[7];
assign a[1]=y[3]|y[2]|y[6]|y[7];
assign a[0]=y[1]|y[3]|y[5]|y[7];


endmodule
module encoder8to3_tb;

	// Inputs
	reg [7:0] y;

	// Outputs
	wire [2:0] a;

	// Instantiate the Design Under Test (UDT)
	encoder8to3 dut (y,a
	);

	initial begin
		// Initialize Inputs
		y[7:0]=8'b00000001;#100;
		y[7:0]=8'b00000010;#100;
		y[7:0]=8'b00000100;#100;
		y[7:0]=8'b00001000;#100;
		y[7:0]=8'b00010000;#100;
		y[7:0]=8'b00100000;#100;
		y[7:0]=8'b01000000;#100;
		y[7:0]=8'b10000000;#100;

	end
      
endmodule

