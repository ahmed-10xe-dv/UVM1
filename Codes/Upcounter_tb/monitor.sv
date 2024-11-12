// ---------------------------------------------
// |          Monitor Class                    |
// |-------------------------------------------|
// | Author      : Ahmed Raza                  |
// | Date        : Nov 10                      |
// | Description : This class defines a UVM    |
// |               monitor that samples the    |
// |               DUT signals through a virtual|
// |               interface (`vif`) and sends  |
// |               the captured transactions   |
// |               to the scoreboard through   |
// |               an analysis port. The      |
// |               monitor is responsible for  |
// |               capturing the reset, enable |
// |               and output signals from the|
// |               DUT and sending them for   |
// |               comparison in the scoreboard|
// ---------------------------------------------

class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)

  // Declare analysis port for sending sampled data to the scoreboard
  uvm_analysis_port #(sequence_item) mon_port;

  // Declare sequence item handle and virtual interface
  sequence_item seq1;
  virtual count_intf vif;

  // Constructor
  function new(string name="monitor", uvm_component parent);
    super.new(name, parent);
  endfunction: new

  // Build phase to retrieve interface and initialize analysis port
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // Initialize analysis port
    mon_port = new("mon_port", this);

    // Attempt to retrieve the interface from config DB
    if (!uvm_config_db#(virtual count_intf)::get(this, "", "vif", vif)) begin
      `uvm_fatal("MONITOR", "Failed to get count_intf from config DB in monitor")
    end
  endfunction: build_phase

  // Run phase to sample and send DUT response
  task run_phase(uvm_phase phase);
    forever begin
      // Wait for the clock edge
      @(posedge vif.clk);
      
      // Create a new sequence item for each sampled transaction
      seq1 = sequence_item::type_id::create("seq1", this);

      // Capture signals from the DUT through the interface
      seq1.rstn = vif.rstn;
      seq1.enable = vif.enable;
      seq1.out = vif.out;

      // Send the transaction to the scoreboard
      mon_port.write(seq1);
    end
  endtask: run_phase
endclass
