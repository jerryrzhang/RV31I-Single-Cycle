`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2026 03:37:00 PM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(
        input [31:0] instr,
        input zero,
        output PCSrc, ResultSrc, MemWrite, ALUSrc, RegWrite,
        output [2:0] ImmSrc, ALUControl
    );
    
    wire branch;
    wire [1:0] ALUOp;
    
    Main_Decoder md (
        .op(instr[6:0]),
        .ResultSrc(ResultSrc),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .Branch(branch),
        .ImmSrc(ImmSrc),
        .ALUOp(ALUOp)
    );
    
    assign PCSrc = zero & branch;
    
    ALU_Decoder ad (
        .ALUOp(ALUOp),
        .op5(instr[5]),
        .funct3(instr[14:12]),
        .funct7(instr[30]),
        .ALUControl(ALUControl)
    );
    
    
endmodule
