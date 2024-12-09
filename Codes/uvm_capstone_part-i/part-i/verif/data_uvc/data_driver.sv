//==============================================================================╗
// CLASS: data_driver                                                           ║
//------------------------------------------------------------------------------║
// DESCRIPTION:                                                                 ║
// This driver implements the protocol used by the LSU to communicate with      ║    
// a memory module. The LSU sends requests through data_req_o and expects       ║
// responses via data_rvalid_i. This protocol supports in-order handling of     ║ 
// multiple outstanding requests with grant and valid signaling for data        ║
// transfers.                                                                   ║
//                                                                              ║
// DATE:   26 Nov 2024                                                          ║
// AUTHOR: Ahmed Raza                                                           ║     
//==============================================================================╝
class data_driver extends uvm_driver #(data_mem_seq_item);

  virtual data_intf vif; 
  `uvm_component_utils(data_driver)

  function new(string name = "data_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db #(virtual data_intf)::get(this, "", "vif", vif)) begin
      `uvm_fatal(get_type_name(), "Failed to get virtual interface handle")
    end
  endfunction : build_phase

  virtual task run_phase(uvm_phase phase);
    data_mem_seq_item req; 
    data_mem_seq_item rsp;
    forever begin
      `uvm_info(get_type_name(), "In DATA-Driver: Waiting for data from sequencer", UVM_MEDIUM)
    
      seq_item_port.get_next_item(req);
      vif.wait_clks(1);

      req.data_addr_o         <= vif.driver_cb.data_addr_o;
      req.data_req_o          <= vif.driver_cb.data_req_o;
      req.data_we_o           <= vif.driver_cb.data_we_o;
      req.data_be_o           <= vif.driver_cb.data_be_o;
      req.data_wdata_o        <= vif.driver_cb.data_wdata_o;

      `uvm_info("DATA_DRIVER", $sformatf("After Dummy request values of DUT response :   Request %0h", vif.driver_cb.data_req_o), UVM_LOW)


      seq_item_port.item_done(); 

      // Handle LSU request and memory response
      seq_item_port.get_next_item(rsp);
      if (rsp.data_req_o) begin                                   //Check for request                           
        vif.driver_cb.data_gnt_i      <= 1'b1;                    // Grant signal

        vif.wait_clks(1);

        vif.driver_cb.data_rvalid_i   <= 1'b1;                  
        vif.driver_cb.data_rdata_i    <= rsp.data_rdata_i;       // Send response data to dut

        vif.wait_clks(1);
    
        vif.driver_cb.data_rvalid_i   <= 1'b0;                   // Clear response signals
      end
      else begin
        vif.driver_cb.data_gnt_i      <= 1'b0;
        vif.driver_cb.data_rvalid_i   <= 1'b0;
      end
      seq_item_port.item_done();                               
    end
  endtask : run_phase
endclass : data_driver



