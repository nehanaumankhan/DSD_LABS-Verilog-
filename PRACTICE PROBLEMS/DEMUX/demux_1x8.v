module demux_1x8 (
    input a, s0, s1, s2,
    output [7:0] O	
);
    // internal wires
    wire w1, w2, w3, w4, w5, w6;

    demux d1 (
        .a  (a),
        .sel(s2),
        .o1 (w1),
        .o2 (w2)
    );

    demux d2 (
        .a  (w1),
        .sel(s1),
        .o1 (w3),
        .o2 (w4)
    );

    demux d3 (
        .a  (w2),
        .sel(s1),
        .o1 (w5),
        .o2 (w6)
    );

    demux d4 (
        .a  (w3),
        .sel(s0),
        .o1 (O[0]),
        .o2 (O[1])
    );

    demux d5 (
        .a  (w4),
        .sel(s0),
        .o1 (O[2]),
        .o2 (O[3])
    );

    demux d6 (
        .a  (w5),
        .sel(s0),
        .o1 (O[4]),
        .o2 (O[5])
    );

    demux d7 (
        .a  (w6),
        .sel(s0),
        .o1 (O[6]),
        .o2 (O[7])
    );

endmodule
