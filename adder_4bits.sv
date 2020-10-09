/////////////////////////////////////////////
// adder_4bits.sv - 4 bit adder 
//
// Author:  Chad Coates (crcoates@pdx.edu)
/////////////////////////////////////////////
module adder_4bits (
	input logic [3:0] A, B,
	input logic C0,
	output logic [3:0] S,
	output logic C4
);

timeunit 1ns/1ns;

// internal variables
logic C1, C2, C3;

// instantiate and connect four FA's

fa fa0 (.S(S[0]), .Cout(C1), .Cin(C0), .A(A[0]), .B(B[0])); 
fa fa1 (.S(S[1]), .Cout(C2), .Cin(C1), .A(A[1]), .B(B[1])); 
fa fa2 (.S(S[2]), .Cout(C3), .Cin(C2), .A(A[2]), .B(B[2])); 
fa fa3 (.S(S[3]), .Cout(C4), .Cin(C3), .A(A[3]), .B(B[3])); 

endmodule: adder_4bits
