// ╔════════════════════════════════════════════════════════════════════════════╗
// ║                            CLASS: inst_driver                             ║
// ║     Author      : Ahmed Raza                                              ║
// ║     Date        : 25 Nov 2024                                             ║
// ║     Description : This class defines the `inst_driver`, which is a UVM   ║
// ║                   driver for handling memory sequence items. It retrieves ║
// ║                   requests, responds with the appropriate data, and      ║
// ║                   controls the response signals. The class implements    ║
// ║                   the `uvm_driver` functionality to integrate with the   ║
// ║                   UVM testbench.                                         ║
// ╚════════════════════════════════════════════════════════════════════════════╝

class inst_driver extends uvm_driver #(inst_mem_seq_item);

  protected virtual inst_intf vif;
  `uvm_component_utils(inst_driver)
  `uvm_component_new

  //--------------------------------------------------------------------------
  // FUNCTION: build_phase
  // Ensures the virtual interface is configured and available
  //--------------------------------------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);  // Call to base class constructor
    if(!uvm_config_db#(virtual inst_intf)::get(this, "", "vif", vif))
      `uvm_fatal(get_full_name(), "Virtual interface not set for Inst Interface")
  endfunction: build_phase

  //--------------------------------------------------------------------------
  // TASK: run_phase
  // Handles the execution of memory sequence items and interacts with the DUT
  //--------------------------------------------------------------------------
  virtual task run_phase(uvm_phase phase);
    inst_mem_seq_item rsp;

    forever begin
        // Retrieve the next sequence item
      `uvm_info(get_type_name(), "Waiting for Request", UVM_MEDIUM)
        seq_item_port.get_next_item(rsp);
        
        if (rsp.inst_req_o) begin    // Check if request signal is asserted

          vif.driver_cb.inst_gnt_i    <= 1'b1;
          vif.wait_clks(1);

          vif.driver_cb.inst_gnt_i    <= 1'b0;
          vif.driver_cb.inst_rvalid_i <= 1'b1;
          vif.driver_cb.inst_rdata_i  <= rsp.inst_rdata_i;

          vif.wait_clks(1);

          vif.driver_cb.inst_rvalid_i <= 1'b0;
        end else begin
          // Clear the response signals
          vif.driver_cb.inst_gnt_i    <= 1'b0;
          vif.driver_cb.inst_rvalid_i <= 1'b0;          
        end

        seq_item_port.item_done();
    end
  endtask : run_phase

endclass : inst_driver
