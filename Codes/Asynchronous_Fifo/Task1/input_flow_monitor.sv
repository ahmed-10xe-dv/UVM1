// ============================================================================
// Author: Ahmed Raza
// Date: Nov 13, 2024
// Description: Input flow monitor class for async FIFO testbench, capturing
//              and publishing data transactions via analysis port.
// ============================================================================

class input_flow_monitor extends uvm_monitor;
  `uvm_component_utils(input_flow_monitor);
  
  uvm_analysis_port #(sequence_item) ap; // Analysis port to send observed transactions
  virtual async_fifo_bfm bfm;            // Virtual interface for FIFO communication
  
  // Constructor to initialize monitor with name and parent component
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // Build phase: Retrieves the FIFO BFM from UVM configuration and initializes analysis port
  function void build_phase(uvm_phase phase);
    if(!uvm_config_db #(virtual async_fifo_bfm)::get(null, "*", "bfm", bfm))
      `uvm_fatal("DRIVER", "driver::Failed to get bfm")
    ap = new("ap", this); // Instantiate analysis port
  endfunction
  
  // Run phase: Continuously monitors wclk and captures data on each negative edge when winc is high
  task run_phase(uvm_phase phase);
    forever begin
      sequence_item push;
      push = new("push"); // Create new sequence item for each transaction
      @(negedge bfm.wclk iff bfm.winc); // Wait for valid write cycle
      push.wdata = bfm.wdata; // Capture data from BFM
      ap.write(push);         // Send captured data to analysis port
    end   
  endtask 
  
endclass
