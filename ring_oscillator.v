`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 07:16:41 AM
// Design Name: 
// Module Name: ring_oscillator
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
`timescale 1ns/1ps

/*
* Company: Santa Clara University
* Engineer: Jonathan Trinh
*
* Create Date: 10/10/2019 03:22:41 PM
* Design Name:
* Module Name: ring_oscillator_lut
* Project Name: Delay-based Physical Unclonable Function Implementation
* Target Devices: Digilent S7-25, S7-50 (Xilinx Spartan 7)
* Tool Versions:
* Description: The ring_oscillator_lut module is a ring oscillator constructed using LUT-based inverters.
*              The feedback includes a NAND gate controlled by the enable signal.
*
* Dependencies:
*
* Revision:
* Revision 0.01 - File Created
* Additional Comments:
*
*/

module ring_oscillator_lut (
    input wire enable,
    output wire out
);

  // Internal wires with dont_touch to preserve oscillator chain
  (* dont_touch = "yes" *) wire n1;
  (* dont_touch = "yes" *) wire n2;
  (* dont_touch = "yes" *) wire n3;
  (* dont_touch = "yes" *) wire n4;
  (* dont_touch = "yes" *) wire n5;
  (* dont_touch = "yes" *) wire n6;
  (* dont_touch = "yes" *) wire n7;

  // Stage 1: NAND gate (controls oscillation via enable)
  assign n1 = ~(enable & n7);

  // Stages 2 to 7: 6 inverters
  assign n2 = ~n1;
  assign n3 = ~n2;
  assign n4 = ~n3;
  assign n5 = ~n4;
  assign n6 = ~n5;
  assign n7 = ~n6;

  // Output taken from last inverter
  assign out = n7;

endmodule