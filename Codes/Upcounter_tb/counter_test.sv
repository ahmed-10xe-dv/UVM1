// ---------------------------------------------
// |               Counter Test                |
// |-------------------------------------------|
// | Author      : Ahmed Raza                  |
// | Date        : Nov 12                      |
// | Description : This test class creates an  |
// |               environment, a base sequence |
// |               item, and starts the base   |
// |               sequence on the sequencer.  |
// |               The test also prints the    |
// |               testbench topology at the  |
// |               end of elaboration for     |
// |               debugging purposes.         |
// ---------------------------------------------

`include "environment.sv"
`include "base_sequence.sv"
`include "reset_test.sv"
`include "wrap_test.sv"
`include "hold_test.sv"
`include "priority_test.sv"


class counter_test extends uvm_test;
  `uvm_component_utils(counter_test)
  
  environment env;
  base_sequence seq1;


  function new(string name="counter_test", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = environment::type_id::create("env", this);
    seq1 = base_sequence::type_id::create("seq1", this);
  endfunction

  virtual function void end_of_elaboration();
    uvm_top.print_topology(); // Prints the testbench topology for debugging
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    `uvm_info("TEST_TOP", "Starting base_sequence on sequencer", UVM_LOW);

    seq1.start(env.agnt.seqr);  // Initiate sequence on the sequencer

    phase.drop_objection(this);
    `uvm_info("TEST_TOP", "Test completed", UVM_LOW);
  endtask
endclass
