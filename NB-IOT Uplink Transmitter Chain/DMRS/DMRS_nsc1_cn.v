`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:39:05 05/18/2024 
// Design Name: 
// Module Name:    DMRS_nsc1 
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
module DMRS_nsc1_cn(clk,reset,c
    );
	 parameter RUNsc=1;
	 parameter ULNslots=16;
	 parameter NRU=10;
	 parameter Mrep=128;
	 parameter Mpn=Mrep * ULNslots * NRU;//Length of final sequence c(n)
	 parameter Nc=1600;
	 integer i,j=0;
	 input clk,reset;
	 output reg[0:Mpn-1]c;
	 reg[0:Nc+Mpn-1]x1,x2;
	 reg [0:30]x1_init=31'b1000000000000000000000000000000,x2_init=31'b1100010000000000000000000000000;
	 initial x1[0:30]=x1_init;
	 initial x2[0:30]=x2_init;
	always @(posedge clk)begin
	 if(reset==1'b0) begin
	   for(i=0;i<Mpn+Nc;i=i+1)
		 begin
		  x1[i+31]=(x1[i+3]+x1[i])%2;
	    end
		 // $display("%d : X1=%b ",i,x1);

	   for(i=0;i<Mpn+Nc;i=i+1)
		 begin
		  x2[i+31]=(x2[i+3]+x2[i+2]+x2[i+1]+x2[i])%2;
	    end
		 // $display("%d : X2=%b ",i,x2);
	  for(j=0;j<Mpn;j=j+1)begin
	   c[j]= (x1[j+Nc] + x2[j+Nc])%2;
		end
		 // $display("%d : c=%b ",j,c);

	 end
	 end
endmodule

