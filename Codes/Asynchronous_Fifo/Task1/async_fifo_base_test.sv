//----------------------------------------------------------------------
// File       : async_fifo_base_test.sv
// Author     : Ahmed Raza
// Date       : Nov 14, 2024
// Description: Base test class for asynchronous FIFO testbench, setting
//              up the environment and configuring the sequence based on
//              fifo_config settings.
//----------------------------------------------------------------------

class async_fifo_base_test extends uvm_test;
  `uvm_component_utils(async_fifo_base_test)
  
  base_sequence seq;       // Sequence for the test
  env env_h;               // Environment handle
  fifo_config f_cnfg;      // Configuration object handle
  
  function new(string name, uvm_component parent = null);
      super.new(name, parent);
  endfunction
  
  // Build phase: Sets up environment and applies configuration
  function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      
      env_h = env::type_id::create("env_h", this);

      f_cnfg = fifo_config::type_id::create("f_cnfg");
      f_cnfg.num_trans = 20;
      f_cnfg.check_enable = 1;
      uvm_config_db#(fifo_config)::set(this, "*", "f_cnfg", f_cnfg);

      seq = base_sequence::type_id::create("seq");
      seq.f_cnfg = f_cnfg;
  endfunction
  
  // End of elaboration phase
  function void end_of_elaboration_phase(uvm_phase phase);
      uvm_top.print_topology();
  endfunction
  
  // Run phase: Starts sequence on the environment's sequencer
  task run_phase(uvm_phase phase);
      phase.raise_objection(this);
      if (env_h != null && env_h.sequencer_h != null)
          seq.start(env_h.sequencer_h);
      else
          `uvm_fatal("SEQ_ERR", "Environment or sequencer is not properly initialized");
      phase.drop_objection(this);
  endtask
endclass
