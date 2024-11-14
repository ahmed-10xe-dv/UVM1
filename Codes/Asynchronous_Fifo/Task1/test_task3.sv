// ============================================================================
// Author: Ahmed Raza
// Date: Nov 13, 2024
// Description: Child sequence class for generating FIFO push transactions.
//              Additional constraints limit the randomized wdata to ASCII 
//              values corresponding to numbers 0-9 only. The randomized wdata 
//              is displayed in ASCII character format for readability.
// ============================================================================

class test_task3 extends base_sequence;
    `uvm_object_utils(test_task3);
    
    
    // Constructor to initialize base sequence
    function new(string name = "test_task3");
      super.new(name);
    endfunction
    
    // Main task body to execute the sequence
    virtual task body();
      repeat (30) begin
        // Create and randomize sequence item for each iteration
        fifo_push = sequence_item::type_id::create("fifo_push");
        start_item(fifo_push);
        fifo_push.data.constraint_mode(0);
        
        assert(fifo_push.randomize() with {
            fifo_push.wdata >= 48;
            fifo_push.wdata <= 57;
        } );
        
        // Display randomized data in ASCII character format for readability
        `uvm_info("Sequence Task3", "Randomized wdata (Character Format):", UVM_NONE)
        $display("\n-----------------------------------------");
        $display("|  Timestamp  |   wdata (ASCII)         |");
        $display("-----------------------------------------");
        $display("|  %0t  |   %c           |", $time, fifo_push.wdata);
        $display("-----------------------------------------\n");
  
        finish_item(fifo_push); 
      end
    endtask: body
    
endclass
