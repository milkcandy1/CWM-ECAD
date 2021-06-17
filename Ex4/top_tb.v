//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name: Tina Mu	
// Date: 16/6/21
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

module top_tb(
	); 

	parameter CLK_PEROID = 10;

//registers 

	reg clk;
	reg rst;
	reg button;
	reg err;
	wire [2:0] colour; 
	reg [2:0] a;

//clock generation 

	initial 
	begin 
		clk = 1'b0;
	forever 
		#(CLK_PERIOD/2) clk=~clk;
	end

//logic 
	
	initial begin
		rst=1;
		button=0;
		err=0;
		#CLK_PERIOD
		if ((colour!=3'b000)&rst)
			begin 
			$display("***TEST FAILED! Wrong colour***", rst, button,colour);
			err=1;
			end
		rst=0;

forever begin
	#CLK_PERIOD
	button=1;
	#CLK_PERIOD

	if (button & colour<3'b110)
		begin
		a=colour;
		#CLK_PERIOD
		if (colour!=a+3'b001)
			begin
			$display("***TEST FAILED! Wrong colour***", rst, button, colour);
			err=1; 
			end
		end

	else if (button & (colour==3'b110 | colour == 3'b111))
		begin
		#CLK_PERIOD
		if (colour!=3'b110)
			begin
			$display("***TEST FAILED! Wrong colour***", rst, button, colour);
		err=1;
		end
	end

if (!button)
	begin
	a=colour;
	#CLK_PERIOD
	if (colour!=a)
		begin
		$display("***TEST FAILED! Wrong colour***", rst, button, colour);
		err=1;
		end
	end

	if (colour>=3'b111)
		begin
		$display("***TEST FAILED! Wrong colour!***", rst, button, colour);
		err=1;
		end
	end
end

//check

initial begin 
#(500*CLK_PERIOD)
if (err==0)
$display("***TEST PASSED!***");
$finish;
end

//counter module
	lights lights1 (
	.rst (rst)
	.clk (clk)
	.button (button)
	colour (colour)
	);

endmodule


