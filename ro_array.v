module ro_array #(parameter N = 8) (
    input wire enable,
    output wire [N-1:0] ro_outs
);
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : ro_gen
            ring_oscillator_lut ro_inst (
                .enable(enable),
                .out(ro_outs[i])
            );
        end
    endgenerate
endmodule
