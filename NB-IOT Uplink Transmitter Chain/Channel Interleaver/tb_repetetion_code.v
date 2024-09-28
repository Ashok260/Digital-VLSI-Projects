`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:48:29 04/15/2024
// Design Name:   repetetion_code
// Module Name:   D:/DSD USING VERILOG/channelinterleaver/tb_repetetion_code.v
// Project Name:  channelinterleaver
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: repetetion_code
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_repetetion_code;

	// Inputs
	reg [0:15] a;
   reg reset,in_en,clk;
	// Outputs
	wire y;
	wire out_done;
   integer i;
	// Instantiate the Unit Under Test (UUT)
	repetetion_code uut (
	   .clk(clk),
		.reset(reset),
		.in_en(in_en),
		.a(a), 
		.y(y),
		.out_done(out_done)
	);

	initial begin
	 clk=1;
	 reset=1;#3;
	 reset=0;
	 in_en=1;
	 end
	always #5 clk=~clk;

	initial begin
      a=16'b1111111111111111;
		
		//$display("%h",y);
		//a=44'b11001100111100110011110011001111001100111100;
		#2000;$finish;
end
      
endmodule

