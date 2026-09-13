`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2026 03:40:16 PM
// Design Name: 
// Module Name: Main_Decoder
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


module Main_Decoder(
    input [6:0] op,
    output reg ResultSrc, MemWrite, ALUSrc, RegWrite, Branch,
    output reg [2:0] ImmSrc,
    output reg [1:0] ALUOp
    );
    
    always @(*) begin
        ResultSrc = 0; MemWrite = 0; ALUSrc = 0; RegWrite = 0; Branch = 0; ImmSrc = 3'd0; ALUOp = 2'd0;
        case(op)
            7'b0110011: begin //R Type  
                RegWrite = 1;
                ALUOp = 2'b10;
            end
            7'b0010011: begin //I Type
                ImmSrc = 3'b000;
                RegWrite = 1;
                ALUSrc = 1;
                ALUOp = 2'b10;
            end
            7'b0000011: begin //Load Word
                ImmSrc = 3'b000;
                RegWrite = 1;
                ALUSrc = 1;
                ResultSrc = 1;
            end
            7'b0100011: begin //Store Word
                ImmSrc = 3'b001;
                ALUSrc = 1;
                MemWrite = 1;
            end
            7'b1100011: begin //Branch
                ImmSrc = 3'b010;
                Branch = 1;
                ALUOp = 2'b01;
            end
        endcase
    end
    
endmodule
