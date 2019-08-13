

`ifndef LOGS_SVH
`define LOGS_SVH


`ifdef SIMULATION

    /*
        this implies that the simulation logger has been compiled

    */

    `define DELIM

    `define LOG_INFO(p0, p1=ELIM, p2=ELIM) \
        `ifdef D``p1 \
                            logger_pkg::log_info($sformatf(p0), $sformatf("%m"), `__FILE__, `__LINE__); \
        `else \
            `ifdef D``p2 \
                            logger_pkg::log_info($sformatf(p0, p1), $sformatf("%m"), `__FILE__, `__LINE__); \
            `else \
                            logger_pkg::log_info($sformatf(p0, p1, p2), $sformatf("%m"), `__FILE__, `__LINE__); \
            `endif \
        `endif // !`ifdef D


    `define LOG_INFO_GREEN(p0, p1=ELIM, p2=ELIM) \
        `ifdef D``p1 \
                            logger_pkg::log_info_green($sformatf(p0), $sformatf("%m"), `__FILE__, `__LINE__); \
        `else \
            `ifdef D``p2 \
                            logger_pkg::log_info_green($sformatf(p0, p1), $sformatf("%m"), `__FILE__, `__LINE__); \
            `else \
                            logger_pkg::log_info_green($sformatf(p0, p1, p2), $sformatf("%m"), `__FILE__, `__LINE__); \
            `endif \
        `endif // !`ifdef D


    `define LOG_WARNING(p0, p1=ELIM, p2=ELIM) \
        `ifdef D``p1 \
                            logger_pkg::log_warning($sformatf(p0), $sformatf("%m"), `__FILE__, `__LINE__); \
        `else \
            `ifdef D``p2 \
                            logger_pkg::log_warning($sformatf(p0, p1), $sformatf("%m"), `__FILE__, `__LINE__); \
            `else \
                            logger_pkg::log_warning($sformatf(p0, p1, p2), $sformatf("%m"), `__FILE__, `__LINE__); \
            `endif \
        `endif // !`ifdef D


    `define LOG_ERROR(p0, p1=ELIM, p2=ELIM) \
        `ifdef D``p1 \
                            logger_pkg::log_error($sformatf(p0), $sformatf("%m"), `__FILE__, `__LINE__); \
        `else \
            `ifdef D``p2 \
                            logger_pkg::log_error($sformatf(p0, p1), $sformatf("%m"), `__FILE__, `__LINE__); \
            `else \
                            logger_pkg::log_error($sformatf(p0, p1, p2), $sformatf("%m"), `__FILE__, `__LINE__); \
            `endif \
        `endif // !`ifdef D

`else
    `define LOG_INFO(msg)
    `define LOG_INFO_GREEN(msg)
    `define LOG_WARNING(msg)
    `define LOG_ERROR(msg)
`endif


`endif // `ifndef LOGS_SVH