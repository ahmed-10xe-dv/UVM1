// ---------------------------------------------
// |             Environment Class             |
// |-------------------------------------------|
// | Author      : Ahmed Raza                  |
// | Date        : Nov 12                      |
// | Description : This class defines a UVM    |
// |               environment that creates     |
// |               instances of agent and      |
// |               scoreboard components, and  |
// |               links the monitor's analysis|
// |               port to the scoreboard's    |
// |               implementation port.        |
// ---------------------------------------------

`include "agent.sv"
`include "scoreboard.sv"

class environment extends uvm_env;
  `uvm_component_utils(environment)

  agent agnt;               // Declare agent handle
  scoreboard scb;           // Declare scoreboard handle

  // Constructor
  function new(string name="environment", uvm_component parent);
    super.new(name, parent);
  endfunction : new

  // Build phase to create agent and scoreboard instances
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Create agent instance
    agnt = agent::type_id::create("agnt", this);
    // Create scoreboard instance
    scb = scoreboard::type_id::create("scb", this);
  endfunction : build_phase

  // Connect phase to link agent's monitor port with scoreboard's analysis implementation port
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    // Connect monitor's analysis port to scoreboard's analysis implementation port
    agnt.mon.mon_port.connect(scb.sc_imp);
  endfunction : connect_phase

endclass : environment
