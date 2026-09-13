`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2026 03:41:57 PM
// Design Name: 
// Module Name: ALU_Decoder
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


module ALU_Decoder(
    input [1:0] ALUOp, 
    input op5,
    input [2:0] funct3,
    input funct7,
    output reg [2:0] ALUControl
    );
    
    always @(*) begin
        ALUControl = 3'b000;
        
        case (ALUOp)
            2'b00: ALUControl = 3'b000;
            2'b01: ALUControl = 3'b001;
            2'b10: begin
                case (funct3)
                    3'b000: begin
                        if (op5 & funct7) ALUControl = 3'b001;
                        else ALUControl = 3'b000;
                    end
                    3'b010: ALUControl = 3'b101;
                    3'b100: ALUControl = 3'b100;
                    3'b110: ALUControl = 3'b011;
                    3'b111: ALUControl = 3'b010;
                endcase
            end
        endcase
        
    end
    
endmodule
