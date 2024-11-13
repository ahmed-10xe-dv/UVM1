// Author: Ahmed Raza
// Date: Nov 13, 2024
// Description: UVM Testbench for async_fifo_base_test class to run sequence and print topology.

class async_fifo_base_test extends uvm_test;
  `uvm_component_utils(async_fifo_base_test)
  
  base_sequence seq;  // Sequence for the test
  env env_h;  // Environment handle
  
  // Constructor: Initializes the testbench name and parent
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  // Build phase: Creates the environment instance
  function void build_phase(uvm_phase phase);
    env_h = env::type_id::create("env_h",this);
  endfunction
  
  // End of elaboration: Prints the UVM topology
  function void end_of_elaboration_phase(uvm_phase phase);
    uvm_top.print_topology();
  endfunction
  
  // Run phase: Starts the sequence and manages objections
  task run_phase(uvm_phase phase);
    seq = new("seq");
    phase.raise_objection(this);  // Raise objection to start sequence
    seq.start(env_h.sequencer_h);  // Start the sequence
    phase.drop_objection(this);    // Drop objection after sequence completion   
  endtask
  
endclass
