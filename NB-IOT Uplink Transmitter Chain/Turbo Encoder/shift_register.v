`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:50:30 07/24/2024 
// Design Name: 
// Module Name:    shift_register 
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
module shift_register(clk,rst,din,m
    );
	 parameter K=40;
	 input clk,rst;
	 input [0:K-1]din;
	 output reg [0:3]m;
    integer i;
	 always @(posedge clk)
	  begin
	   if(rst)
		 begin
		  m<=0;
		  i<=0;
		 end
		else
		 begin
		 if(i<K)begin
        m<={m[1:3],m[0]};
		  m[0]<=m[3]^m[2]^din[i];
		  i<=i+1;
		  end
		 end
	  end

 endmodule
