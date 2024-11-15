`ifndef TOP_TEST_SV
`define TOP_TEST_SV

class top_test extends uvm_test;

  `uvm_component_utils(top_test)

  slave_driver m_driver;
  slave_sequencer m_sequencer;
  slave_default_seq m_default_seq;

  virtual slave_if vif;
  

  extern function new(string name, uvm_component parent);

  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);

  extern task run_phase(uvm_phase phase);

endclass : top_test


function top_test::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new


function void top_test::build_phase(uvm_phase phase);
  // You could modify any test-specific configuration object variables here
  m_driver = slave_driver::type_id::create("m_driver",this);
  m_sequencer = slave_sequencer::type_id::create("m_sequencer",this);
  m_default_seq = slave_default_seq::type_id::create("m_default_seq");
  if (!uvm_config_db #(virtual slave_if)::get(this, "" , "slave_vif", vif))
    `uvm_fatal(get_type_name(), "Could not get virtual slave_if")
endfunction : build_phase


function void top_test::connect_phase(uvm_phase phase);
  m_driver.seq_item_port.connect(m_sequencer.seq_item_export);
endfunction : connect_phase

task top_test::run_phase(uvm_phase phase);
  phase.raise_objection(this);
  wait (vif.rst_n == 1);
  `uvm_info(get_type_name(), "Running test", UVM_LOW)
  m_default_seq.start(m_sequencer);
  repeat (10) @(posedge vif.clk);
  phase.drop_objection(this);
endtask : run_phase


`endif // TOP_TEST_SV

