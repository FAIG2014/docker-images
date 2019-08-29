module bcd_counter
    #(
        parameter BCD_NUM = 1
     )
    (
        input               clk, 
        input               reset,

        input               incr,
        input               reset_counter,
        output  [3:0]       bcds[BCD_NUM-1:0]
    );

    logic [3:0] bcds_reg[BCD_NUM-1:0];
    logic [3:0] bcds_next[BCD_NUM-1:0];


    assign bcds = bcds_reg;

    always_ff @(posedge clk) begin
        if (reset | reset_counter) begin
            for (int i =0 ; i<BCD_NUM ; i++  ) begin
                bcds_reg[i] <= '0; 
            end
        end else begin
            if (incr) begin
                for (int i =0 ; i<BCD_NUM ; i++  ) begin
                    bcds_reg[i] <= bcds_next[i]; 
                end
            end
        end
    end

    always_comb begin
        for (int i =0 ; i<BCD_NUM ; i++  ) begin
            bcds_next[i] = bcds_reg[i]; 
        end

        bcds_next[0] = bcds_next[0] + 1;

        for (int i = 0 ; i<BCD_NUM ; i++  ) begin
            
            
            if ( bcds_next[i] > 9 ) begin
                bcds_next[i] = '0;
                if (i < BCD_NUM-1 ) begin
                    bcds_next[i+1] =  bcds_next[i+1] + 1; 
                end
            end
        end


    end



endmodule 

