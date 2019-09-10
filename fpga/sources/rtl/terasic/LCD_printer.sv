module    LCD_printer
    #(
        parameter CLK_FREQ_MZ
    )
    (    //    Host Side
        input           clk,
        input           reset,

        input           refresh,
        input   byte    line0[16],
        input   byte    line1[16],

        //    LCD Side
        output  [7:0]   LCD_DATA,
        output          LCD_RW,
        output          LCD_EN,
        output          LCD_RS,
        output          LCD_ON,
        output          LCD_BLON
    );

//    Internal Wires/Registers
logic    [5:0]    lut_index;
logic    [7:0]    lut_data;
logic             lut_rs;
logic    [5:0]    mLCD_ST;
logic             mLCD_Start;
logic    [7:0]    mLCD_DATA;
logic             mLCD_RS;
logic             mLCD_Done;
logic             mLCD_ready;

enum int unsigned { WAIT_READY, SEND_ORDER, NEXT_INDEX } state_reg;

localparam LCD_INTIAL   = 0;
localparam LCD_LINE1    = 5;
localparam LCD_CH_LINE  = LCD_LINE1+16;
localparam LCD_LINE2    = LCD_LINE1+16+1;
localparam LUT_SIZE     = LCD_LINE1+32+1;

always_ff@(posedge clk) begin
    if (reset == 1'b1) begin
        lut_index   <= '0;
        state_reg   <= WAIT_READY;
        mLCD_Start  <= '0;
        mLCD_DATA   <= '0;
        mLCD_RS     <= '0;
    end else begin

        if(lut_index < LUT_SIZE) begin
            case(state_reg)
                WAIT_READY: begin
                    if(mLCD_ready) begin
                        mLCD_DATA   <= lut_data;
                        mLCD_RS     <= lut_rs;
                        mLCD_Start  <= '1;
                        state_reg   <= SEND_ORDER;
                    end
                end
                SEND_ORDER: begin
                    mLCD_Start  <= '0;
                    state_reg   <= NEXT_INDEX;                    
                end
                NEXT_INDEX:    begin
                    lut_index   <= lut_index+1;
                    state_reg   <= WAIT_READY;
                end
            endcase
        end

        if (refresh) begin
            lut_index <= '0;
        end
    end
end

always begin
    case(lut_index)
        //    Initial
        LCD_INTIAL+0: begin
            lut_data    <= 8'h38;
            lut_rs      <= 1'b0;
        end
        LCD_INTIAL+1: begin
            lut_data    <= 8'h0C;
            lut_rs      <= 1'b0;
        end
        LCD_INTIAL+2: begin
            lut_data    <= 8'h01; // clear display
            lut_rs      <= 1'b0;
        end
        LCD_INTIAL+3: begin
            lut_data    <= 8'h06;
            lut_rs      <= 1'b0;
        end
        LCD_INTIAL+4: begin
            lut_data    <= 8'h80;
            lut_rs      <= 1'b0;
        end
        //    Line 1
        LCD_LINE1+0: begin
            lut_data    <= line0[0];
            lut_rs      <= 1'b1;
        end
        LCD_LINE1+1: begin
            lut_data    <= line0[1];
            lut_rs      <= 1'b1;
        end
        LCD_LINE1+2: begin
            lut_data    <= line0[2];
            lut_rs      <= 1'b1;
        end
        LCD_LINE1+3: begin
            lut_data    <= line0[3];
            lut_rs      <= 1'b1;
        end
        LCD_LINE1+4: begin
            lut_data    <= line0[4];
            lut_rs      <= 1'b1;
        end
        LCD_LINE1+5: begin
            lut_data    <= line0[5];
            lut_rs      <= 1'b1;
        end
        LCD_LINE1+6: begin
            lut_data    <= line0[6];
            lut_rs      <= 1'b1;
        end
        LCD_LINE1+7: begin
            lut_data    <= line0[7];
            lut_rs      <= 1'b1;
        end
        LCD_LINE1+8: begin
            lut_data    <= line0[8];
            lut_rs      <= 1'b1;
        end
        LCD_LINE1+9: begin
            lut_data    <= line0[9];
            lut_rs      <= 1'b1;
        end
        LCD_LINE1+10: begin
            lut_data    <= line0[10];
            lut_rs      <= 1'b1;
        end
        LCD_LINE1+11: begin
            lut_data    <= line0[11];
            lut_rs      <= 1'b1;
        end
        LCD_LINE1+12: begin
            lut_data    <= line0[12];
            lut_rs      <= 1'b1;
        end
        LCD_LINE1+13: begin
            lut_data    <= line0[13];
            lut_rs      <= 1'b1;
        end
        LCD_LINE1+14: begin
            lut_data    <= line0[14];
            lut_rs      <= 1'b1;
        end
        LCD_LINE1+15: begin
            lut_data    <= line0[15];
            lut_rs      <= 1'b1;
        end
        //    Change Line
        LCD_CH_LINE: begin
            lut_data    <= 8'hC0;
            lut_rs      <= 1'b0;
        end
        //    Line 2
        LCD_LINE2+0: begin
            lut_data    <= line1[0];    //    Altera DE2-70
            lut_rs      <= 1'b1;
        end
        LCD_LINE2+1: begin
            lut_data    <= line1[1];
            lut_rs      <= 1'b1;
        end
        LCD_LINE2+2: begin
            lut_data    <= line1[2];
            lut_rs      <= 1'b1;
        end
        LCD_LINE2+3: begin
            lut_data    <= line1[3];
            lut_rs      <= 1'b1;
        end
        LCD_LINE2+4: begin
            lut_data    <= line1[4];
            lut_rs      <= 1'b1;
        end
        LCD_LINE2+5: begin
            lut_data    <= line1[5];
            lut_rs      <= 1'b1;
        end
        LCD_LINE2+6: begin
            lut_data    <= line1[6];
            lut_rs      <= 1'b1;
        end
        LCD_LINE2+7: begin
            lut_data    <= line1[7];
            lut_rs      <= 1'b1;
        end
        LCD_LINE2+8: begin
            lut_data    <= line1[8];
            lut_rs      <= 1'b1;
        end
        LCD_LINE2+9: begin
            lut_data    <= line1[9];
            lut_rs      <= 1'b1;
        end
        LCD_LINE2+10: begin
            lut_data    <= line1[10];
            lut_rs      <= 1'b1;
        end
        LCD_LINE2+11: begin
            lut_data    <= line1[11];
            lut_rs      <= 1'b1;
        end
        LCD_LINE2+12: begin
            lut_data    <= line1[12];
            lut_rs      <= 1'b1;
        end
        LCD_LINE2+13: begin
            lut_data    <= line1[13];
            lut_rs      <= 1'b1;
        end
        LCD_LINE2+14: begin
            lut_data    <= line1[14];
            lut_rs      <= 1'b1;
        end
        LCD_LINE2+15: begin
            lut_data    <= line1[15];
            lut_rs      <= 1'b1;
        end
        default: begin
            lut_data    <= 8'h20;
            lut_rs      <= 1'b1;
        end
    endcase
end

LCD_Controller         
            #(
                .CLK_FREQ_MZ(CLK_FREQ_MZ)
            )
            u0 (    //    Host Side
                .data(mLCD_DATA),
                .rs(mLCD_RS),
                .start(mLCD_Start),
                .ready(mLCD_ready),
                .clk(clk),
                .reset(reset),
                //    LCD Interface
                .LCD_DATA(LCD_DATA),
                .LCD_RW(LCD_RW),
                .LCD_EN(LCD_EN),
                .LCD_RS(LCD_RS),
                .LCD_ON(LCD_ON),
                .LCD_BLON(LCD_BLON)
                );

endmodule