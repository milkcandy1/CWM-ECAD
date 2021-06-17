//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

module top_tb(
	);

parameter CLK_PERIOD = 10; 

	reg clk;
	reg [4:0] temperature;
	reg err;
	wire heating;
	wire cooling;

	initial 
	begin
		clk = 1'b0;
	forever
		#(CLK_PERIOD/2) clk=~clk;
	end

	initial begin
		temperature=5'd5;
		err=0;

		forever begin
			#CLK_PERIOD

		if ((heating & (temperature>=5'd20))|(!heating & (temperature<=5'd18)))
			begin
			$display("***TEST FAILED! Wrong state!***", temperature, heating, cooling);
			err=1;
			end

		if ((cooling & (temperature<=5'd20))|(!cooling & (temperature>=5'd22))) 
			begin
			$display("***TEST FAILED! Wrong state!***", temperature, heating, cooling);
			err=1;
			end
	
	temperature = temperature+1'd1;
	if (temperature







