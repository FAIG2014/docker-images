`include "unit_test.svh"


module packet_pkg_unit_test;

    `UNIT_TEST_SETUP

    bit clk;

    
    initial clk = 0;
    always #2 clk <= ~clk;

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

        `UNIT_TEST_BEGIN(compare_test)
            packet_pkg::Packet my_packet0;
            packet_pkg::Packet my_packet1;

            my_packet0 =  new();
            my_packet0.make_random(20);
            my_packet1 =  new();
            my_packet1.make_random(20);

            `ASSERT_EQUAL(my_packet0.size(), 20)
            `ASSERT_EQUAL(my_packet0.size(), my_packet1.size())
            `ASSERT_FALSE(my_packet0.is_packet_equal(my_packet1, .expect_equal(0) )  )

        `UNIT_TEST_END

        `UNIT_TEST_BEGIN(copy_test)
            packet_pkg::Packet my_packet0;
            packet_pkg::Packet my_packet1;

            my_packet0 =  new();
            my_packet0.make_random(20);
            my_packet1 =  new();

            `ASSERT_FALSE(my_packet0.is_packet_equal(my_packet1, .expect_equal(0) )  )

            my_packet1 = my_packet0.copy();
            `ASSERT_TRUE(my_packet0.is_packet_equal(my_packet1)  )


        `UNIT_TEST_END


    `ALL_UNIT_TESTS_END

endmodule

