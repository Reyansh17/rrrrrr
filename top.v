module puf_top (
    input wire clk,
    input wire start,
    input wire [2:0] challenge,
    output reg [1:0] puf_response
);
    wire [15:0] ro_outs1, ro_outs2;
    wire ro1_selected, ro2_selected;
    wire [7:0] count1, count2;
    wire done;
    wire [1:0] response_bits;

    // RO Banks
    ro_array array1 (.enable(start), .ro_outs(ro_outs1));
    ro_array array2 (.enable(start), .ro_outs(ro_outs2));

    // MUXes
    ro_mux #(.N(8)) mux1 (.ro_in(ro_outs1), .sel(challenge), .ro_selected(ro1_selected));
    ro_mux #(.N(8)) mux2 (.ro_in(ro_outs2), .sel(challenge), .ro_selected(ro2_selected));

    // Counter with internal reset & mask
    ro_counter counter_unit (
        .clk(clk),
        .start(start),
        .c1(ro1_selected),
        .c2(ro2_selected),
        .done(done),
        .count1(count1),
        .count2(count2)
    );

    // Comparator for 2-bit PUF
    comp comparator_unit (
        .count1(count1),
        .count2(count2),
        .puf_bits(response_bits)
    );

    // Latch output on done
    always @(posedge clk) begin
        if (done)
            puf_response <= response_bits;
    end
endmodule
