// ============================================================================
// Author: Ahmed Raza
// Date: Nov 13, 2024
// Description: Scoreboard class for async FIFO testbench, responsible for
//              comparing expected and actual data and displaying results.
// ============================================================================

class scoreboard extends uvm_subscriber #(sequence_item);
  `uvm_component_utils(scoreboard)
  
  uvm_tlm_analysis_fifo #(sequence_item) input_flow_f; // FIFO for storing expected data
  fifo_config f_cnfg;  //Config object handle
  
  // Constructor to initialize scoreboard with name and parent component
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // Build phase: Instantiates the input flow FIFO
  function void build_phase(uvm_phase phase);
    input_flow_f = new("input_flow_f", this);
    
    // Retrieve the configuration from the config DB
  if (!uvm_config_db#(fifo_config)::get(this, "", "f_cnfg", f_cnfg)) begin
    `uvm_fatal("SCB_CFG", "Configuration object not found in config DB.");
  end
    
  endfunction
  
  // Write function: Retrieves expected data and compares it to actual data
  virtual function void write(sequence_item t);
    sequence_item expected_data;
    input_flow_f.try_get(expected_data); // Get the expected data from FIFO
    
    
    if (f_cnfg.check_enable) begin
    // Display header for data comparison table
    $display("\n---------------------------- Data Comparison ----------------------------");
    $display("|   Time (ns)   |   Expected Data (ASCII)  |    Actual Data (ASCII)    |   Result   |");
    $display("-------------------------------------------------------------------------");

    // Show expected and actual data values
    $display("| %0t ns      |   %c              |   %c               |", $time, expected_data.wdata, t.rdata);

    // Check if expected and actual data match and display the result
    if (expected_data.wdata === t.rdata) begin
      `uvm_info("Sb", "Comparison Passed", UVM_NONE)
      $display("|                    Comparison Result: PASS                          |");
    end
    else begin
      `uvm_info("Sb", "Comparison Failed", UVM_NONE)
      $display("|                    Comparison Result: FAIL                          |");
    end

    $display("-------------------------------------------------------------------------\n");
    end
    
    else `uvm_error("SCB_CFG", "Scoreboard is not enabled in the confihuration")
  endfunction

endclass
