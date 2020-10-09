/////////////////////////////////////////////
// dut.sv - 8-bit Ripple Carry Adder
//
// Author:  Chad Coates (crcoates@pdx.edu)
/////////////////////////////////////////////
module dut (
	input logic [7:0] ain, bin,
	input logic cin,
	output logic [7:0] sum,
	output logic cout
);

timeunit 1ns/1ns;

logic C1;

adder_4bits adder_4bits0 (.S(sum[3:0]), .C4(C1), .C0(cin), .A(ain[3:0]), .B(bin[3:0]));
adder_4bits adder_4bits1 (.S(sum[7:4]), .C4(cout), .C0(C1), .A(ain[7:4]), .B(bin[7:4]));

endmodule: dut
