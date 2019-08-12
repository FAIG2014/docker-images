

`ifdef SIMULATION

    /*
        this implies that the simulation logger has been compiled

    */

    `define DELIM

    `ifndef LOG_INFO
        `define LOG_INFO(p0, p1=ELIM, p2=ELIM) \
            `ifdef D``p1 \
                                logger_pkg::log_info($psprintf(p0), $sformatf("%m"), `__FILE__, `__LINE__); \
            `else \
                `ifdef D``p2 \
                                logger_pkg::log_info($psprintf(p0, p1), $sformatf("%m"), `__FILE__, `__LINE__); \
                `else \
                                logger_pkg::log_info($psprintf(p0, p1, p2), $sformatf("%m"), `__FILE__, `__LINE__); \
                `endif \
            `endif // !`ifdef D
    `endif
/*
    `ifndef LOG_INFO
    `define LOG_INFO(msg) \
            $display("%c[0;37mINFO:     [%g] %s%c[0m", 27, $time, msg, 27)
    `endif
*/

    `ifndef LOG_INFO_GREEN
    `define LOG_INFO_GREEN(msg) \
            $display("%c[0;32mINFO:     [%g] %s%c[0m", 27, $time, msg, 27)
    `endif



    `ifndef LOG_WARNING
    `define LOG_WARNING(msg) \
            $display("%c[1;33mWARNING:  [%g] %s%c[0m", 27, $time, msg, 27);
    `endif

    `ifndef LOG_ERROR
    `define LOG_ERROR(msg) \
            $display("%c[1;31mERROR:    [%g] %s%c[0m", 27, $time, msg, 27);
    `endif

`else
    `define LOG_INFO(msg)
    `define LOG_INFO_GREEN(msg)
    `define LOG_WARNING(msg)
    `define LOG_ERROR(msg)
`endif
