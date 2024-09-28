`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:59:24 07/24/2024
// Design Name:   shift_register
// Module Name:   D:/DSD_COURSE_project/start/tb_shift_register.v
// Project Name:  start
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shift_register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_shift_register;

	// Inputs
	reg clk;
	reg rst;
	reg [39:0]din;

	// Outputs
	wire [0:3] m;
   integer i;
	// Instantiate the Unit Under Test (UUT)
	shift_register uut (
		.clk(clk), 
		.rst(rst), 
		.din(din), 
		.m(m)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		rst = 1;#3
		rst=0;
	end
	always #5 clk=~clk;
	initial begin
	  #8;din=40'b0101010101010101010101010101010101010101;
		end
      
endmodule

