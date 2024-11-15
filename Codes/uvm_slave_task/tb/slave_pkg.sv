package slave_pkg;

  `include "uvm_macros.svh"

  import uvm_pkg::*;


  `include "slave_item.sv"
  `include "slave_driver.sv"
  `include "slave_sequencer.sv"
  `include "slave_sequence.sv"
  `include "top_test.sv"

endpackage : slave_pkg
