`include "unit_test.svh"

/* verilator lint_off UNUSED */
/* verilator lint_off WIDTH */


module simple  
    #(
    parameter TEST
    )
   (
    input               clk,
    input               reset
    );


    `UNIT_TEST_SETUP

    avalon_st_if #(.DATAW(64)) avalon_st();

    
    avalon_st_source st_source (.clk, .avalon_st(avalon_st) );

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

    `UNIT_TESTS

    `UNIT_TEST(super_test)



    `UNIT_TEST_END

    `UNIT_TESTS_END

endmodule

/* verilator lint_on UNUSED */
/* verilator lint_on WIDTH */   