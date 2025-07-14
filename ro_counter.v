module ro_counter (
    input wire clk,
    input wire start,
    input wire c1, c2,
    output reg done = 0,
    output reg [7:0] count1 = 0,
    output reg [7:0] count2 = 0
);
    parameter [7:0] MASK = 8'b11111000;

    reg c1_d = 0, c2_d = 0;
    wire c1_rising = c1 & ~c1_d;
    wire c2_rising = c2 & ~c2_d;

    always @(posedge clk) begin
        c1_d <= c1;
        c2_d <= c2;

        if (!start) begin
            count1 <= 0;
            count2 <= 0;
            done <= 0;
        end else if (!done) begin
            if (c1_rising && ((count1 & MASK) != MASK)) count1 <= count1 + 1;
            if (c2_rising && ((count2 & MASK) != MASK)) count2 <= count2 + 1;

            if (((count1 & MASK) == MASK) || ((count2 & MASK) == MASK))
                done <= 1;
        end
    end
endmodule
