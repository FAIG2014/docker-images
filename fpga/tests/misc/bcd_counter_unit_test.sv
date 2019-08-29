`include "unit_test.svh"


module bcd_counter_unit_test;
    parameter BCD_NUM = 8;

    `UNIT_TEST_SETUP

    bit clk;
    bit reset;

    
    initial clk = 0;
    always #2 clk <= ~clk;

    initial reset = 1;


    task setup();
    begin
        // setup() runs when a test begins
    end
    endtask

    task teardown();
    begin
        // teardown() runs when a test ends
    end
    endtask


    logic               incr;
    logic               reset_counter;
    logic  [3:0]       bcds[BCD_NUM-1:0];
            
    bcd_counter
    #(
        .BCD_NUM(BCD_NUM)
     )
     UUT_bcd_counter
    (
        .clk, 
        .reset,

        .incr,
        .reset_counter,
        .bcds
    );



    `ALL_UNIT_TESTS_BEGIN

        `UNIT_TEST_BEGIN(sit_idle)

            incr = 0;
            reset_counter = 0;

            @(posedge clk);

            reset = 0;

            @(posedge clk);
            @(posedge clk);




            for (int i = 0; i < 30 ; i ++) begin
                @(posedge clk);

            end


            for (int i = 0; i < BCD_NUM; i++ ) begin
                `ASSERT_EQUAL(bcds[i], 0)
                //`LOG_INFO("%d", bcds[i])
            end
        `UNIT_TEST_END

        `UNIT_TEST_BEGIN(run_well)
            logic  [3:0]      expect_bcds[BCD_NUM-1:0];
            incr = 0;
            reset_counter = 0;


            for (int i = 0; i < BCD_NUM; i++ ) begin
                expect_bcds[i] = 0;
            end


            @(posedge clk);

            reset = 0;

            @(posedge clk);
            @(posedge clk);




            for (int i = 0; i < 30 ; i ++) begin
                incr = 1;
                @(posedge clk);

            end
            incr = 0;
            @(posedge clk);

            expect_bcds[1] = 3;


            for (int i = 0; i < BCD_NUM; i++ ) begin
                `ASSERT_EQUAL(bcds[i], expect_bcds[i])
            end



            
        `UNIT_TEST_END

    `ALL_UNIT_TESTS_END

endmodule

