`timescale 1ns / 100ps

module doorbell(
	//Todo: define inputs here
	input a,
	input b, 
	input sel,
	output [23:0] out
	); 
	//Todo: define registers and wires here
	wire [23:0] out;
	wire [23:0] a;
	wire [23:0] b;
	wire sel;


	//Todo: define your logic here                 
	assign #5 out = sel?b:a;


endmodule
