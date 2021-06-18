`timescale 1ns / 100ps

module doorbell(
	//Todo: define inputs here
	input [23:0] a,
	input [23:0] b, 
	input sel,
	output [23:0] out
	); 
	//Todo: define registers and wires here
	wire a;
	wire b;
	wire sel;
	reg out;


	//Todo: define your logic here                 
	assign #5 out = sel?b:a;


endmodule
