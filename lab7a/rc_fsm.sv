`timescale 1ns / 1ps

module rc_fsm (output logic enable, output logic up_down,
	output logic error, input logic [1:0] quad_ctl,
	input logic rst, input logic clk);

	enum logic [1:0] {HOLD, UP, DOWN, ERROR} state, next_state;

	    always_ff @(posedge clk) begin
        state <= next_state;
    end
 
    // combinational logic
    always_comb begin
        // defaults
        next_state = state;
        enable = 0;
        error = 0;
        up_down = 0;
       
        // main logic
        if(rst == 1'b0) begin
        case(state)
            HOLD: begin //For HOLD
                enable = 0;
                error = 0;
                case(quad_ctl)
                    2'b00: next_state = HOLD;
                    2'b01: next_state = UP;
                    2'b10: next_state = DOWN;
                    2'b11: next_state = ERROR;
                endcase
            end
 
            UP: begin //For UP
                enable = 1;
                error = 0;
                up_down = 1;
                case(quad_ctl)
                    2'b00: next_state = HOLD;
                    2'b01: next_state = UP;
                    2'b10: next_state = DOWN;
                    2'b11: next_state = ERROR;
                endcase
            end
 
            DOWN: begin //For DOWN
                enable = 1;
                error = 0;
                up_down = 0;
                case(quad_ctl)
                    2'b00: next_state = HOLD;
                    2'b01: next_state = UP;
                    2'b10: next_state = DOWN;
                    2'b11: next_state = ERROR;
                endcase
            end
 
            ERROR: begin //For ERROR
                enable = 0;
                error = 1;
            end
        endcase
        end
       
        if (rst == 1'b1) begin  // priority logic
            next_state = HOLD;
        end
    end
endmodule
