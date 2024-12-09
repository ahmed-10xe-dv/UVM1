// ╔════════════════════════════════════════════════════════════════════════════╗
// ║                         PACKAGE: inst_pkg                                  ║
// ║     Author      : Ahmed Raza                                               ║
// ║     Date        : 25 Nov 2024                                              ║
// ║     Description : This package includes necessary files for the            ║
// ║                   instruction processing environment, including            ║
// ║                   monitor, sequencer, driver, agent, interface, and        ║
// ║                   memory sequence items. It is used to set up the test     ║
// ║                   environment for verifying memory transactions.           ║
// ╚════════════════════════════════════════════════════════════════════════════╝

package inst_pkg;

  import uvm_pkg::*;
  import mem_model_pkg::*;

  `include "uvm_macros.svh"

  // Include inst component files for the environment setup
  `include "/inst_uvc/inst_mem_seq_item.sv"
  `include "/inst_uvc/inst_monitor.sv"
  `include "/inst_uvc/inst_mem_sequencer.sv"
  `include "/inst_uvc/inst_driver.sv"
  `include "/inst_uvc/inst_agent.sv"
  `include "/inst_uvc/inst_mem_seq.sv"

endpackage
