//StopWatch: Modulo-60 Counter
module stopwatch(
    input clk,
    input rst,
    input en,
    output [5:0] state     //6-bits to represent the highest number 59
);

// Reset logic
    wire reset_trigger;
    assign reset_trigger = (state[5] & state[4] & state[3] & state[2] & ~state[1] & ~state[0]);
    wire total_reset;
    assign total_reset = rst | reset_trigger;
        
wire [5:0] YToD;
wire [5:0] CinToCout;


fullAdder bitZeroAdder (
.A(state[0]),
.B(1'b1),
.Cin(1'b0),
.Y(YToD[0]),
.Cout(CinToCout[0])
);
dff bitZeroFlop (
.D(YToD[0]),
.Clock(clk),
.en(en),
.Reset(total_reset),
.Q(state[0])
);

fullAdder bitOneAdder (
.A(state[1]),
.B(1'b0),
.Cin(CinToCout[0]),
.Y(YToD[1]),
.Cout(CinToCout[1])
);
dff bitOneFlop (
.D(YToD[1]),
.Clock(clk),
.en(en),
.Reset(total_reset),
.Q(state[1])
);

fullAdder bitTwoAdder (
.A(state[2]),
.B(1'b0),
.Cin(CinToCout[1]),
.Y(YToD[2]),
.Cout(CinToCout[2])
);
dff bitTwoFlop (
.D(YToD[2]),
.Clock(clk),
.en(en),
.Reset(total_reset),
.Q(state[2])
);

fullAdder bitThreeAdder (
.A(state[3]),
.B(1'b0),
.Cin(CinToCout[2]),
.Y(YToD[3]),
.Cout(CinToCout[3])
);
dff bitThreeFlop (
.D(YToD[3]),
.Clock(clk),
.en(en),
.Reset(total_reset),
.Q(state[3])
);

fullAdder bitFourAdder (
.A(state[4]),
.B(1'b0),
.Cin(CinToCout[3]),
.Y(YToD[4]),
.Cout(CinToCout[4])
);
dff bitFourFlop (
.D(YToD[4]),
.Clock(clk),
.en(en),
.Reset(total_reset),
.Q(state[4])
);

fullAdder bitFiveAdder (
.A(state[5]),
.B(1'b0),
.Cin(CinToCout[4]),
.Y(YToD[5]),
.Cout(CinToCout[5])
);
dff bitFiveFlop (
.D(YToD[5]),
.Clock(clk),
.en(en),
.Reset(total_reset),
.Q(state[5])
);


    
   
endmodule

module fullAdder (
    input A,B, Cin,
    output Y, Cout
);

assign Y = ~A&B&~Cin | A&B&Cin | A&~B&~Cin | ~A&~B&Cin;
assign Cout = Cin&(A | B) | A&B;

endmodule




