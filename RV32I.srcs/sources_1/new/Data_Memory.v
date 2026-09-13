`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2026 02:04:46 PM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(
        input clk,
        input [31:0] A, // 1 address
        output [31:0] RD, // 1 outputs for read
        input [31:0] WD, // 1 input for write
        input WEN // write enable
    );
    
    reg [31:0] mem [63:0]; // 32 size 64 registers
    
    assign RD = mem[A[7:2]]; // combinationally pull data from address
    
    always @(posedge clk) begin
        if (WEN) mem[A[7:2]] <= WD;
    end

endmodule