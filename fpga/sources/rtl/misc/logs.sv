`ifndef INFO
`define INFO(msg) \
        $display("%c[0;37mINFO:     [%g] %s%c[0m", 27, $time, msg, 27)
`endif

`ifndef INFO_GREEN
`define INFO_GREEN(msg) \
        $display("%c[0;32mINFO:     [%g] %s%c[0m", 27, $time, msg, 27)
`endif

`ifndef WARNING
`define WARNING(msg) \
        $display("%c[1;33mWARNING:  [%g] %s%c[0m", 27, $time, msg, 27);
`endif

`ifndef CRITICAL
`define CRITICAL(msg) \
        $display("%c[1;35mCRITICAL: [%g] %s%c[0m", 27, $time, msg, 27);
`endif

`ifndef ERROR
`define ERROR(msg) \
        $display("%c[1;31mERROR:    [%g] %s%c[0m", 27, $time, msg, 27);
`endif