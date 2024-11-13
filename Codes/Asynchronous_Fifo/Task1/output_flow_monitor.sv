// ============================================================================
// Author: Ahmed Raza
// Date: Nov 13, 2024
// Description: Output flow monitor class for async FIFO testbench, capturing
//              data read transactions and publishing them through an analysis port.
// ============================================================================

class output_flow_monitor extends uvm_monitor;
  `uvm_component_utils(output_flow_monitor);
  
  uvm_analysis_port #(sequence_item) ap; // Analysis port to broadcast observed transactions
  virtual async_fifo_bfm bfm;            // Virtual interface for FIFO interactions
  
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
  
  // Run phase: Continuously monitors rclk and captures data on each valid read cycle
  task run_phase(uvm_phase phase);
    forever begin
      sequence_item pop;
      pop = new("pop");            // Create new sequence item for each transaction
      @(negedge bfm.rclk iff bfm.rinc); // Wait for valid read initiation
      @(posedge bfm.rclk);         // Sample data on positive edge
      pop.rdata = bfm.rdata;       // Capture data from BFM
      ap.write(pop);               // Send captured data to analysis port
    end
  endtask
  
endclass
