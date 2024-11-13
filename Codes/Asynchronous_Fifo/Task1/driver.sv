// ============================================================================
// Author: Ahmed Raza
// Date: Nov 13, 2024
// Description: Driver class for async FIFO testbench, managing push and pop
//              operations for the test sequence items, with control over reset 
//              and test flow length handling.
// ============================================================================

class driver extends uvm_driver#(sequence_item);
  `uvm_component_utils(driver);
  
  virtual async_fifo_bfm bfm; // Virtual interface for FIFO communication
  
  // Constructor to initialize driver with name and parent component
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // Build phase: Retrieves the FIFO BFM from UVM configuration
  function void build_phase(uvm_phase phase);
    if(!uvm_config_db #(virtual async_fifo_bfm)::get(null, "*", "bfm", bfm))
      `uvm_fatal("DRIVER", "driver::Failed to get bfm")
  endfunction
      
  // Task for handling FIFO push operation
  task push();
    sequence_item push;
    integer i = 0;
    forever begin 
      if (i < TEST_FLOW_LENGTH - 2) begin
        // Push sequence item with "not last" flag
        seq_item_port.get_next_item(push);
        bfm.push(push.wdata, 1'b0);
        seq_item_port.item_done();
      end else begin
        // Push sequence item with "last" flag when reaching end
        seq_item_port.get_next_item(push);
        bfm.push(push.wdata, 1'b1);
        seq_item_port.item_done();
      end 
      i++;
      if (i > TEST_FLOW_LENGTH - 1) 
        i = 0;
    end
  endtask
    
  // Task for handling FIFO pop operation
  task pop();
    integer i = 0;
    forever begin
      if (i < TEST_FLOW_LENGTH - 2) begin
        bfm.pop(1'b0); // Pop with "not last" flag
      end else 
        bfm.pop(1'b1); // Pop with "last" flag at end of flow
      i++;
      if (i > TEST_FLOW_LENGTH - 1) 
        i = 0;
    end
  endtask
    
  // Run phase: Resets the design, then initiates push and pop tasks
  task run_phase(uvm_phase phase);
    bfm.reset_rdwr();
    $display("Design is reset");
    
    // Concurrent execution of push and pop operations
    fork
      push();
      pop();
    join_none
  endtask
    
endclass
