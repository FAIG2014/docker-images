`include "logs.svh"








package packet_pkg;

    typedef bit [7:0] data_t[];



    class Packet;
        data_t      data;
        bit         err;
    

        function automatic Packet copy();
            Packet new_packet;
            new_packet = new();

            new_packet.err = this.err;
            new_packet.data = new [this.size()];

            foreach ( this.data[i] ) begin
                new_packet.data[i] = this.data[i];
            end

            return new_packet;
        endfunction // copy   

        function automatic int size();
            return this.data.size();
        endfunction // size   

        function automatic void make_random(int len, bit err=0);
            this.data = new [len];
            foreach ( this.data[i] ) begin
                this.data[i] = "a"+ $urandom() % ("z"-"a"+1);
            end
            this.err = err;
        endfunction // make_random      

        function automatic bit is_data_equal(ref data_t data_b, input bit expect_equal = 1);
            if (this.data.size() != data_b.size()) begin
                if (expect_equal) begin
                    `LOG_ERROR( $sformatf("Packet data size mismatch match this.data.size=%0d, data_b.size=%0d.", this.data.size(), data_b.size()) );
                end
                return 0;
            end 
            foreach ( this.data[i] ) begin
                if (this.data[i]!=data_b[i]) begin
                    if (expect_equal) begin
                        `LOG_ERROR( $sformatf("Packet data mismatch this.data[%0d]=%0x, data_b[%0d]=%0x.",i, this.data[i], i, data_b[i]) );
                    end
                    return 0;
                end
            end
            return 1;
        endfunction // is_data_equal


        function automatic bit is_packet_equal(ref Packet pkt_b, input bit expect_equal = 1);

            if (this.err != pkt_b.err) begin
                if (expect_equal) begin
                    `LOG_ERROR( $sformatf("Packet error mismatch this.err=%0b, pkt_b.err=%0b.",this.err, pkt_b.err) );
                end
                return 0;
            end
            return this.is_data_equal(pkt_b.data, expect_equal);
        endfunction // is_packet_equal



        function automatic void append_data(ref data_t data_to_append);
            int data_size;
            int data_to_append_size;
            logic[7:0] data_out[];

            data_size = this.size();
            data_to_append_size = data_to_append.size();
            this.data = new[data_size + data_to_append_size](this.data);

            foreach (data_to_append[i]) begin
                this.data[i+data_size] = data_to_append[i];
            end

        endfunction // append_data

    endclass



endpackage