// ---------------------------------------------
// |               Agent Class                 |
// |-------------------------------------------|
// | Author      : Ahmed Raza                  |
// | Date        : Nov 10                      |
// | Description : This class defines a UVM    |
// |               agent that contains the     |
// |               sequencer, driver, and      |
// |               monitor components. The     |
// |               agent is responsible for    |
// |               creating, initializing, and |
// |               connecting these components |
// |               to work together in the UVM |
// |               testbench. It also defines  |
// |               an analysis port to send    |
// |               data to the scoreboard.     |
// ---------------------------------------------

`include "sequence_item.sv"  
`include "monitor.sv"
`include "driver.sv"
`include "sequencer.sv" 

class agent extends uvm_agent;
  `uvm_component_utils(agent)

  // Declare analysis port for communication with scoreboard
  uvm_analysis_port #(sequence_item) agent_port;

  // Declare handles for agent components
  sequencer seqr; 
  monitor mon;
  driver drv;

  // Constructor
  function new(string name = "agent", uvm_component parent);
    super.new(name, parent);
  endfunction : new

  // Build phase to create and initialize sub-components
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Create components with factory
    seqr = sequencer::type_id::create("seqr", this);
    mon = monitor::type_id::create("mon", this);
    drv = driver::type_id::create("drv", this);

    // Initialize the analysis port
    agent_port = new("agent_port", this);
  endfunction : build_phase

  // Connect phase to connect sequencer and monitor
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    // Connect sequencer to driver
    drv.seq_item_port.connect(seqr.seq_item_export);

    // Connect monitor analysis port to agent's analysis port
    mon.mon_port.connect(agent_port);
  endfunction : connect_phase
endclass
