`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module svn_seg_decoder(
	output logic [6:0] seg_out,
	input logic [3:0] bcd_in,
	input logic display_on
	);

	       always_comb begin
                if(display_on == 0) begin
                        case(bcd_in)
                                4'b0000: seg_out = 7'b1111111;//0
                                4'b0001: seg_out = 7'b1111111;//1
                                4'b0010: seg_out = 7'b1111111;//2 
                                4'b0011: seg_out = 7'b1111111;//3
                                4'b0100: seg_out = 7'b1111111;//4
                                4'b0101: seg_out = 7'b1111111;//5
                                4'b0110: seg_out = 7'b1111111;//6
                                4'b0111: seg_out = 7'b1111111;//7
                                4'b1000: seg_out = 7'b1111111;//8
                                4'b1001: seg_out = 7'b1111111;//9
                                4'b1010: seg_out = 7'b1111111;//a
                                4'b1011: seg_out = 7'b1111111;//b
                                4'b1100: seg_out = 7'b1111111;//c
                                4'b1101: seg_out = 7'b1111111;//d
                                4'b1110: seg_out = 7'b1111111;//e
                                4'b1111: seg_out = 7'b1111111;//f
                        endcase
                end
                if(display_on == 1) begin
                        case(bcd_in)
                                4'b0000: seg_out = 7'b1000000;//0
                                4'b0001: seg_out = 7'b1111001;//1
                                4'b0010: seg_out = 7'b0100100;//2 
                                4'b0011: seg_out = 7'b0110000;//3
                                4'b0100: seg_out = 7'b0011001;//4
                                4'b0101: seg_out = 7'b0010010;//5
                                4'b0110: seg_out = 7'b0000010;//6
                                4'b0111: seg_out = 7'b1111000;//7
                                4'b1000: seg_out = 7'b0000000;//8
                                4'b1001: seg_out = 7'b0010000;//9
                                4'b1010: seg_out = 7'b0100000;//a
                                4'b1011: seg_out = 7'b0000011;//b
                                4'b1100: seg_out = 7'b1000110;//c
                                4'b1101: seg_out = 7'b0100001;//d
                                4'b1110: seg_out = 7'b0000110;//e
                                4'b1111: seg_out = 7'b0001110;//f
                        endcase
                end
        end

endmodule
