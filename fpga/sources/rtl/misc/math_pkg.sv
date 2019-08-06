

package math_pkg;

    function integer clog2(longint value);
        // https://www.xilinx.com/support/answers/44586.html
        value = value-1;
        for (clog2=0; value>0; clog2=clog2+1)
            value = value>>1;
        return clog2;
    endfunction

    function integer clog2_range(longint value);
        // TODO: this is not done properly 
        clog2_range = clog2(value);
    endfunction


endpackage