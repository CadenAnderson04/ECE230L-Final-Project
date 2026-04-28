/*
 *  Timer: Mod-60 downcounter with synchronous load
 *
 *  Counts down from a preloaded value to 0 & stops.
 *  Switches 10-15 set the timers input value & switch 2 loads it to the display.
 *  Switch 1 acts as the run/pause control.
*/

module timer(
    input clk,
    input rst,
    input en,               //Enables or Disables clock
    input load,             //If load=1, load the counter with "load_value"
    input [5:0] load_value, //Value to load into counter register. Counter will then start counting from this value
    output reg [5:0] state     //6-bits to represent the highest number 59
);

// Represents the state of zero that should trigger a stoppage
wire is_zero = (state == 6'b0);

always @(posedge clk, posedge rst) begin
    if (rst) begin
        state <= 6'b0; // reset to zero
    end
    else if (load) begin
        state <= load_value; // load the current load value
    end
    else if (en && !is_zero) begin
        state <= state - 1'b1; // decrement/execute timer functionality
    end
    // holds value if no conditions met
end

endmodule
