`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:10:42 07/24/2024 
// Design Name: 
// Module Name:    rsc_encoder 
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
module rsc_encoder(clk,rst,din,systematic_out,parity_out,n,done
    );
	 parameter K=40;
	 input clk,rst;
	 input [0:K-1]din;
	 wire [0:3]m;
	 integer i;
	 output reg systematic_out,parity_out;
	 output reg [1:3]n;
	 output reg done;
	 shift_register #(.K(K)) m0(clk,rst,din,m);
	 always @(posedge clk)
	  begin
	   if(rst)
		 begin
		  i<=-1;
		 end
		else
		 begin
		 i<=i+1;
		 if(i>=0 && i<K)begin
			parity_out<= m[0]^m[1]^m[3];
         systematic_out<=din[i];
			n<={m[1],m[2],m[3]};
			 end
			else begin
			 if(i==K)
			  begin
			   done<=1;
			  end
			end
		  end
		 end


	 


endmodule
