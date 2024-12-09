// ╔════════════════════════════════════════════════════════════════════════════╗
// ║                             DATA SEQUENCER                                 ║
// ║     Author      : Ahmed Raza                                               ║
// ║     Date        : 25 Nov 2024                                              ║
// ║     Description : UVM sequencer for managing data sequence items.          ║
// ╚════════════════════════════════════════════════════════════════════════════╝

class data_sequencer extends uvm_sequencer#(data_mem_seq_item);


  //--------------------------------------------------------------------------
  // UVM Macros and Constructor
  //--------------------------------------------------------------------------
  `uvm_component_utils(data_sequencer)

  function new(string name, uvm_component parent);
      super.new(name, parent);
  endfunction : new

endclass : data_sequencer
