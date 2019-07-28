



interface avalon_st_if
  #(
    parameter DATAW
    )
   ();
   
    logic                                   valid;
    logic                                   sop;
    logic                                   eop;
    logic                                   error;
    logic [math_pkg::clog2_range(DATAW):0]  empty;   
    logic [DATAW-1:0]                       data;
    logic                                   ready;

    modport rx
    (
     input  valid,
     input  sop,
     input  eop,
     input  error,
     input  empty,
     input  data,
     output ready
     );
    
    modport tx 
    (
     output valid,
     output sop,
     output eop,
     output error,
     output empty,
     output data,
     input  ready
     );

endinterface



   