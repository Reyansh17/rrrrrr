`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 07:29:33 AM
// Design Name: 
// Module Name: overflow_logic
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

module overflow_logic (
    input wire overflow1,
    input wire overflow2,
    input wire [15:0] count1,
    input wire [15:0] count2,
    output wire done,
    output wire [2:0] puf_bits
);
    assign done = overflow1 | overflow2;
    wire [15:0] selected = overflow1 ? count2 : count1;
    assign puf_bits = selected[7:5];
endmodule
