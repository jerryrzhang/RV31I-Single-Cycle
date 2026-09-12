`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2026 07:17:09 PM
// Design Name: 
// Module Name: Register_File
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


module Register_File(
        input clk,
        input [4:0] A1, A2, A3, // 3 addresses
        output [31:0] RD1, RD2, // 2 outputs for read
        input [31:0] WD3, // 1 input for write
        input WEN // write enable
    );
    
    reg [31:0] registers [31:0]; // 32 size 32 registers
    
    assign RD1 = (A1 != 0) ? registers[A1] : 32'd0; // read register (unless 0)
    assign RD2 = (A2 != 0) ? registers[A2] : 32'd0; // read register (unless 0)
    
    always @(posedge clk) begin
        if (WEN && A3 != 0) registers[A3] <= WD3; // synchronous write register (unless 0)
    end
    

endmodule
