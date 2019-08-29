module single_segment
    #(
        parameter BASE_10 = 1
     )
    (
        input               clk, 
        input               reset,

        input   [3:0]       value, // value to be print into the segment
        output  [6:0]       segment
    );

    assign segment = (BASE_10 == 1) ?   segment_pkg::int_base10_to_segment(value) :
                                        segment_pkg::int_base16_to_segment(value);
endmodule 
