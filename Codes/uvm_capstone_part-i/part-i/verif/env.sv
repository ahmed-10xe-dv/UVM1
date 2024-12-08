// ╔════════════════════════════════════════════════════════════════════════════╗
// ║                         CLASS: env                                         ║
// ║     Author      : Ahmed Raza                                              ║
// ║     Date        : 29 Nov 2024                                             ║
// ║     Description : The environment class sets up the necessary agents and  ║
// ║                   virtual sequencer for the test. It initializes the data ║
// ║                   and instruction agents, and connects the sequencers     ║
// ║                   during the connect phase.                               ║
// ╚════════════════════════════════════════════════════════════════════════════╝

class env extends uvm_env;

  // Agent declarations
  data_agent   data_agnt;
  inst_agent   inst_agnt;
  virtual_sequencer vseqr;

  `uvm_component_utils(env)
  `uvm_component_new

  // Build phase: Creates agents and virtual sequencer
  function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      data_agnt = data_agent::type_id::create("data_agnt", this);
      inst_agnt = inst_agent::type_id::create("inst_agnt", this);
      vseqr = virtual_sequencer::type_id::create("vseqr", this);
  endfunction : build_phase

  function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      // Connect data and instruction sequencers to the virtual sequencer
      vseqr.data_seqr = data_agnt.sequencer;
      vseqr.instr_seqr = inst_agnt.sequencer;
  endfunction : connect_phase
endclass : env
