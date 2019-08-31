

package math_pkg;

    function integer clog2(longint value);
        // https://www.xilinx.com/support/answers/44586.html
        value = value-1;
        for (clog2=0; value>0; clog2=clog2+1)
            value = value>>1;
        return clog2;
    endfunction

    function integer vect_range(longint value);
        vect_range = clog2(value);

        if (vect_range > 0) begin
            return vect_range -1;
        end
        else begin
            return 0;
        end
    endfunction

    function integer get_word_count_for_size(int size, int word_size);
        get_word_count_for_size = size / word_size + (size % word_size? 1 :0);
        return get_word_count_for_size;
    endfunction

endpackage