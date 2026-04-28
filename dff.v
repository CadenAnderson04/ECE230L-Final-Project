`timescale 1ns / 1ps
//---------------------------------------------------------------------------
// Module Name: dff_with_enable
// Description: D-Flip-Flop with Asynchronous Reset and Clock Enable.
//---------------------------------------------------------------------------


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
    // Sequential logic block: Triggers on the rising edge of clock or reset
    always @(posedge Clock, posedge Reset) begin
            if (Reset) begin
                Q <= 0; // Clear on reset
            end
            else if(en) begin
                Q <= D; // capture input on enable
            end
        // Implicit 'else' maintains current state of q
        end
endmodule
