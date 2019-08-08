#include "Vsimple.h"
#include "verilated.h"

vluint64_t main_time = 0;       // Current simulation time
// This is a 64-bit integer to reduce wrap over issues and
// allow modulus.  You can also use a double, if you wish.


Vsimple* top;

double sc_time_stamp () {       // Called by $time in Verilog
    return main_time;           // converts to double, to match
                                // what SystemC does
}


int main(int argc, char** argv, char** env) {
    Verilated::commandArgs(argc, argv);
    top = new Vsimple;
    
    
    top->reset = 1;
    while (!Verilated::gotFinish()) {
        if (main_time > 11) {
            top->reset = 1;   // Deassert reset
        }
        if ((main_time % 10) == 0) {
            top->clk = 1;       // Toggle clock
        }
        if ((main_time % 10) == 5) {
            top->clk = 0;
        }

        top->eval();
        main_time ++;
    }


    delete top;
    exit(0);
}