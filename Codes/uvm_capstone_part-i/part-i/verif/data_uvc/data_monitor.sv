// ╔════════════════════════════════════════════════════════════════════════════╗
// ║                              DATA MONITOR                                  ║
// ║     Author      : Ahmed Raza                                               ║
// ║     Date        : 26 Nov 2024                                              ║
// ║     Description : UVM monitor for observing LSU and memory communication.  ║
// ║                   Captures transactions via the `monitor_cb` clocking      ║
// ║                   block and publishes them to the analysis port.           ║
// ╚════════════════════════════════════════════════════════════════════════════╝

class data_monitor extends uvm_monitor;

  virtual data_intf vif;  
  uvm_analysis_port#(data_mem_seq_item) item_collected_port;
  data_mem_seq_item trans_collected;

  `uvm_component_utils(data_monitor)

  function new(string name, uvm_component parent);
      super.new(name, parent);
  endfunction : new

  function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      item_collected_port = new("item_collected_port", this);
      if (!uvm_config_db#(virtual data_intf)::get(this, "", "vif", vif)) begin
        `uvm_fatal(get_type_name(), "Failed to get virtual interface handle")
      end
  endfunction : build_phase

  virtual task run_phase(uvm_phase phase);
      trans_collected = data_mem_seq_item::type_id::create("trans_collected");
      forever begin
        vif.wait_clks(2);

        trans_collected.data_req_o			<= vif.monitor_cb.data_req_o;
        trans_collected.data_addr_o 		<= vif.monitor_cb.data_addr_o;
        trans_collected.data_we_o			<= vif.monitor_cb.data_we_o;
        trans_collected.data_be_o			<= vif.monitor_cb.data_be_o;
        trans_collected.data_wdata_o		<= vif.monitor_cb.data_wdata_o;
        trans_collected.data_gnt_i			<= vif.monitor_cb.data_gnt_i;
        trans_collected.data_rvalid_i		<= vif.monitor_cb.data_rvalid_i;
        trans_collected.data_rdata_i		<= vif.monitor_cb.data_rdata_i;

          // Publish transaction to the analysis port
          item_collected_port.write(trans_collected);
      end
          
  endtask : run_phase

endclass : data_monitor
