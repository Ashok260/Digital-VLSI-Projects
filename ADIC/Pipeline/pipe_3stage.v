module pipe_3stage (F, A, B, C, D, clk);
parameter N = 10;
input [N-1:0] A, B, C, D;
input clk;
output [N-1:0] F;
reg [N-1:0] L12_x1, L12_x2, L12_D, L23_x3, L23_D, L34_F;
assign F = L34_F;
always @(posedge clk) // stage 1 
begin
L12_x1 <= #4 A + B;
L12_x2 <= #4 C - D;
L12_D <= D; 
end

always @(posedge clk) // STAGE 2
begin
L23_x3 <= #4 L12_x1 + L12_x2;
L23_D <= L12_D; 
end

always @(posedge clk) // STAGE 3
L34_F <= #6 L23_x3 * L23_D; 
endmodule




module pipe_3stage_test;
parameter N = 10;
wire [N-1:0] F;
reg [N-1:0] A, B, C, D;
reg clk;
pipe_3stage PIPE1 (F, A, B, C, D, clk);
initial clk = 0;
always #10 clk = ~clk;

initial
begin
#5 A = 11; B = 12; C = 13; D = 3; // F = 99 
#20 A = 10; B = 10; C = 5; D = 10; // F =150
#20 A = 2; B = 2; C = 2; D = 4; // F = 8
#20 A = 15; B = 10; C = 8; D = 2; // F = 62 
#20 A = 8; B = 15; C = 5; D = 0; // F = 0 
#20 A = 10; B = 20; C = 5; D = 3; // F = 66 
#20 A = 10; B = 10; C = 30; D = 1; // F = 49 
#20 A = 30; B = 1; C = 2; D = 4; // F = 116 
end
initial
begin
$dumpfile ("pipe_3stage.vcd");
$dumpvars (0, pipe_3stage_test);
$monitor ($time,":F = %d", F);
#300 $finish;
end
endmodule
