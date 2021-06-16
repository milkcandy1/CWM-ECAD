//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name: Tina 	
// Date: 16/6/21
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
reg clk;
reg rst;
reg change;
reg on_off;
reg err;
wire [7:0] counter_out;
reg [7:0] a;

//Todo: Clock generation
initial 
begin
clk = 1'b0;
forever 
#(CLK_PERIODS/2) clk=~clk;
end

//Todo: User logic
initial begin
rst=1;
chsnge=1;
on_off=0;
err=0;

#(CLK_PERIOD)
if (rst&(counter_out!=0))
begin
$display("***TEST FAILED! did not count correctly! Error line 46*** %h, %h, %h, %h", rst, change, on_off, counter_out);
err=1;
end

if (counter_out>=256'd256)
begin
%display("***TEST FAILED! did not count correctly!Error line 87*** %h, %h, %h, %h", rst, change, on_off, counter_out);
err=1;
end
end
end

    
//Todo: Finish test, check for success
initial begin
#(500*CLK_PERIOD)
if (err==0)
$display("***TEST PASSED!***")
$finish;
end

//Todo: Instantiate counter module
or monitor1 (
.rst (rst),
.change (change),
.on_off (on_off),
.clk (clk),
.counter_out (counter_out)
);

endmodule 
