// ---------------------------------------------
// |          Driver Class                     |
// |-------------------------------------------|
// | Author      : Ahmed Raza                  |
// | Date        : Nov 10                      |
// | Description : This class defines a UVM    |
// |               driver for sequence items  |
// |               of type `sequence_item`.    |
// |               The driver retrieves items |
// |               from the sequencer and drives|
// |               the stimulus to the DUT     |
// |               through the virtual interface|
// |               (`vif`). It also handles   |
// |               retrieving the interface   |
// |               from the config DB and     |
// |               driving signals at each    |
// |               clock cycle.                |
// ---------------------------------------------

class driver extends uvm_driver #(sequence_item); 
  `uvm_component_utils(driver)

  // Virtual interface handle
  virtual count_intf vif;

  // Constructor
  function new (string name = "driver", uvm_component parent);
    super.new(name, parent);
  endfunction: new

  // Build phase to retrieve interface and initialize analysis port
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);

    // Attempt to retrieve the interface from config DB
    if (!uvm_config_db#(virtual count_intf)::get(this, "", "vif", vif)) begin
      `uvm_fatal("DRIVER", "Failed to get count_intf from config DB in driver")
    end
  endfunction: build_phase

  // Run phase to drive stimulus
  task run_phase(uvm_phase phase);
    sequence_item seq1;
    forever begin
      // Create a new sequence item handle
      seq1 = sequence_item::type_id::create("seq1", this);

      // Get the next sequence item from the sequencer
      seq_item_port.get_next_item(seq1);

      // Wait for the positive edge of the clock before driving signals
      @(posedge vif.clk);
      vif.rstn = seq1.rstn;
      vif.enable = seq1.enable;

      // Notify sequencer that the item has been successfully driven
      seq_item_port.item_done();
    end
  endtask: run_phase
endclass
