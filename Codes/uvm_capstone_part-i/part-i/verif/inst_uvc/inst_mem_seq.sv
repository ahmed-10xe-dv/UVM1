// ╔════════════════════════════════════════════════════════════════════════════╗
// ║                         CLASS: inst_sequence                               ║
// ║     Author      : Ahmed Raza                                               ║
// ║     Date        : 25 Nov 2024                                              ║
// ║     Description : This class defines the `inst_sequence`, a UVM sequence   ║
// ║                   used to generate memory request and response items. It   ║
// ║                   interacts with a memory model and a sequencer for        ║
// ║                   generating and processing memory transactions.           ║
// ╚════════════════════════════════════════════════════════════════════════════╝

class inst_sequence extends uvm_sequence#(inst_mem_seq_item);

  inst_mem_seq_item req;  
  inst_mem_seq_item rsp;  
  mem_model mem;    

  `uvm_object_utils(inst_sequence)
  `uvm_declare_p_sequencer(inst_sequencer)     //Taking inst sequencer as a virtual sequence

  function new(string name = "inst_sequence");
    super.new(name);
  endfunction

  virtual task body();

    forever begin
      req = inst_mem_seq_item::type_id::create("req");
      rsp = inst_mem_seq_item::type_id::create("rsp");

      p_sequencer.fifo_port.get(req); // Get request item from sequencer FIFO

      start_item(rsp);
      // Copy request data to response and simulate memory read
      rsp.inst_req_o    = req.inst_req_o;
      rsp.inst_addr_o   = req.inst_addr_o;
      rsp.inst_rdata_i  = mem.read(req.inst_addr_o);  // Memory read
      finish_item(rsp);
    end
  endtask
endclass : inst_sequence
