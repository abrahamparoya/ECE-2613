//
// lab5 : version 06/12/2020
// 
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module comb_shifters (output logic [7:0] data_out, input logic [2:0] select,
	input logic [7:0] data_in);

    //shift << or >> (arrow points in the dirrection of the shift)
    //arithmeitc <<< or >>>
    //Logical shift: din0 is discarded and the left side is padded with a 0 (unsigned number)
    //Arithmetic shift: din0 is discared and the left is padded with the sign og din7 (signed)
    //Circular Shift:value that is shifted out of the picture goes to the front or back
    //Barrell Shift: shift by more than one bit, can be circular or arithmetic, just change the numerical value.

    //TEMPLATE:
        //always_comb begin
            //case(select)
                //3'b001: data_out = data_in << 1; // 



    always_comb begin
        //data_out = {data_in[0], data_in[7:1]};
        case(select[2:0])
            3'b001: data_out = data_in << 1; // shift 1 bit left
            3'b010: data_out = data_in >> 1; // shift 1 bit right
            3'b011: data_out = {data_in[6:0],data_in[7]}; // circular shift 1 bit left
            3'b100: data_out = {data_in[0], data_in[7:1]}; // circular shift 1 bit right
            3'b101: data_out = $signed(data_in) >>> 1; // arithmetic shift right 1 bit
            3'b110: data_out = {data_in[4:0], data_in[7:5]}; //barrell circular left shift
            3'b111: data_out = $signed(data_in) >>> 5; //barrell arithmetic left shift
           
            default: data_out = data_in; //do nothing
        endcase
    end

endmodule
