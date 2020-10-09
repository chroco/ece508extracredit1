/////////////////////////////////////////////////////////////
// tb_rca_8bits.sv - test bench for 8-bit Ripple Carry Adder
//
// Author:  Roy Kravitz (roy.kravitz@pdx.edu)
//
// Implements a test bench for an 8-bit
// Ripple Carry Adder.  Does not check all of the cases (would be 65K).
// Implements input timing delay specified for the problem
////////////////////////////////////////////////////////////
module tb_rca_8bits;

timeunit 1ns/1ns;

// stimulus/result for RCA
bit		[7:0]	ain, bin;		// A and B inputs to adder
bit				cin;			// carry in to adder
logic	[7:0]	sum;			// sum output from adder
logic			cout;			// carry out from the adder	

int i, j;						// loop indices

integer rsltsfile;

// instantiate the DUT
dut DUT (.*);

// set up monitor
initial begin : set_up_monitor
	$monitor($time, "\t\tA:%d\tB:%d\tCin:%b\t\t\Sum:%d\tCout:%b", ain, bin, cin, sum, cout);
end : set_up_monitor

// generate the stimulus/results
initial begin : stimulus
	$monitoroff;	// we'll use $display instead to cut back the amount of output to read through
	rsltsfile =$fopen("../results.txt");
	
	// do testing w/ carry in = 0
	$display("Test some cases with carry in = 0");
	$fdisplay(rsltsfile,"Test some cases with carry in = 0");
	for (i = 0; i < 8; i++) begin : carry_in_0
		ain = 'x;
		for (j = 16; j < 24; j++) begin
			cin = 'x;
			bin = 'x;
			ain = i;
			#1
			bin = j;
			cin = 0;
			#100;
		$display($time, "\t\tA:%d\tB:%d\tCin:%b\t\t\Sum:%d\tCout:%b", 
			ain, bin, cin, sum, cout);
		$fdisplay(rsltsfile, $time, "\t\tA:%d\tB:%d\tCin:%b\t\t\Sum:%d\tCout:%b", 
			ain, bin, cin, sum, cout);
		end
	end : carry_in_0
		
	// do testing w/ carry in = 1
	$display("Test some cases with carry in = 1");
	$fdisplay(rsltsfile,"Test some cases with carry in = 1");
	for (int i = 96; i < 105; i++) begin : carry_in_1
		ain = 'x;
		for (int j = 150; j < 160; j++) begin
			cin = 'x;
			bin = 'x;
			ain = i;
			#1;
			bin =  j;
			cin = 1;
			#100;
		$display($time, "\t\tA:%d\tB:%d\tCin:%b\t\t\Sum:%d\tCout:%b", 
			ain, bin, cin, sum, cout);
		$fdisplay(rsltsfile, $time, "\t\tA:%d\tB:%d\tCin:%b\t\t\Sum:%d\tCout:%b", 
			ain, bin, cin, sum, cout);
		end
	end : carry_in_1
	#5;
	$fclose(rsltsfile);
	$stop;
end : stimulus

endmodule : tb_rca_8bits


