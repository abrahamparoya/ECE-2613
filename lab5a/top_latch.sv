`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module top_latch (output logic qa, output logic qb, output logic q_lvl,
	output logic q_latch, output logic q_ff,
	input logic s, input logic r, input logic d, input logic ck);

	sr_latch u_sr(.s(s), .r(r), .qa(qa), .qb(qb));
	lvl_sen_sr_latch u_lvl(.s(s), .c(ck), .r(r), .q(q_lvl));
	transparent_d_latch u_tra(.d(d), .c(ck), .q(q_latch));
	d_flip_flop u_diff(.d(d), .clk(ck), .q(q_ff));

endmodule
