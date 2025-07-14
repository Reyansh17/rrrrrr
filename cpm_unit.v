`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2025 15:53:21
// Design Name: 
// Module Name: cpm_unit
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


module comp (
    input  wire [7:0] count1,
    input  wire [7:0] count2,
    output wire [1:0] puf_bits
);
    wire winner = (count1 > count2);
    wire loser_bit = (winner) ? count2[0] : count1[0];
    assign puf_bits = {winner, loser_bit};
endmodule

