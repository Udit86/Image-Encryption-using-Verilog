`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2022 23:36:55
// Design Name: 
// Module Name: LFSR_Y
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LFSR_Y(
    input shift_bit,
    input trigger,
    input clk,
    input reset_n,
    output [0:21] Y
    );
    
reg [0:21] Y_reg,Y_next;
wire taps;

    assign taps = Y_reg[20]^Y_reg[21];
    always @(posedge clk,negedge reset_n,posedge trigger)
    begin
        if(~reset_n)
            Y_reg <= 'b0;
        else if (trigger)
            Y_reg <= {taps^shift_bit,Y_reg[0:20]};
    end
        
assign Y = Y_reg;
     
endmodule