/*
    This modules controls at the transaction level the comuniacation with the LCD

*/


module LCD_Controller 
    #(
        parameter CLK_DIVIDER =    16,
        parameter CLK_FREQ_MZ
    )
    (    
        input           clk,
        input           reset,
        //    Host Side
        input   [7:0]   data,
        input           rs,
        input           start,
        output  logic   ready,
        //    LCD Interface
        output    [7:0]     LCD_DATA,
        output              LCD_EN,
        output              LCD_RW,
        output              LCD_RS,
        output              LCD_ON,
        output              LCD_BLON
    );

localparam CLK_NUM_RS_TO_ENABLE = time_pkg::nb_clk_for_time(CLK_FREQ_MZ, 40); //corespond to Tas
localparam CLK_NUM_ENABLE = time_pkg::nb_clk_for_time(CLK_FREQ_MZ, 230); //corespond to PWeh
localparam CLK_NUM_WRITE_DATA = time_pkg::nb_clk_for_time(CLK_FREQ_MZ, 43000); //corespond to min time between 2 write
localparam CLK_NUM_WRITE_INSTRUCTION = time_pkg::nb_clk_for_time(CLK_FREQ_MZ, 1530000); 
localparam CLK_NUM_MAX = math_pkg::max(CLK_NUM_RS_TO_ENABLE, CLK_NUM_ENABLE, CLK_NUM_WRITE_DATA, CLK_NUM_WRITE_INSTRUCTION);
localparam CLK_NUM_MAX_RANGE = math_pkg::vect_range(CLK_NUM_MAX);

//    Internal Register
logic [CLK_NUM_MAX_RANGE:0]     counter;
logic           LCD_EN_reg;
logic           LCD_RS_reg;
logic  [7:0]    LCD_DATA_reg;



/////////////////////////////////////////////
assign LCD_DATA    = LCD_DATA_reg ;
assign LCD_EN      = LCD_EN_reg;
assign LCD_RW      = 1'b0;
assign LCD_RS      = LCD_RS_reg;
assign LCD_ON      = 1'b1;
assign LCD_BLON    = 1'b0; //not supported;


/////////////////////////////////////////////

enum int unsigned { READY, SET_RS, ENABLE_LCD, PROGRAM_LCD, FINISHED,WAIT_BETWEEN_INSTRUCTION } state_reg;


always@(posedge clk ) begin
    if (reset == 1'b1) begin
        LCD_EN_reg      <= 1'b0;
        LCD_RS_reg      <= '0;
        counter         <= '0;
        state_reg       <= READY;
        LCD_DATA_reg    <= '0;
    end else begin

        //////////////////////////////////
        case(state_reg)
            READY: begin  // wait for order
                if(start) begin
                    state_reg    <= SET_RS;
                    LCD_RS_reg   <= rs;
                    LCD_DATA_reg     <= data;
                end
                counter          <= '0;
            end
            SET_RS: begin // set RS flags
                counter    <=    counter+1;   
                if(counter > CLK_NUM_RS_TO_ENABLE) begin
                    state_reg    <=    ENABLE_LCD;
                end
            end
            ENABLE_LCD: begin    // set the the enable to talk to the LCL
                LCD_EN_reg    <=    1'b1;
                state_reg     <=    PROGRAM_LCD;
                counter          <= '0;
            end
            PROGRAM_LCD: begin // wait for the LCD to see the write.
                if(counter < CLK_NUM_ENABLE) begin
                    counter    <=    counter+1;
                end 
                else begin
                    state_reg        <=    FINISHED;
                end
            end
            FINISHED: begin
                LCD_EN_reg  <=    1'b0;
                
                counter        <=    '0;
                state_reg   <=    WAIT_BETWEEN_INSTRUCTION;
            end

            WAIT_BETWEEN_INSTRUCTION: begin
                counter <= counter +1;
                if ( LCD_RS_reg == 0) begin
                    if (counter > CLK_NUM_WRITE_INSTRUCTION) begin
                        state_reg   <=    READY;
                    end
                end
                else begin
                    if (counter > CLK_NUM_WRITE_DATA) begin
                        state_reg   <=    READY;
                    end
                end
            end
        endcase
    end

    
end
    assign ready = (state_reg == READY);

endmodule