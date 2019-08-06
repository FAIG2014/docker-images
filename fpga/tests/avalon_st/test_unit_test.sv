`include "unit_test.svh"

`timescale 1 ns / 1 ps

module test_unit_test;

    `UNIT_TEST_SETUP



    // An example to create a clock
    // initial aclk = 0;
    // always #2 aclk <= ~aclk;

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

