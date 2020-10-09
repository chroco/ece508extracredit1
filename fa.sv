/////////////////////////////////////////////
// fa.sv - Single bit full adder 
//
// Author:  Chad Coates (crcoates@pdx.edu)
/////////////////////////////////////////////
module fa (
	input logic A, B, Cin,	// a, b, and carry_in inputs
	output logic S, Cout	// sum and carry out outputs 
);

timeunit 1ns/1ns;

xor xor1 (x1out, A, B);
xor xor2 (S, x1out, Cin);
and and1 (a1out, x1out, Cin);
and and2 (a2out, A, B);
or or1 (Cout, a1out, a2out);

endmodule : fa

