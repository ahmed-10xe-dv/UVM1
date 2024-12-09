// ╔════════════════════════════════════════════════════════════════════════════╗
// ║                            CLASS: inst_sequencer                           ║
// ║     Author      : Ahmed Raza                                              ║
// ║     Date        : 25 Nov 2024                                             ║
// ║     Description : This class defines the `inst_sequencer`, a UVM sequencer ║
// ║                   for memory sequence items. It includes an analysis FIFO  ║
// ║                   port for data collection. The class implements the       ║
// ║                   `uvm_sequencer` functionality and supports easy         ║
// ║                   integration into the UVM testbench.                     ║
// ╚════════════════════════════════════════════════════════════════════════════╝

class inst_sequencer extends uvm_sequencer #(inst_mem_seq_item);

  uvm_tlm_analysis_fifo #(inst_mem_seq_item) fifo_port;
  `uvm_component_utils(inst_sequencer)

  function new (string name, uvm_component parent);
    super.new(name, parent);
    fifo_port = new("fifo_port", this);  // Create new FIFO port for data collection
  endfunction : new

endclass : inst_sequencer
