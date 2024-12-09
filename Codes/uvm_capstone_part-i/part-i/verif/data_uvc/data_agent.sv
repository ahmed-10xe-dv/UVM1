// #############################################################################
// # File Name: data_agent.sv
// # Description: Defines the `data_agent` class for managing driver, 
// #              sequencer, and monitor components in the UVM testbench.
// # Author: Ahmed Raza
// # Date:   25-Nov-2024
// #############################################################################

class data_agent extends uvm_agent;

  data_driver          driver;    
  data_sequencer       sequencer; 
  data_monitor         monitor;   

  `uvm_component_utils(data_agent)
  `uvm_component_new

  virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      // Create monitor, driver, and sequencer
      monitor   = data_monitor::type_id::create("monitor", this);
      driver    = data_driver::type_id::create("driver", this);
      sequencer = data_sequencer::type_id::create("sequencer", this);
  endfunction : build_phase

  function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      driver.seq_item_port.connect(sequencer.seq_item_export); // Connect driver and sequencer
  endfunction : connect_phase

endclass : data_agent
