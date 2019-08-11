


module avalon_st_source (input clk, interface.tx avalon_st);

    int _valid_probability = 50;
    int nb_bytes = $size(avalon_st.data);

    task automatic set_valid_probability(int valid_probability);
        _valid_probability = valid_probability;
    endtask

    task automatic reset();
        _valid_probability = 50;
        avalon_st.valid = 1'b0;
    endtask

    function bit unsigned get_next_valid();
        int unsigned r;
        r = $random();
        return ((r % 100) < _valid_probability);
    endfunction


    /*
        This is a blocking function. It will return only once done sending the packet
    */
    task automatic send_packet_async(packet_pkg::Packet packet);
        bit word_done;
        bit word_count;

        word_count = math_pkg::get_word_count_for_size( nb_bytes, packet.data.size() );
        word_done = 0;

        do begin
            do begin
                avalon_st.valid <= get_next_valid();
                @(posedge clk);
                word_done = avalon_st.valid && avalon_st.ready;
            end while (!word_done);
            
            word_count = word_count -1;

        end while (word_count);


    endtask 


endmodule