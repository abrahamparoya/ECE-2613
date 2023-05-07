//
// lab4 : version 06/12/2020
// 
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module lab4_decoder(
	output logic [3:0] led,
	output logic [3:0] an,
	output logic [6:0] cathode,
	input logic [6:0] sw
	);

	// insert your code here
	logic [2:0] bad_bit;

	assign an = 4'b1110;

	svn_seg_decoder u_svn(.bcd_in({1'b0,bad_bit[2:0]}), .display_on(1'b1), .seg_out(cathode[6:0]));

	hamming7_4_decode u_hdcde(.h_code(sw[6:0]), .bad_bit, .decode(led[3:0]));

endmodule
