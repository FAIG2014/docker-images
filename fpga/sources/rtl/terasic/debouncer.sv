

module debouncer 
    #(
        parameter CLK_FREQ_MZ
    )
    (    
        input           clk,
        input           reset,

        input           button,
        output          button_deboused

    );

    logic start_period;
    logic [15:0] button_regs;
    logic button_reg0;
    logic button_reg1;
    logic button_deboused_reg;

    timer
        #(
            .CLK_FREQ_MZ(CLK_FREQ_MZ),
            .TIMER_PERIOD_NS(nano_second_time_pkg::MILLI_SECOND)
        )
    U_timer
        (
            .clk(clk),
            .reset(reset),
            .start_period(start_period)
        );


    always_ff@(posedge clk) begin
        if (reset == 1'b1) begin
            for (int i=0; i< 16; i++) begin
                button_regs[i] <= '0;
            end
            button_reg0 <= '0;
            button_reg1 <= '0;
            button_deboused_reg <= '0;
        end
        else begin
            if (start_period) begin
                for (int i =1; i <16; i++) begin
                    button_regs[i] <= button_regs[i -1];
                end
                button_regs[0] <= button;

                button_reg0 <= |button_regs;
                button_reg1 <= button_reg0;

                button_deboused_reg <= button_reg0 & !button_reg1;
            end
        end
    end

    assign button_deboused = button_deboused_reg;



endmodule