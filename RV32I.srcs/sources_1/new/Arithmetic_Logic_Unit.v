`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2026 01:03:29 AM
// Design Name: 
// Module Name: Arithmetic_Logic_Unit
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


module Arithmetic_Logic_Unit(
    input [2:0] ALU_Control,
    input [31:0] A, B,
    output reg [31:0] Result,
    output zero
    );
    
    
    wire [31:0] B_math, sum, and_wire, or_wire, xor_wire;
    wire slt;
    assign B_math = ALU_Control[0] ? ~B : B; //not B is subtracting
    assign sum = A + B_math + ALU_Control[0]; //carry in ALU Control 0 so if subtracting will add 1
    
    assign and_wire = A & B;
    assign or_wire = A | B;
    assign xor_wire = A ^ B;
    
    assign slt = sum[31] ^ ((sum[31] ^ A[31]) & (A[31] ^ B[31])); //SLT logic shows if A < B
    // which is true if (sum is negative) xor (we get overflow).
    // Logic from overflow flag is trimmed down since we know ALU_Control in the case that this is useful 
    
    
    always @(*) begin
        case (ALU_Control)
            3'b000: Result = sum;
            3'b001: Result = sum;
            3'b010: Result = and_wire;
            3'b011: Result = or_wire;
            3'b100: Result = xor_wire;
            3'b101: Result = {31'd0, slt};
            default: Result = 32'd0;
        endcase
    end
    
    assign zero = (Result == 32'd0);
    
    
endmodule
