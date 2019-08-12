

package logger_pkg;

    integer info_counter;
    integer warning_counter;
    integer error_counter; 
    

   function void log_info(string _msg, string _module ="", string _file = "", int _line = 0);
      $display("%c[0;37m %4t    INFO:    %s%c[0m", 27, $time(), _msg, 27);
      info_counter++;
   endfunction // log_info

   function void log_info_green(string _msg, string _module ="", string _file = "", int _line = 0);
      $display("%c[0;32m %4t    INFO:    %s%c[0m", 27, $time(), _msg, 27);
      info_counter++;
   endfunction // log_info

   function void log_warning(string _msg, string _module ="", string _file = "", int _line = 0);
      $display("%c[0;33m %4t    WARNING: %s%c[0m", 27, $time(), _msg, 27);
      warning_counter++;
   endfunction // log_info

   function void log_error(string _msg, string _module ="", string _file = "", int _line = 0);
      $display("%c[0;31m %4t    ERROR:   %s%c[0m", 27, $time(), _msg, 27);
      error_counter++;
   endfunction // log_info

endpackage