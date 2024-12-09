// ╔════════════════════════════════════════════════════════════════════════════╗
// ║                         CLASS: inst_monitor                                ║
// ║     Author      : Ahmed Raza                                               ║
// ║     Date        : 26 Nov 2024                                              ║
// ║     Description : This monitor observes the communication between the LSU  ║
// ║                   and memory. It collects transaction data from the        ║
// ║                   `monitor_cb` clocking block signals and forwards them    ║
// ║                   via an analysis port                                     ║
// ╚════════════════════════════════════════════════════════════════════════════╝

class inst_monitor extends uvm_monitor;

  protected virtual inst_intf vif;
  uvm_analysis_port #(inst_mem_seq_item) item_collected_port; // Analysis port to forward collected transactions
  `uvm_component_utils(inst_monitor)
  `uvm_component_new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_port = new("item_collected_port", this);
    if (!uvm_config_db #(virtual inst_intf)::get(this, "", "vif", vif)) begin
      `uvm_fatal(get_full_name(), "Virtual interface not set for Inst Interface")
    end
  endfunction : build_phase

  //--------------------------------------------------------------------------
  // TASK: run_phase
  // Collects and publishes transactions from the interface signals
  //--------------------------------------------------------------------------
  virtual task run_phase(uvm_phase phase);

    inst_mem_seq_item trans_collected;  // Transaction object to collect data
    trans_collected = inst_mem_seq_item::type_id::create("trans_collected");

    forever begin
      // Collect transaction details from the interface signals
      vif.wait_clks(2);
      trans_collected.inst_req_o          <= vif.monitor_cb.inst_req_o;
      trans_collected.inst_addr_o         <= vif.monitor_cb.inst_addr_o;

      // Forward the collected transaction to the analysis port
      item_collected_port.write(trans_collected);
    end
  endtask : run_phase

endclass : inst_monitor
