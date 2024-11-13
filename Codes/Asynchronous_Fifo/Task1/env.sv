// ============================================================================
// Author: Ahmed Raza
// Date: Nov 13, 2024
// Description: Environment class for async FIFO testbench, instantiates and 
//              connects the sequencer, driver, monitors, and scoreboard components.
// ============================================================================

class env extends uvm_env;
  `uvm_component_utils(env)
  
  // Environment components
  sequencer              sequencer_h;
  driver                 driver_h;
  input_flow_monitor     input_flow_monitor_h;
  output_flow_monitor    output_flow_monitor_h;
  scoreboard             scoreboard_h;
  
  // Constructor to initialize environment with name and parent component
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // Build phase: Creates instances of environment components
  function void build_phase(uvm_phase phase);
    sequencer_h = new("sequencer_h", this);
    driver_h = driver::type_id::create("driver_h", this);
    input_flow_monitor_h = input_flow_monitor::type_id::create("input_flow_monitor_h", this);
    output_flow_monitor_h = output_flow_monitor::type_id::create("output_flow_monitor_h", this);
    scoreboard_h = scoreboard::type_id::create("scoreboard_h", this);
  endfunction
  
  // Connect phase: Connects analysis ports and exports between components
  function void connect_phase(uvm_phase phase);
    driver_h.seq_item_port.connect(sequencer_h.seq_item_export);
    input_flow_monitor_h.ap.connect(scoreboard_h.input_flow_f.analysis_export);
    output_flow_monitor_h.ap.connect(scoreboard_h.analysis_export);
  endfunction
  
endclass
