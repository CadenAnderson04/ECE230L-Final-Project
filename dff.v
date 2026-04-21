`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2026 09:11:24 AM
// Design Name: 
// Module Name: dff
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


module dff(
    input d,
    input clk,
    input rst,
    input en,
    output reg q
    );
    initial begin
        q <= 0;
    end
    always @(posedge clk, posedge rst, posedge en) begin
        if (en) // uncertain solution
            if (rst)
                q <= 0;
            else
                q <= d;
            end
endmodule

