`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module lab3_top_io_wrapper(
	output logic [3:0] an,
	output logic [6:0] seg,
	input logic [10:0] sw
	);

	//assign seg[6:0] = sw[6:0];
	//assign an[3:0] = sw[10:7];
	 

	lab3_decoder u1(.sw(sw[6:0]), .an(an), .cathode(seg));

	

endmodule