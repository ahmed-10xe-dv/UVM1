// ╔════════════════════════════════════════════════════════════════════════════╗
// ║                              DATA PACKAGE                                  ║
// ║     Author      : Ahmed Raza                                               ║
// ║     Date        : 25 Nov 2024                                              ║
// ║     Description : Defines the data_pkg containing all components related   ║
// ║                   to the data agent, including monitor, sequencer,         ║
// ║                   driver, and agent classes. Provides reusable imports     ║
// ║                   and exports for UVM-based testbenches.                   ║
// ╚════════════════════════════════════════════════════════════════════════════╝

package data_pkg;

  import uvm_pkg::*;
  import mem_model_pkg::*;


  `include "uvm_macros.svh"


  // Include data component files
  `include "/data_uvc/data_mem_seq_item.sv"
  `include "/data_uvc/data_monitor.sv"
  `include "/data_uvc/data_mem_sequencer.sv"
  `include "/data_uvc/data_driver.sv"
  `include "/data_uvc/data_agent.sv"
  `include "/data_uvc/data_mem_seq.sv"

endpackage : data_pkg
