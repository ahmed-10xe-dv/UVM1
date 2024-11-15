`ifndef SLAVE_SEQUENCER_SV
`define SLAVE_SEQUENCER_SV

class slave_sequencer extends uvm_sequencer #(slave_item);

  `uvm_component_utils(slave_sequencer)

  extern function new(string name, uvm_component parent);

endclass : slave_sequencer 


function slave_sequencer::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new



typedef slave_sequencer slave_sequencer_t;


`endif // SLAVE_SEQUENCER_SV

