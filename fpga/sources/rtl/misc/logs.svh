`ifndef LOG_INFO
`define LOG_INFO(msg) \
        $display("%c[0;37mINFO:     [%g] %s%c[0m", 27, $time, msg, 27)
`endif

`ifndef LOG_INFO_GREEN
`define LOG_INFO_GREEN(msg) \
        $display("%c[0;32mINFO:     [%g] %s%c[0m", 27, $time, msg, 27)
`endif

`ifndef LOG_WARNING
`define LOG_WARNING(msg) \
        $display("%c[1;33mWARNING:  [%g] %s%c[0m", 27, $time, msg, 27);
`endif

`ifndef LOG_CRITICAL
`define LOG_CRITICAL(msg) \
        $display("%c[1;35mCRITICAL: [%g] %s%c[0m", 27, $time, msg, 27);
`endif

`ifndef LOG_ERROR
`define LOG_ERROR(msg) \
        $display("%c[1;31mERROR:    [%g] %s%c[0m", 27, $time, msg, 27);
`endif