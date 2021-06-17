//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////

module aircond (clk, temperature, heating, cooling);
input clk;
input [4:0] temperature;
output reg heating;
output reg cooling;

always @(posedge clk) 
	begin
	if ((temperature==5'd18)||(temperature<5'd18))
		begin 
		heating<=1'd1;
		cooling<=1'd0;
		end
	else if (temperature>=5'd20)
		heating<=1'd0;
	if (temperature>=5'd22)
		begin
		cooling<=1'd1;
		heating<=1'd0;
		end
	else if (temperature<=5'd20)
		cooling<=1'd0;
	end
endmodule 
