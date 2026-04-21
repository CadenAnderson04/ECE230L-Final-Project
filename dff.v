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
    input D,
    input Clock,
    input Reset,
    input en,
    output reg Q
    );
    initial begin
        Q <= 0;
    end
    always @(posedge Clock, posedge Reset) begin
            if (Reset) begin
                Q <= 0;
            end
            else if(en) begin
                Q <= D;
            end
        end
endmodule
