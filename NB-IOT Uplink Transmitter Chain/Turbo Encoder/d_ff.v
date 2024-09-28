`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:40:38 07/24/2024 
// Design Name: 
// Module Name:    d_ff 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module d_ff(clk,rst,din,q
    );
	 input din;
	 input clk,rst;
	 output reg q;
	 always @(posedge clk)
	  begin
	   if(rst==1'b1)
		 begin
		  q<=0;
		 end
		else
		 begin
		  q<=din;
		 end
	  end
endmodule
