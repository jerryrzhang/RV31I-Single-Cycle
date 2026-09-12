`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2026 06:16:03 PM
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory(
    input [31:0] address,
    output [31:0] instruction
    );
    
    reg [31:0] RAM [63:0]; //init instruction memory
    
    initial begin
        $readmemh("imem.mem", RAM);
    end
    
    assign instruction = RAM[address[7:2]]; // combinationally pull data from address
    
endmodule
