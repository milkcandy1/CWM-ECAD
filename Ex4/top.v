//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name: Tina	
// Date: 16/6/21
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a button is pressed, and stay the same when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

module lights (rst, clk, button, colour);

input rst;
input clk;
input button;
output reg [2:0] colour;

always @(posedge clk)
begin 
if (rst)
colour<=3'b000;
if (button & colour+3'b001)
colour<=colour+3'b001;
else if ((button & colour==3'b110)|(button & colour==3'b111))
colour<=3'b001;
end

endmodule

