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

    logic [6:0] segment_reg;
    logic [6:0] segment_next;

    assign segment_next = (BASE_10 == 1) ?   segment_pkg::int_base10_to_segment(value) :
                                        segment_pkg::int_base16_to_segment(value);

    always_ff@(posedge clk) begin
        if (reset == 1'b1) begin
            segment_reg	        <=	'0;
        end
        else begin
            segment_reg <= segment_next;
        end
    end

    assign segment = segment_reg;
endmodule 
