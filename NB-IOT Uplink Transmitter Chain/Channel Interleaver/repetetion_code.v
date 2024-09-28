`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:46:08 04/15/2024 
// Design Name: 
// Module Name:    repetetion_code 
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
module repetetion_code(clk,reset,in_en,a,y,out_done
    );
	 parameter N_sym=7;
   parameter N_sc = 1;         // Number of subcarriers
   parameter N_ru = 1;          // Number of consecutive subcarriers in a resource unit
   parameter Qm = 2;            // Modulation order
   parameter n_slots = 2;       // Number of slots
   parameter n_col = (N_sym-1) * n_slots; // Number of columns
   parameter n_row = N_sc * N_ru * Qm;         // Number of rows
   parameter total_bits=n_row*n_col;
   input [0:15]a;
	input clk,reset,in_en;
	output reg out_done;
	reg [1:0]store_done;
   reg [0:total_bits-1]y1;
	output reg y;
   reg [0:0] a1[n_row-1:0][n_col-1:0];
   integer i,j,k;
   integer n;
  always @(posedge clk)
      if(reset)
		 begin
		  i=0;
		  j=0;
		  k=0;
		  n=0;
        store_done=0;
		  out_done=0;
		 end
		else
		begin
		 if(in_en==1'b1)begin
		   if(store_done==2'b00)
		   begin//Storing row wise
		    if(n<15)
			  begin
			   if(j<=n_col-1)
				 begin
				  a1[i][j]=a[n];
				  n=n+1;
				  j=j+1;
				  if(j>n_col-1)
				   begin
					 j=0;
					 i=i+1;
					 /*if(i==216)
					   begin
						  i=0;
						  j=0;
						  n=0;
						  en=2'b01;
						 end */
					end
				end
					 
		  end
		  else begin
			   if(j<=n_col-1)
				 begin
				  a1[i][j]=0;
				  n=n+1;
				  j=j+1;
				  if(j>n_col-1)
				   begin
					 j=0;
					 i=i+1;
					 if(i==n_row)
					   begin
						  i=0;
						  j=0;
						  n=0;
						  store_done=2'b01;
						 end
					end
				end

		  end
		 end
		 else if(store_done==2'b01)
		  begin // reading columnwise
		    if(n<total_bits)
			  begin
			   if(i<=n_row-1)
				 begin
				  y1[n]=a1[i][j];
				  y=y1[n];
				  n=n+1;
				  i=i+1;
				  if(i==n_row)
				   begin
					 i=0;
					 j=j+1;
					 if(j==n_col)
					   begin
						  i=0;
						  j=0;
						  n=0;
						  out_done=1'b1;
						  store_done=2'b10;
						 end
					end
				end
		   
		  end
		  end
		 else
		  begin
          $display("Matrix a1:");
          for (i = 0; i < n_row; i = i + 1) begin
            for (j = 0; j < n_col; j = j + 1) begin
              $write("%b ", a1[i][j]);
             end
            $display(""); // Newline after each row
           end
          $display("Matrix y:");
          for (i = 0; i < total_bits; i = i + 1) begin
            $write("%b ", y1[i]);
          end		   
		  end
		 
		 end
end


endmodule
