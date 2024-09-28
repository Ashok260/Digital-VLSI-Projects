`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:34:31 06/13/2024 
// Design Name: 
// Module Name:    glue_logic 
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
module glue_logic(clk,reset,ISC,out_rl0,out_rl1,out_rl2,out_rl3,out_rl4,out_rl5,out_rl6,out_rl7,out_rl8,out_rl9,
                  out_rl10,out_rl11,out_img0,out_img1,out_img2,out_img3,out_img4,out_img5,out_img6,out_img7,
						out_img8,out_img9,out_img10,out_img11);
	 input clk,reset;
	 input [4:0]ISC;
	 reg [31:0] rl [0:1295];
	 reg [31:0] img [0:1295];
	 initial $readmemb("in1.txt",rl);
	 initial $readmemb("in2.txt",img);
	 output reg [31:0]out_rl0,out_rl1,out_rl2,out_rl3,out_rl4,out_rl5,out_rl6,out_rl7,out_rl8,out_rl9,out_rl10,out_rl11;
	 output reg [31:0]out_img0,out_img1,out_img2,out_img3,out_img4,out_img5,out_img6,out_img7,out_img8,out_img9,out_img10,out_img11;
	 integer pc=0;
    always @(posedge clk)
	  begin
	   if(reset)
		  begin
		    out_rl0<=0;out_rl1<=0;out_rl2<=0;out_rl3<=0;out_rl4<=0;out_rl5<=0;out_rl6<=0;out_rl7<=0;out_rl8<=0;
			 out_rl9<=0;out_rl10<=0;out_rl11<=0;
			 out_img0<=0;out_img1<=0;out_img2<=0;out_img3<=0;out_img4<=0;out_img5<=0;out_img6<=0;out_img7<=0;
			 out_img8<=0;out_img9<=0;out_img10<=0;out_img11<=0;
			 pc<=0;
		  end
		else begin
			       case(ISC)
					    5'd0:begin
			                  out_rl0<=rl[pc];
								   out_img0<=img[pc];
								   pc<=pc+1;
						       end
					    5'd1:begin
						         out_rl1<=rl[pc];
									out_img1<=img[pc];
									pc<=pc+1;
						       end
					    5'd2:begin
						         out_rl2<=rl[pc];
									out_img2<=img[pc];
									pc<=pc+1;
						       end
					    5'd3:begin
						         out_rl3<=rl[pc];
									out_img3<=img[pc];
									pc<=pc+1;
						       end
					    5'd4:begin
						         out_rl4<=rl[pc];
									out_img4<=img[pc];
									pc<=pc+1;
						       end
					    5'd5:begin
						         out_rl5<=rl[pc];
									out_img5<=img[pc];
									pc<=pc+1;
						       end
					    5'd6:begin
						         out_rl6<=rl[pc];
									out_img6<=img[pc];
									pc<=pc+1;
						       end
					    5'd7:begin
						         out_rl7<=rl[pc];
									out_img7<=img[pc];
									pc<=pc+1;
						       end
					    5'd8:begin
						         out_rl8<=rl[pc];
									out_img8<=img[pc];
									pc<=pc+1;
						       end
					    5'd9:begin
						         out_rl9<=rl[pc];
									out_img9<=img[pc];
									pc<=pc+1;
						       end
					    5'd10:begin
						         out_rl10<=rl[pc];
									out_img10<=img[pc];
									pc<=pc+1;
						      end
					    5'd11:begin
						         out_rl11<=rl[pc];
									out_img11<=img[pc];
									pc<=pc+1;
						        end
						  5'd12:begin
						          out_rl0<=rl[pc];
									 out_img0<=img[pc];
									 out_rl1<=rl[pc+1];
									 out_img1<=img[pc+1];
									 out_rl2<=rl[pc+2];
									 out_img2<=img[pc+2];
									 pc<=pc+3;
						        end
						  5'd13:begin
						          out_rl3<=rl[pc];
									 out_img3<=img[pc];
									 out_rl4<=rl[pc+1];
									 out_img4<=img[pc+1];
									 out_rl5<=rl[pc+2];
									 out_img5<=img[pc+2];
									 pc<=pc+3;
						        end
						  5'd14:begin
						          out_rl6<=rl[pc];
									 out_img6<=img[pc];
									 out_rl7<=rl[pc+1];
									 out_img7<=img[pc+1];
									 out_rl8<=rl[pc+2];
									 out_img8<=img[pc+2];
									 pc<=pc+3;
						        end
						  5'd15:begin
						          out_rl9<=rl[pc];
									 out_img9<=img[pc];
									 out_rl10<=rl[pc+1];
									 out_img10<=img[pc+1];
						   		 out_rl11<=rl[pc+2];
									 out_img11<=img[pc+2];
									 pc<=pc+3;
						         end

					      5'd16:begin
						           out_rl0<=rl[pc];
									  out_img0<=img[pc];
									  out_rl1<=rl[pc+1];
									  out_img1<=img[pc+1];
									  out_rl2<=rl[pc+2];
									  out_img2<=img[pc+2];
						           out_rl3<=rl[pc+3];
									  out_img3<=img[pc+3];
									  out_rl4<=rl[pc+4];
									  out_img4<=img[pc+4];
									  out_rl5<=rl[pc+5];
									  out_img5<=img[pc+5];
									  pc<=pc+6;
					            end
					      5'd17:begin
						           out_rl6<=rl[pc];
									  out_img6<=img[pc];
									  out_rl7<=rl[pc+1];
									  out_img7<=img[pc+1];
									  out_rl8<=rl[pc+2];
									  out_img8<=img[pc+2];
						           out_rl9<=rl[pc+3];
									  out_img9<=img[pc+3];
									  out_rl10<=rl[pc+4];
									  out_img10<=img[pc+4];
									  out_rl11<=rl[pc+5];
									  out_img11<=img[pc+5];
                             pc<=pc+6;
						         end								  
					      5'd18:begin
						            out_rl0<=rl[pc];
										out_img0<=img[pc];
										out_rl1<=rl[pc+1];
										out_img1<=img[pc+1];
										out_rl2<=rl[pc+2];
										out_img2<=img[pc+2];
						            out_rl3<=rl[pc+3];
										out_img3<=img[pc+3];
										out_rl4<=rl[pc+4];
										out_img4<=img[pc+4];
										out_rl5<=rl[pc+5];
										out_img5<=img[pc+5];
						            out_rl6<=rl[pc+6];
										out_img6<=img[pc+6];
										out_rl7<=rl[pc+7];
										out_img7<=img[pc+7];
										out_rl8<=rl[pc+8];
										out_img8<=img[pc+8];
						            out_rl9<=rl[pc+9];
										out_img9<=img[pc+9];
										out_rl10<=rl[pc+10];
										out_img10<=img[pc+10];
										out_rl11<=rl[pc+11];
										out_img11<=img[pc+11];
                              pc<=pc+12;
									  end
				        default:begin
		                        out_rl0<=0;out_rl1<=0;out_rl2<=0;out_rl3<=0;out_rl4<=0;
					               out_rl5<=0;out_rl6<=0;out_rl7<=0;out_rl8<=0;
			                     out_rl9<=0;out_rl10<=0;out_rl11<=0;
			                     out_img0<=0;out_img1<=0;out_img2<=0;out_img3<=0;out_img4<=0;
					               out_img5<=0;out_img6<=0;out_img7<=0;
			                     out_img8<=0;out_img9<=0;out_img10<=0;out_img11<=0;
		                       end
             endcase	
          end				 
		end    

endmodule


