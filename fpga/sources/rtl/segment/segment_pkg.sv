

package segment_pkg;

    function integer int_base16_to_segment(logic [4-1:0] value);
        logic [6:0]	seg_value;

		case(value)
		4'h1: seg_value = 7'b1111001;	// ---t----
		4'h2: seg_value = 7'b0100100; 	// |	  |
		4'h3: seg_value = 7'b0110000; 	// lt	 rt
		4'h4: seg_value = 7'b0011001; 	// |	  |
		4'h5: seg_value = 7'b0010010; 	// ---m----
		4'h6: seg_value = 7'b0000010; 	// |	  |
		4'h7: seg_value = 7'b1111000; 	// lb	 rb
		4'h8: seg_value = 7'b0000000; 	// |	  |
		4'h9: seg_value = 7'b0011000; 	// ---b----
		4'ha: seg_value = 7'b0001000;
		4'hb: seg_value = 7'b0000011;
		4'hc: seg_value = 7'b1000110;
		4'hd: seg_value = 7'b0100001;
		4'he: seg_value = 7'b0000110;
		4'hf: seg_value = 7'b0001110;
		4'h0: seg_value = 7'b1000000;
		endcase


    endfunction

    function integer int_base10_to_segment(logic [4-1:0] value);
        logic [6:0]	seg_value;

		case(value)
		4'h1: seg_value = 7'b1111001;	// ---t----
		4'h2: seg_value = 7'b0100100; 	// |	  |
		4'h3: seg_value = 7'b0110000; 	// lt	 rt
		4'h4: seg_value = 7'b0011001; 	// |	  |
		4'h5: seg_value = 7'b0010010; 	// ---m----
		4'h6: seg_value = 7'b0000010; 	// |	  |
		4'h7: seg_value = 7'b1111000; 	// lb	 rb
		4'h8: seg_value = 7'b0000000; 	// |	  |
		4'h9: seg_value = 7'b0011000; 	// ---b----


		4'ha: seg_value = 7'b0000110;  // will put E as an error 
		4'hb: seg_value = 7'b0000110;  // will put E as an error
		4'hc: seg_value = 7'b0000110;  // will put E as an error
		4'hd: seg_value = 7'b0000110;  // will put E as an error
		4'he: seg_value = 7'b0000110;  // will put E as an error
		4'hf: seg_value = 7'b0000110;  // will put E as an error
		4'h0: seg_value = 7'b0000110;  // will put E as an error
		endcase


    endfunction

endpackage