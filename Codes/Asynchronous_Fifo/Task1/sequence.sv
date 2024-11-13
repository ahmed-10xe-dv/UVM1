// ============================================================================
// Author: Ahmed Raza
// Date: Nov 13, 2024
// Description: Base sequence class for generating FIFO push transactions. 
//              Includes ASCII display of randomized wdata for readability.
// ============================================================================

class base_sequence extends uvm_sequence #(sequence_item);
  `uvm_object_utils(base_sequence);
  
  sequence_item fifo_push; // Sequence item for FIFO transactions
  
  // Constructor to initialize base sequence
  function new(string name = "base_sequence");
    super.new(name);
  endfunction
  
  // Main task body to execute the sequence
  task body();
    repeat (30) begin
      // Create and randomize sequence item for each iteration
      fifo_push = sequence_item::type_id::create("fifo_push");
      start_item(fifo_push);
      assert(fifo_push.randomize());
      
      // Display randomized data in ASCII character format for readability
      `uvm_info("Sequence", "Randomized wdata (Character Format):", UVM_NONE)
      $display("\n-----------------------------------------");
      $display("|  Timestamp  |   wdata (ASCII)         |");
      $display("-----------------------------------------");
      $display("|  %0t  |   %c           |", $time, fifo_push.wdata);
      $display("-----------------------------------------\n");

      finish_item(fifo_push); 
    end
  endtask: body
  
endclass
