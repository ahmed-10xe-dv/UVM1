//----------------------------------------------------------------------
// File       : test_config.sv
// Author     : Ahmed Raza
// Date       : Nov,14 2024
// Description: Sequence for asynchronous FIFO testbench, utilizing
//              fifo_config settings to control transaction count and 
//              checker enablement in the scoreboard.
//----------------------------------------------------------------------

class test_config extends base_sequence;
    `uvm_object_utils(test_config);
        
    function new(string name = "test_config");
        super.new(name);
    endfunction
    
    // Main task to execute the sequence with specified configuration
    virtual task body();
        repeat (f_cnfg.num_trans) begin
            fifo_push = sequence_item::type_id::create("fifo_push");
            start_item(fifo_push);
            fifo_push.data.constraint_mode(0);
            
            assert(fifo_push.randomize() with {
                fifo_push.wdata >= 48;
                fifo_push.wdata <= 57;
            });
            
            // Display randomized data in ASCII character format
            `uvm_info("Sequence Config Test", "Randomized wdata (Character Format):", UVM_NONE)
            $display("\n-----------------------------------------");
            $display("|  Timestamp  |   wdata (ASCII)         |");
            $display("-----------------------------------------");
            $display("|  %0t  |   %c           |", $time, fifo_push.wdata);
            $display("-----------------------------------------\n");
  
            finish_item(fifo_push); 
        end
    endtask: body
endclass
