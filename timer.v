//Timer: Mod-60 downcounter with synchronous load
module timer(
    input clk,
    input rst,
    input en,               //Enables or Disables clock
    input load,             //If load=1, load the counter with "load_value"
    input [5:0] load_value, //Value to load into counter register. Counter will then start counting from this value
    output [5:0] state     //6-bits to represent the highest number 59
);

assign stop_signal = (~state);
assign total_stop = stop_signal || ~en;

if (load)
    assign state = load_value;
end

dff bitZero (
    .q(state[0]),
    .d(~state[0]),
    .clk(clk),
    .rst(rst),
    .en(total_stop)
);

//dff bitOne (
//    .q(state[1]),
//    .d(state[1] ^ ~state[0])
//);


endmodule