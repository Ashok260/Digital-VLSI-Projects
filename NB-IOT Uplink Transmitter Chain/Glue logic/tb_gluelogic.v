`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:24:38 06/13/2024
// Design Name:   glue_logic
// Module Name:   D:/DSD_COURSE_project/GLUELOGIC/tb_gluelogic.v
// Project Name:  GLUELOGIC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: glue_logic
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_gluelogic;

	// Inputs
	reg clk;
	reg reset;
	reg [4:0] ISC;

	// Outputs
	wire [31:0] out_rl0;
	wire [31:0] out_rl1;
	wire [31:0] out_rl2;
	wire [31:0] out_rl3;
	wire [31:0] out_rl4;
	wire [31:0] out_rl5;
	wire [31:0] out_rl6;
	wire [31:0] out_rl7;
	wire [31:0] out_rl8;
	wire [31:0] out_rl9;
	wire [31:0] out_rl10;
	wire [31:0] out_rl11;
	wire [31:0] out_img0;
	wire [31:0] out_img1;
	wire [31:0] out_img2;
	wire [31:0] out_img3;
	wire [31:0] out_img4;
	wire [31:0] out_img5;
	wire [31:0] out_img6;
	wire [31:0] out_img7;
	wire [31:0] out_img8;
	wire [31:0] out_img9;
	wire [31:0] out_img10;
	wire [31:0] out_img11;

	// Instantiate the Unit Under Test (UUT)
	glue_logic uut (
		.clk(clk), 
		.reset(reset), 
		.ISC(ISC), 
		.out_rl0(out_rl0), 
		.out_rl1(out_rl1), 
		.out_rl2(out_rl2), 
		.out_rl3(out_rl3), 
		.out_rl4(out_rl4), 
		.out_rl5(out_rl5), 
		.out_rl6(out_rl6), 
		.out_rl7(out_rl7), 
		.out_rl8(out_rl8), 
		.out_rl9(out_rl9), 
		.out_rl10(out_rl10), 
		.out_rl11(out_rl11), 
		.out_img0(out_img0), 
		.out_img1(out_img1), 
		.out_img2(out_img2), 
		.out_img3(out_img3), 
		.out_img4(out_img4), 
		.out_img5(out_img5), 
		.out_img6(out_img6), 
		.out_img7(out_img7), 
		.out_img8(out_img8), 
		.out_img9(out_img9), 
		.out_img10(out_img10), 
		.out_img11(out_img11)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		reset = 1;#3;
		reset=0;
		ISC = 5'd14;
	end
	  always #5 clk=~clk;

endmodule

