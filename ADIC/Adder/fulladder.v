module fulladder(a,b,cin,s,cout
    );
	 input a,b,cin;
	 output s,cout;
	 function sum;
	  input x,y,z;
      begin
	     sum=x^y^z;
	   end
	 endfunction
	 function carry;
	  input x,y,z;
      begin
	     carry=x&y|y&z|z&x;
	   end
	 endfunction
	 assign s=sum(a,b,cin);
	 assign cout=carry(a,b,cin);
endmodule


module fa_tb;

	// Inputs
	reg a;
	reg b;
	reg cin;

	// Outputs
	wire s;
	wire cout;

	// Instantiate the Design Under Test (DUT)
	fulladder dut (a,b,cin,s,cout
	);
	initial cin=1'b0;
	initial b=1'b0;
	initial a=1'b0;
	always #10 cin=cin+1'b1;
	always #20 b=b+1'b1;
	always #40 a=a+1'b1;

endmodule

