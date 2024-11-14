//----------------------------------------------------------------------
// File       : fifo_config.sv
// Author     : Ahmed Raza
// Date       : Nov,14 2024
// Description: Configuration class for the asynchronous FIFO, holding
//              flags for transaction count (`num_trans`) and enabling
//              scoreboard checkers (`check_enable`).
//----------------------------------------------------------------------

class fifo_config extends uvm_object;

    `uvm_object_utils(fifo_config)
    
    function new (string name = "fifo_config");
       super.new(name);
    endfunction: new
 
    int num_trans;         // Number of transactions in sequence
    bit check_enable;      // Enable checker flag for scoreboard
 
endclass: fifo_config
