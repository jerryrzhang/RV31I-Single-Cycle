`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2026 03:11:51 PM
// Design Name: 
// Module Name: datapath
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


module datapath(
        input clk, rst, 
        input RegWrite, ALUSrc, ResultSrc, MemWrite, PCSrc,
        input [2:0] ImmSrc, ALUControl,
        output zero
    );
    
    wire [31:0] pc, pc_next, pc_plus4, pc_plus_imm;
    
    Program_Counter pc1 (
        .clk(clk),
        .rst(rst),
        .out(pc),
        .next(pc_next)
    );
    
    wire [31:0] instr;
    
    Instruction_Memory imem (
        .address(pc),
        .instruction(instr)
    );
    
    wire [31:0] read1, read2;
    wire [31:0] rf_write;
    // rf_write is assigned lower in code
    
    Register_File rfile (
        .clk(clk),
        .A1(instr[19:15]), //always register 1 when needed
        .A2(instr[24:20]), //always register 2 when needed
        .A3(instr[11:7]), //always write register when needed
        .RD1(read1),
        .RD2(read2),
        .WD3(rf_write),
        .WEN(RegWrite) //external control signal
    );
    
    wire [31:0] immediate;
    
    Immediate_Extend imm (
        .src(instr[31:7]),
        .sel(ImmSrc[2:0]), //external control signal
        .out(immediate)
    );
    
    assign pc_plus_imm = pc + immediate;
    
    assign pc_plus4 = pc + 4; //next word 
    
    assign pc_next = PCSrc ? pc_plus_imm : pc_plus4;
    
    
    
    
    wire [31:0] alu_result;
    wire [31:0] srcB;
    
    assign srcB = ALUSrc ? immediate : read2; //mux with external control signal
    
    
    Arithmetic_Logic_Unit alu (
        .ALU_Control(ALUControl[2:0]), //external control signal
        .A(read1), //read1 is always srcA
        .B(srcB),
        .Result(alu_result),
        .zero(zero)
    );
    
    wire [31:0] read_dmem;
    
    Data_Memory dmem (
        .clk(clk),
        .A(alu_result),
        .WEN(MemWrite), //external control signal
        .WD(read2),
        .RD(read_dmem)
    );
    
    assign rf_write = ResultSrc ? read_dmem : alu_result; // mux with external control signal
    
    
    
endmodule
