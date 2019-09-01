module	reset_generator
    #(
        parameter COUNTER_SIZE = 20
    )
    (
        input  clk,
        input  in_reset,
        output out_reset
    );



    logic	[COUNTER_SIZE-1:0]	counter  = '0;


    always_ff@(posedge clk) begin
        if (in_reset == 1'b1) begin
            counter     <= '0;
            out_reset	<=	1'b1;
        end else begin
            if(counter != '1) begin
                counter	<=	counter+1;
                out_reset	<=	1'b1;
            end else begin
                out_reset	<=	1'b0;
            end
        end
end

endmodule