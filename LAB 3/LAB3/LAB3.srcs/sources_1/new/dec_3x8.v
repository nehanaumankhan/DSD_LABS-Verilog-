module dec_3x8 (
input In0, In1, In2, //In2=MSB, In0=LSB
output [7:0]Output
);
//Instance 0
dec_2x4 d0(
    .En(~In2),
    .In0(In0),
    .In1(In1),
    .Out(Output[3:0])
);
//Instance 1
dec_2x4 d1(
    .En(In2),
    .In0(In0),
    .In1(In1),
    .Out(Output[7:4])
);
endmodule