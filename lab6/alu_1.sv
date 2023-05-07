//
// lab6 : version 06/12/2020
// 
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module alu_1 (output logic [3:0] f, output logic c_out, input logic [2:0] sel,
	input logic [3:0] a, input logic [3:0] b, input logic c_in);

logic [4:0] sum;
   //wire[8:0] sum;
   //assign sum = {1'b0, a} + {1'b0, b};
   //assign c_out = sum[8];
   // enter your code here
   always_comb begin
       case(sel)
           3'b000:
               {c_out, f} = {0, b};
           3'b001:
               //sum = a + b + c_in;
               {c_out, f} = a + b + c_in;
               //sum = {1'b0, a} + {1'b0, b} + {1'b0, c_in};
               //c_out = sum[8];
           3'b010:
               {c_out, f} = a + b;
               //sum = {1'b0, a} + {1'b0, b};
               //c_out = sum[8];
           3'b011:
               {c_out, f} = a - b - c_in;
               //sum = {1'b0, a} - {1'b0, b} - {1'b0, c_in};
               //c_out = sum[8];
           3'b100:
               {c_out, f} = a-b;
               if(c_out == 1)
               anode
               //sum = {1'b0, a} - {1'b0, b};
               //c_out = sum[8];
           3'b101:
               {c_out, f} =  a+1;
               //sum = {1'b0,a} + {1'b0, 1'b1};
               //c_out = sum[8];
           3'b110:
               {c_out, f} = a-1;
               //sum = {1'b0,a} - {1'b0, 1'b1};
               //c_out = sum[8];
           3'b111:
               {c_out, f} = {0, a & b};
               //c_out = 0;
       endcase
   end
  
 
endmodule
 

