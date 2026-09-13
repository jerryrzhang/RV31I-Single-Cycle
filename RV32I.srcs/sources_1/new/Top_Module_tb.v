`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2026 07:22:49 PM
// Design Name: 
// Module Name: Top_Module_tb
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


module Top_Module_tb(
    );
    reg clk, rst;
    
    
    Top_Module dut(.clk(clk), .rst(rst));  

    always #5 clk = ~clk; 

    initial begin
        clk = 0;
        rst = 1;
        #12 rst = 0;              
        #200 $finish;
    end                   
endmodule
