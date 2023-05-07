`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module lab3_decoder(
	output logic [3:0] an,
	output logic [6:0] cathode,
	input logic [6:0] sw
	);

	// instantiate two outputs from the class presentation, double check with your TA for the values 
	    anode_decoder u_ad(.switch_in(sw[5:4]), .anode(an[3:0]));
   	 	svn_seg_decoder u_svn(.bcd_in(sw[3:0]), .display_on(sw[6]), .seg_out(cathode[6:0]));

endmodule
