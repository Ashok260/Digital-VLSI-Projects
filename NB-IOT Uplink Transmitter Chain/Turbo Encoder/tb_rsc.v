`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:45:09 07/24/2024
// Design Name:   rsc_encoder
// Module Name:   D:/DSD_COURSE_project/start/tb_rsc.v
// Project Name:  start
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rsc_encoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_rsc;

	// Inputs
	reg clk;
	reg rst;
	reg [39:0] din;

	// Outputs
	wire [1:3] n;
	wire systematic_out;
	wire parity_out;
  integer i;
	// Instantiate the Unit Under Test (UUT)
	rsc_encoder uut (
		.clk(clk), 
		.rst(rst), 
		.din(din), 
		.systematic_out(systematic_out), 
		.parity_out(parity_out),
		.n(n)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		rst = 1;#3
		rst=0;
	end
	always #5 clk=~clk;
	initial begin
	  din=40'b0101010101010101010101010101010101010101;
    end  
endmodule

