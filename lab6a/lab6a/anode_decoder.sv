`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module anode_decoder(
	output logic [3:0] anode,
	input logic [1:0] switch_in
	);

		always @* begin

		case(switch_in[1:0])
			2'b00: anode[3:0] = 4'b1110; //AN0
			2'b01: anode[3:0] = 4'b1101; //AN1
			2'b10: anode[3:0] = 4'b1011; //AN2
			2'b11: anode[3:0] = 4'b0111; //AN3
		endcase
	end

endmodule
