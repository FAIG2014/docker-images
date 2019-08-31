/*
    generate a pulse of 1 clk every period of time


*/

module timer
    #(
        parameter CLK_FREQ_MZ,
        parameter TIMER_PERIOD_NS
    )
    (
        input  clk,
        input  reset,


        output start_period
    );

    parameter NB_CLK = time_pkg::nb_clk_for_time(.freq_mz(CLK_FREQ_MZ), .time_needed_ns(TIMER_PERIOD_NS) );
    parameter COUNTER_RANGE = math_pkg::vect_range(NB_CLK);
    logic	[COUNTER_RANGE:0]	counter  = '0;
    logic start_period_reg;

    assign start_period = start_period_reg;


    always_ff@(posedge clk) begin
        if (reset == 1'b1) begin
            counter	        <=	'0;
            start_period_reg    <=  1'b0;

        end
        else begin
            if(counter == NB_CLK) begin
                counter	        <=	'0;
                start_period_reg    <=	1'b1;
            end else begin
                counter         <=  counter+1;
                start_period_reg	<=	1'b0;
            end
        end
    end

endmodule