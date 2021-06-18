//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - RGB Colour Converter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - RGB Colour Converter
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

module top_tb(
    );
    
//Todo: Parameters
	parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
	reg clk;
	reg [2:0] colour;
	reg enable;
	reg err;
	wire [23:0] rgb;
	reg [23:0] a;
	
//Todo: Clock generation
	initial
	begin
		clk = 1'b0;
	forever
		#(CLK_PERIOD/2) clk=~clk;
	end

//Todo: User logic
	initial begin
		colour=0;
		err=0;
		enable=0;
		
		
		a=rgb;
		#(CLK_PERIOD*2)
		if (rgb!=a)
			begin
			$display("***TEST FAILED! Wrong colour!*** %h, %h, %h, %h", colour, enable, rgb, a);
			err=1;
			end
		enable=1;
		
				
		forever begin
			#(CLK_PERIOD*2)
			a=rgb;
			colour=colour+1;
			
			if (enable)
				begin
				#(CLK_PERIOD*10)
					if (rgb==a)
					begin
					$display("***TEST FAILED! Wrong colour!*** %h, %h, %h, %h", colour, enable, rgb, a);
					err=1;
					end
				end
			
		end
	end


//Todo: Finish test, check for success
	initial begin
	#(500*CLK_PERIOD)
        if (err==0)
          $display("***TEST PASSED!***");
        $finish;
      end
      
//Todo: Instantiate counter module
	converter converter1 ( 
	.clk (clk),
	.enable (enable),
	.colour (colour),
	.rgb (rgb)
	);
 
endmodule 
