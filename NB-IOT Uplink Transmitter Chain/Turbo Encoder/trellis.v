`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:00:59 07/30/2024 
// Design Name: 
// Module Name:    trellis 
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
module trellis(done,m,n,tail_bits
    );
	 input [0:1]done;
	 input [1:3]m,n;
	 output [0:11]tail_bits;
	 reg [1:3]m1;
	 reg [1:3]n1;
	 reg [1:6]tail1;
	 reg [1:6]tail2;
	 genvar i;
	 generate 
	 for(i=0;i<3;i=i+1)
	  begin :l1
	  always @(*)
	  begin
	   if(done==2'b11)begin
	   n1[3]=n1[2];
		n1[2]=n1[1];
		n1[1]=1'b0;
		tail1[i+1]=n1[3]^n1[2];
		tail1[i+4]=n1[1]^n1[3];
	   m1[3]=m1[2];
		m1[2]=m1[1];
		m1[1]=1'b0;
		tail2[i+1]=m1[3]^m1[2];
		tail2[i+4]=m1[1]^m1[3];
		end
		else
		 begin
	   n1[3]=n[3];
		n1[2]=n[2];
		n1[1]=n[1];
	   m1[3]=m[3];
		m1[2]=m[2];
		m1[1]=m[1];

		 end
	  end
	  end
	 endgenerate
assign tail_bits={tail1[1],tail2[2],tail1[4],tail2[5],
                  tail2[1],tail1[3],tail2[4],tail1[6],
						tail1[2],tail2[3],tail1[5],tail2[6]};

endmodule
