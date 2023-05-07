`timescale 1ns / 1ps

module up_down_bcd_counter (output logic [3:0] bcd, output logic carry_out,
	input logic carry_in, input logic up_down, input logic rst, input logic clk);

	logic [3:0] next_bcd;

	// sequential logic
	always_ff @(posedge clk) begin
		bcd = next_bcd;
	end

	// combinational logic
 always_comb begin
 
        next_bcd = bcd;
 
        if(carry_in == 0) begin
           
            carry_out = 0;
            next_bcd = bcd;
   
        end else begin
            if(up_down == 1) begin
               
                next_bcd = bcd + 1;
                carry_out = 0;
                if(bcd == 4'd9) begin
                    next_bcd = 4'd0;
                    carry_out = 1;
                end
 
            end else
 begin
                next_bcd = bcd - 1;
                carry_out = 0;
 
                if(bcd == 4'd0) begin
                    next_bcd = 4'd9;
                    carry_out = 1;
                end
            end
        end
 
        if(rst == 1) next_bcd = 4'd0;
    end

endmodule
