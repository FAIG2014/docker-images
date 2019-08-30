



package pico_second_time_pkg;

    localparam PICO_SECOND = 1;
    localparam [math_pkg::clog2(1000*PICO_SECOND)-1:0]   NANO_SECOND = 1000*PICO_SECOND;
    localparam [math_pkg::clog2(1000*NANO_SECOND)-1:0]   MICRO_SECOND = 1000*NANO_SECOND;
    localparam [math_pkg::clog2(100*MICRO_SECOND)-1:0]   MICRO100_SECOND = 100*MICRO_SECOND;
    localparam [math_pkg::clog2(1000*MICRO_SECOND)-1:0]  MILLI_SECOND = 1000*MICRO_SECOND;
    localparam [math_pkg::clog2(1000*MILLI_SECOND)-1:0]  SECOND = 1000*MILLI_SECOND;
    localparam [math_pkg::clog2(60*SECOND)-1:0]          MINUTE = 60*SECOND;
    localparam [math_pkg::clog2(60*MINUTE)-1:0]          HOUR = 60*MINUTE;
    localparam [math_pkg::clog2(24*HOUR)-1:0]            DAY = 24*HOUR;
    
endpackage


package time_pkg;

    function integer ps_period_for_freq_mz(longint freq_mz);
        integer period_ps;

        period_ps = (1000 * 1000) / freq_mz;

        return period_ps;
    endfunction

    function integer nb_clk_for_time(longint freq_mz, longint time_needed_ns);
        integer period_ps;
        longint time_needed_ps;

        period_ps = ps_period_for_freq_mz(freq_mz);
        time_needed_ps = time_needed_ns * pico_second_time_pkg::NANO_SECOND;


        return time_needed_ps / period_ps;
    endfunction

endpackage