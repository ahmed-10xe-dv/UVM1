// ╔════════════════════════════════════════════════════════════════════════════╗
// ║                              CLASS: inst_agent                             ║
// ║     Author      : Ahmed Raza                                               ║
// ║     Date        : 25 Nov 2024                                              ║
// ║     Description : This class defines the `inst_agent` that contains the    ║
// ║                   driver, sequencer, and monitor components. It handles    ║
// ║                   the build and connect phases of the UVM environment.     ║
// ╚════════════════════════════════════════════════════════════════════════════╝


class inst_agent extends uvm_agent;

  // Driver, Sequencer, and Monitor instances
  inst_driver          driver;
  inst_sequencer       sequencer;
  inst_monitor         monitor;

  `uvm_component_utils(inst_agent)
  `uvm_component_new

  //--------------------------------------------------------------------------
  // FUNCTION: build_phase
  // Instantiates the agent components: monitor, driver, and sequencer
  //--------------------------------------------------------------------------
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    monitor   = inst_monitor::type_id::create("monitor", this);
    driver    = inst_driver::type_id::create("driver", this);
    sequencer = inst_sequencer::type_id::create("sequencer", this);

  endfunction : build_phase

  //--------------------------------------------------------------------------
  // FUNCTION: connect_phase
  // Connects the agent components for data transfer
  //--------------------------------------------------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    driver.seq_item_port.connect(sequencer.seq_item_export); // Connect the sequencer's export to the driver's port
    monitor.item_collected_port.connect(sequencer.fifo_port.analysis_export);  // Connect monitor's analysis port to the sequencer's FIFO analysis export
  endfunction : connect_phase

endclass : inst_agent
