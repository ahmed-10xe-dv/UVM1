// ============================================================================
// Author: Ahmed Raza
// Date: Nov 13, 2024
// Description: Child sequence class for generating FIFO push transactions. 
//              Includes additional constraints to limit the randomized wdata 
//              to ASCII characters only. The randomized wdata is displayed 
//              in ASCII character format for readability.
// ============================================================================

class  test_new extends base_sequence;
    `uvm_object_utils(test_new);
    
    
    // Constructor to initialize base sequence
    function new(string name = "test_new");
      super.new(name);
    endfunction
    
    // Main task body to execute the sequence
    task body();
      repeat (30) begin
        // Create and randomize sequence item for each iteration
        fifo_push = sequence_item::type_id::create("fifo_push");
        start_item(fifo_push);
        fifo_push.data.constraint_mode(0);
        
        
        assert(fifo_push.randomize() with {
            fifo_push.wdata >= 0;
            fifo_push.wdata <= 127;
        } );
    
        
        // Display randomized data in ASCII character format for readability
        `uvm_info("Sequence_Test New", "Randomized wdata (Character Format):", UVM_NONE)
        $display("\n-----------------------------------------");
        $display("|  Timestamp  |   wdata (ASCII)         |");
        $display("-----------------------------------------");
        $display("|  %0t  |   %c           |", $time, fifo_push.wdata);
        $display("-----------------------------------------\n");
  
        finish_item(fifo_push); 
      end
    endtask: body
    
  endclass
