// ╔════════════════════════════════════════════════════════════════════════════╗
// ║                             DATA SEQUENCE                                  ║
// ║     Author      : Ahmed Raza                                               ║
// ║     Date        : 25 Nov 2024                                              ║
// ║     Description : Sequence for generating read/write transactions for      ║
// ║                   data interface, including memory operations.             ║
// ╚════════════════════════════════════════════════════════════════════════════╝

class data_sequence extends uvm_sequence#(data_mem_seq_item);

  data_mem_seq_item req;       
  data_mem_seq_item rsp;       
  mem_model         mem;     

  `uvm_object_utils(data_sequence)

  function new(string name = "data_sequence");
      super.new(name);
  endfunction : new

  //--------------------------------------------------------------------------
  // Sequence Body
  //--------------------------------------------------------------------------
  virtual task body();
    // Start and finish request transaction
    req = data_mem_seq_item::type_id::create("req");
    rsp = data_mem_seq_item::type_id::create("rsp");

      forever begin
          start_item(req);  
          finish_item(req);

          req.sprint();
           if (req.data_req_o) begin
                      // Perform write or read operation based on request
                if (req.data_we_o) begin
                    `uvm_info("DATA_SEQ", $sformatf("Writing to address %0h: data %0h", req.data_addr_o, req.data_wdata_o), UVM_LOW)
                    mem.write(req.data_addr_o, req.data_wdata_o);
                end
                else begin
                    `uvm_info("DATA_SEQ", $sformatf("Reading from address %0h", req.data_addr_o), UVM_LOW)
                    req.data_rdata_i = mem.read(req.data_addr_o);
                    `uvm_info("DATA_SEQ", $sformatf("Read from address %0h Data is:%0h ", req.data_addr_o, req.data_rdata_i), UVM_LOW)
                end
           end else `uvm_info("DATA_SEQ", $sformatf("DUT sent no request yet Request is:%0h ", req.data_req_o), UVM_LOW)


          // Start and finish response transaction
          start_item(rsp);
          rsp.copy(req);                // Copy request to response
          finish_item(rsp);
      end
  endtask : body

endclass : data_sequence
