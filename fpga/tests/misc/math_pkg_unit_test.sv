`include "unit_test.svh"


module math_pkg_unit_test;

    `UNIT_TEST_SETUP

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


    `ALL_UNIT_TESTS_BEGIN

        `UNIT_TEST_BEGIN(clog2)
            longint rand_number;

            `ASSERT_EQUAL(math_pkg::clog2(0), 0)
            `ASSERT_EQUAL(math_pkg::clog2(1), 0)
            `ASSERT_EQUAL(math_pkg::clog2(2), 1)

            for (int i = 0 ; i< 1000 ; i++ ) begin
                rand_number = $urandom_range(0, 2**31-1);
                //`LOG_INFO("%d", rand_number)
                `ASSERT_EQUAL(math_pkg::clog2(rand_number), $clog2(rand_number) )
            end
        `UNIT_TEST_END

        `UNIT_TEST_BEGIN(vect_range)
            longint rand_number;

            `ASSERT_EQUAL(math_pkg::vect_range(0), 0)
            `ASSERT_EQUAL(math_pkg::vect_range(1), 0)
            `ASSERT_EQUAL(math_pkg::vect_range(2), 0)
            `ASSERT_EQUAL(math_pkg::vect_range(3), 1)
            `ASSERT_EQUAL(math_pkg::vect_range(4), 1)

            for (int i = 0 ; i< 1000 ; i++ ) begin
                rand_number = $urandom_range(2, 2**31-1);
                //`LOG_INFO("%d", rand_number)
                `ASSERT_EQUAL(math_pkg::vect_range(rand_number), $clog2(rand_number) -1 )
            end
        `UNIT_TEST_END

    `ALL_UNIT_TESTS_END

endmodule

