//Timer: Mod-60 downcounter with synchronous load
module timer(
    input clk,
    input rst,
    input en,               //Enables or Disables clock
    input load,             //If load=1, load the counter with "load_value"
    input [5:0] load_value, //Value to load into counter register. Counter will then start counting from this value
    output reg [5:0] state     //6-bits to represent the highest number 59
);

wire is_zero = (state == 6'b0);

always @(posedge clk) begin
    if (rst) begin
        state <= 6'b0;
    end
    else if (load) begin
        state <= load_value;
    end
    else if (en && !is_zero) begin
        state <= state - 1'b1;
    end
end

endmodule
