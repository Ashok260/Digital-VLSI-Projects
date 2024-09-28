`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:33:34 06/18/2024
// Design Name:   dmrs_all
// Module Name:   D:/DSD_COURSE_project/DMRS_ALL/tb_dmrs_all.v
// Project Name:  DMRS_ALL
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dmrs_all
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_dmrs_all;

	// Inputs
	reg clk,reset,dmrs_en;
	reg [3:0] Nsc;

	// Outputs
	wire [31:0] real_part;
	wire [31:0] img_part;
	wire dmrs_done;

	// Instantiate the Unit Under Test (UUT)
	dmrs_all uut (
		.clk(clk), 
		.reset(reset),
		.dmrs_en(dmrs_en),
		.Nsc(Nsc), 
		.real_part(real_part), 
		.img_part(img_part),
		.dmrs_done(dmrs_done)
	);
   always #5 clk=~clk;
	initial begin
		// Initialize Inputs
		clk = 1;
		reset=1;#3;
		reset=0;		
	end
	initial begin
	 Nsc=4'd12;
	 dmrs_en=0;#5;
	 dmrs_en=1;
	end
      
endmodule


