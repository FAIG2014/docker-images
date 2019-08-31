module	reset_generator
    #(
        parameter COUNTER_SIZE = 20
    )
    (
        input  clk,
        output reset
    );



    logic	[COUNTER_SIZE-1:0]	counter  = '0;


    always_ff@(posedge clk) begin
        if(counter != '1) begin
            counter	<=	counter+1;
            reset	<=	1'b1;
        end else begin
            reset	<=	1'b0;
        end
end

endmodule