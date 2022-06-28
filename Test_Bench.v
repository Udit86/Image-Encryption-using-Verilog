`timescale 1ps / 0.1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2022 23:46:59
// Design Name: 
// Module Name: test
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


module test;
reg[7:0] inp_im[65535:0];
reg[7:0] out_im[65535:0];
reg[0:63] secret_key;
reg[0:21] public_key;

reg shift_bit;
reg [0:2] triggers;
reg clk;
reg [0:2] resets;
reg x_maj,y_maj,z_maj;
wire [0:18]X;
wire [0:21]Y;
wire [0:22]Z;
wire maj_logic;
wire [0:2] maj_triggers;

LFSR_X l_X(shift_bit,triggers[0],clk,resets[0],X);
LFSR_Y l_Y(shift_bit,triggers[1],clk,resets[1],Y);
LFSR_Z l_Z(shift_bit,triggers[2],clk,resets[2],Z);
Maj_logic maj(x_maj,y_maj,z_maj,maj_triggers);

initial 
begin
    clk = 1'b1;
    forever
        #5 clk = ~clk;
end

initial
begin
    secret_key = 64'b0110100001100001011100100110010001110111011000010111001001100101;
    public_key = 22'b1101001110000110010001;
    $readmemb("/home/shinzo/Desktop/Udyam/ICHIP/2022/PS-2/img.txt",inp_im);
end

integer i,j;
initial 
begin
    #5
    resets = 3'b000;
    triggers = 3'b111;
    #10
    resets = 3'b111;
    for(i=0;i<64;i=i+1)
    begin
    shift_bit = secret_key[i];
    #10;
    end
    for(i=0;i<22;i=i+1)
    begin
    #10 shift_bit = public_key[i];
    end
    shift_bit = 1'b0;
    triggers = 3'b000;
    for(i=0;i<100;i=i+1)
    begin
        #10
        x_maj = X[8];
        y_maj = Y[10];
        z_maj = Z[10];
        triggers = maj_triggers;
    end
    #1000
    for(i=0;i<65536;i=i+1)
    begin
        for(j=0;j<8;j=j+1)
        begin
        #10 
        x_maj = X[8];
        y_maj = Y[10];
        z_maj = Z[10];
        triggers = maj_triggers;
        out_im[i][j] = X[18]^Y[21]^Z[22]^inp_im[i][j];
        end
        $display("input : %b  output : %b int : %d",inp_im[i],out_im[i],i);
    end
    $writememb("/home/shinzo/Desktop/Udyam/ICHIP/2022/PS-2/output.txt",out_im);
    #10 $finish;
end

endmodule
