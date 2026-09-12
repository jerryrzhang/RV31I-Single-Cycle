`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2026 09:57:53 PM
// Design Name: 
// Module Name: Extend
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


module Extend(
    input [2:0] sel,
    input [31:7] src,
    output reg [31:0] out
    );
    
    always @(*) begin
        case (sel)
            3'd0: out = {{20{src[31]}}, src[31:20] }; // I type 
            3'd1: out = {{20{src[31]}}, src[31:25], src[11:7]}; // S type
            3'd2: out = {{19{src[31]}}, src[31], src[7], src[30:25], src[11:8], 1'b0}; // B Type
            3'd3: out = {{12{src[31]}}, src[31:12]}; // U Type
            3'd4: out = {{11{src[31]}}, src[31], src[19:12], src[20], src[30:21], 1'b0};// J Type
            default: out = 32'd0;
        endcase
    end
    
    
endmodule
