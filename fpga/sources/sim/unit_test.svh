
`include "logs.svh"

`ifndef UNIT_TEST_SETUP
`define UNIT_TEST_SETUP \
    integer unit_test_status = 0; \
    integer unit_test_warning = 0; \
    integer unit_test_critical = 0; \
    integer unit_test_error = 0; \
    integer unit_test_error_total = 0; \
    integer unit_test_nb_test = 0; \
    integer unit_test_nb_test_success = 0;
`endif

`ifndef LAST_STATUS
`define LAST_STATUS unit_test_status
`endif

`ifndef ASSERT_FALSE
`define ASSERT_FALSE(exp) \
    if (exp) begin \
        `LOG_ERROR("ASSERT_FALSE"); \
        unit_test_error += 1; \
        unit_test_status = 1; \
    end else begin \
        unit_test_status = 0; \
    end
`endif

`ifndef ASSERT_TRUE
`define ASSERT_TRUE(exp) \
    if (!exp) begin \
        `LOG_ERROR("ASSERT_TRUE"); \
        unit_test_error += 1; \
        unit_test_status = 1; \
    end else begin \
        unit_test_status = 0; \
    end
`endif

`ifndef ASSERT_NOT_EQUAL
`define ASSERT_NOT_EQUAL(a,b) \
    if (a === b) begin \
        `LOG_ERROR("ASSERT_NOT_EQUAL"); \
        unit_test_error += 1; \
        unit_test_status = 1; \
    end else begin \
        unit_test_status = 0; \
    end
`endif

`ifndef ASSERT_EQUAL
`define ASSERT_EQUAL(a,b) \
    if (a !== b) begin \
        `LOG_ERROR("ASSERT_EQUAL"); \
        unit_test_error += 1; \
        unit_test_status = 1; \
    end else begin \
        unit_test_status = 0; \
    end
`endif

`ifndef UNIT_TESTS
`define UNIT_TESTS \
    task run(); \
    begin \
    $display("\n%c[0;36mINFO:     Testsuite execution started%c[0m\n", 27, 27);
`endif

/* verilator lint_off WIDTH */
`ifndef UNIT_TEST
`define UNIT_TEST(_NAME_) \
    begin : _NAME_ \
        string _testName; \
        _testName = `"_NAME_`"; \
        `LOG_INFO($sformatf(`"%s::RUNNING`", _testName)); \
        setup(); \
        unit_test_error = 0; \
        unit_test_nb_test = unit_test_nb_test + 1; \
            begin
`endif
/* verilator lint_on WIDTH */

`ifndef UNIT_TEST_END
`define UNIT_TEST_END \
            end \
        teardown(); \
        if (unit_test_error == 0) begin \
            unit_test_nb_test_success = unit_test_nb_test_success + 1; \
            `LOG_INFO_GREEN($sformatf(`"%s::PASSED`", _testName)); \
        end else begin \
            `LOG_INFO($sformatf(`"%s::FAILED`", _testName)); \
            unit_test_error_total += unit_test_error; \
        end \
    end
`endif

`ifndef UNIT_TESTS_END
`define UNIT_TESTS_END \
    end \
    endtask \
    initial begin\
        run(); \
        $display("\n%c[0;36mINFO:     Testsuite execution finished @ %g%c[0m\n", 27, $time, 27); \
        if (unit_test_warning > 0) begin \
            $display("\t  -> %c[1;33mWarning number: %4d%c[0m", 27, unit_test_warning, 27); \
        end \
        if (unit_test_critical > 0) begin \
            $display("\t  -> %c[1;35mCritical number: %4d%c[0m", 27, unit_test_critical, 27); \
        end \
        if (unit_test_error_total > 0) begin \
            $display("\t  -> %c[1;31mError number: %4d%c[0m", 27, unit_test_error_total, 27); \
        end \
        if (unit_test_nb_test_success != unit_test_nb_test) begin \
            $display("\t  -> %c[1;31mSTATUS: %4d / %4d test(s) passed%c[0m\n", 27, unit_test_nb_test_success, unit_test_nb_test, 27); \
        end else begin \
            $display("\t  -> %c[0;32mSTATUS: %4d / %4d test(s) passed%c[0m\n", 27, unit_test_nb_test_success, unit_test_nb_test, 27); \
        end \
        $finish(); \
    end
`endif
