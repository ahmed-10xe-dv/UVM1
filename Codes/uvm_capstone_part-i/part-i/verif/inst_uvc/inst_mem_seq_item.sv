// ╔════════════════════════════════════════════════════════════════════════════╗
// ║                         CLASS: inst_mem_seq_item                           ║
// ║     Author      : Ahmed Raza                                               ║
// ║     Date        : 25 Nov 2024                                              ║
// ║     Description : This class defines the `inst_mem_seq_item`, which is a   ║
// ║                   UVM sequence item used for memory operations. It         ║
// ║                   contains fields such as address, data, request, and      ║
// ║                   response validity. The class uses UVM macros for object  ║
// ║                   utilities and field registration.                        ║
// ╚════════════════════════════════════════════════════════════════════════════╝

class inst_mem_seq_item extends uvm_sequence_item;

  bit [bus_params_pkg::BUS_AW-1:0] inst_addr_o;       
  bit [bus_params_pkg::BUS_DW-1:0] inst_rdata_i;     
  bit                              inst_req_o;       
  bit                              inst_rvalid_i;     
  bit                              inst_gnt_i;    

  `uvm_object_utils_begin(inst_mem_seq_item)
    `uvm_field_int(inst_addr_o,    UVM_DEFAULT)   
    `uvm_field_int(inst_req_o,     UVM_DEFAULT)   
    `uvm_field_int(inst_rdata_i,   UVM_DEFAULT)    
    `uvm_field_int(inst_rvalid_i,  UVM_DEFAULT)    
    `uvm_field_int(inst_gnt_i,  UVM_DEFAULT)   
  `uvm_object_utils_end

  `uvm_object_new

endclass : inst_mem_seq_item

