`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:05:10 07/28/2024 
// Design Name: 
// Module Name:    turboencoder 
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
module turboencoder(clk,rst,din,sys_rsc1,par_rsc1,par_rsc2,systematic_rsc1,parity_rsc1,parity_rsc2);
	 parameter K=40;
	 input clk,rst;
	 input [0:K-1]din;
	 output reg sys_rsc1;
	 output reg par_rsc1;
	 output reg par_rsc2;
	output wire systematic_rsc1;
	output  wire parity_rsc1;
	 output wire parity_rsc2;
	 wire [1:3]m,n;
	 wire done1,done2;
	 wire systematic_rsc2;
	 wire [0:K-1]data;
	 reg [0:11]tail_bits;
	 integer i=0;
    rsc_encoder #(.K(K)) rsc1(clk,rst,din,systematic_rsc1,parity_rsc1,m,done1);
	 turbo_interleaver #(.K(K))interleaver(din,data);
    rsc_encoder #(.K(K)) rsc2(clk,rst,data,systematic_rsc2,parity_rsc2,n,done2);
always @(posedge clk)
 begin
  if(done1==1'b1 && done2==1'b1)
   begin
	if(i<4)
	begin
	 compute_tail_bits(m,n,tail_bits);
	 sys_rsc1<=tail_bits[i];
	 par_rsc1<=tail_bits[i+4];
	 par_rsc2<=tail_bits[i+8];
	 i=i+1;
	end	 
	end
	else begin
	 sys_rsc1<=systematic_rsc1;
	 par_rsc1<=parity_rsc1;
	 par_rsc2<=parity_rsc2;
	 end
 end
    task compute_tail_bits;
        input [1:3] m, n;
        output reg [0:11] tail_bits;
        begin
            case(m)
                3'b000: begin
                    case(n)
                        3'b000: tail_bits = 12'b000000000000;
                        3'b001: tail_bits = 12'b000000000001;
                        3'b010: tail_bits = 12'b000000000010;
                        3'b011: tail_bits = 12'b000000000011;
                        3'b100: tail_bits = 12'b000000000100;
                        3'b101: tail_bits = 12'b000000000101;
                        3'b110: tail_bits = 12'b000000000110;
                        3'b111: tail_bits = 12'b000000000111;
                        default: tail_bits = 12'b000000000000;
                    endcase
                end
                3'b001: begin
                    case(n)
                        3'b000: tail_bits = 12'b000000001000;
                        3'b001: tail_bits = 12'b000000001001;
                        3'b010: tail_bits = 12'b000000001010;
                        3'b011: tail_bits = 12'b000000001011;
                        3'b100: tail_bits = 12'b000000001100;
                        3'b101: tail_bits = 12'b000000001101;
                        3'b110: tail_bits = 12'b000000001110;
                        3'b111: tail_bits = 12'b000000001111;
                        default: tail_bits = 12'b000000000000;
                    endcase
                end
                3'b010: begin
                    case(n)
                        3'b000: tail_bits = 12'b000000010000;
                        3'b001: tail_bits = 12'b000000010001;
                        3'b010: tail_bits = 12'b000000010010;
                        3'b011: tail_bits = 12'b000000010011;
                        3'b100: tail_bits = 12'b000000010100;
                        3'b101: tail_bits = 12'b000000010101;
                        3'b110: tail_bits = 12'b000000010110;
                        3'b111: tail_bits = 12'b000000010111;
                        default: tail_bits = 12'b000000000000;
                    endcase
                end
                3'b011: begin
                    case(n)
                        3'b000: tail_bits = 12'b000000011000;
                        3'b001: tail_bits = 12'b000000011001;
                        3'b010: tail_bits = 12'b000000011010;
                        3'b011: tail_bits = 12'b101010100000;
                        3'b100: tail_bits = 12'b000000011100;
                        3'b101: tail_bits = 12'b000000011101;
                        3'b110: tail_bits = 12'b000000011110;
                        3'b111: tail_bits = 12'b000000011111;
                        default: tail_bits = 12'b000000000000;
                    endcase
                end
                3'b100: begin
                    case(n)
                        3'b000: tail_bits = 12'b000000100000;
                        3'b001: tail_bits = 12'b000000100001;
                        3'b010: tail_bits = 12'b000000100010;
                        3'b011: tail_bits = 12'b000000100011;
                        3'b100: tail_bits = 12'b000000100100;
                        3'b101: tail_bits = 12'b000000100101;
                        3'b110: tail_bits = 12'b000000100110;
                        3'b111: tail_bits = 12'b000000100111;
                        default: tail_bits = 12'b000000000000;
                    endcase
                end
                3'b101: begin
                    case(n)
                        3'b000: tail_bits = 12'b000000101000;
                        3'b001: tail_bits = 12'b000000101001;
                        3'b010: tail_bits = 12'b000000101010;
                        3'b011: tail_bits = 12'b000000101011;
                        3'b100: tail_bits = 12'b000000101100;
                        3'b101: tail_bits = 12'b000000101101;
                        3'b110: tail_bits = 12'b000000101110;
                        3'b111: tail_bits = 12'b000000101111;
                        default: tail_bits = 12'b000000000000;
                    endcase
                end
                3'b110: begin
                    case(n)
                        3'b000: tail_bits = 12'b000000110000;
                        3'b001: tail_bits = 12'b000000110001;
                        3'b010: tail_bits = 12'b000000110010;
                        3'b011: tail_bits = 12'b000000110011;
                        3'b100: tail_bits = 12'b000000110100;
                        3'b101: tail_bits = 12'b000000110101;
                        3'b110: tail_bits = 12'b000000110110;
                        3'b111: tail_bits = 12'b000000110111;
                        default: tail_bits = 12'b000000000000;
                    endcase
                end
                3'b111: begin
                    case(n)
                        3'b000: tail_bits = 12'b000000111000;
                        3'b001: tail_bits = 12'b000000111001;
                        3'b010: tail_bits = 12'b000000111010;
                        3'b011: tail_bits = 12'b000000111011;
                        3'b100: tail_bits = 12'b000000111100;
                        3'b101: tail_bits = 12'b000000111101;
                        3'b110: tail_bits = 12'b000000111110;
                        3'b111: tail_bits = 12'b000000111111;
                        default: tail_bits = 12'b000000000000;
                    endcase
                end
                default: tail_bits = 12'b000000000000;
            endcase
        end
    endtask

endmodule
