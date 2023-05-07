`timescale 1ns / 1ps

module display_driver( output logic [6:0] cathode, output logic [3:0] anode,
    output logic [1:0] anode_sel,
    input logic [3:0] digit3, input logic [3:0] digit2, input logic [3:0] digit1,
    input logic [3:0] digit0, input logic display_on, input logic rst, input logic clk);
 
    // internal signals
    logic [3:0] bcd_in; // output of mux, input to seven segment decoder
 
    // digit multiplexer
    always @ (digit0, digit1, digit2, digit3, anode_sel, bcd_in) begin
        case({anode_sel})
        2'b00:
            bcd_in = digit0;
        2'b01:
            bcd_in = digit1;
        2'b10:
            bcd_in = digit2;
        2'b11:
            bcd_in = digit3;
        endcase
    end
 
    // instantiate the modules
    svn_seg_decoder u_sd(.bcd_in(bcd_in),.seg_out(cathode[6:0]),.display_on(display_on));
    anode_decoder u_ad(.switch_in(anode_sel[1:0]), .anode(anode[3:0]));
    d_counter u_dc(.rst(rst), .clk(clk), .ms_bits(anode_sel[1:0]));
 
endmodule
