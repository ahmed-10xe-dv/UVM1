// ╔════════════════════════════════════════════════════════════════════╗
// ║                      DATA MEMORY SEQUENCE ITEM                    ║
// ║ Author      : Ahmed Raza                                           ║
// ║ Date        : 25-Nov-2024                                          ║
// ║ Description : Defines the sequence item for data interface         ║
// ║               transactions, encapsulating signals for read and     ║
// ║               write operations. Parameters are derived from the    ║
// ║               bus_params_pkg for consistency and scalability.      ║
// ╚════════════════════════════════════════════════════════════════════╝

class data_mem_seq_item extends uvm_sequence_item;

  bit                                data_req_o;              
  bit [bus_params_pkg::BUS_AW-1:0]   data_addr_o;            
  bit                                data_we_o;               
  bit [bus_params_pkg::BUS_DW-1:0]   data_be_o;               
  bit [bus_params_pkg::BUS_DW-1:0]   data_wdata_o;            
  bit                                data_gnt_i;             
  bit                                data_rvalid_i;           
  bit [bus_params_pkg::BUS_DW-1:0]   data_rdata_i;            

  `uvm_object_utils_begin(data_mem_seq_item)
      `uvm_field_int(data_req_o,             UVM_DEFAULT)
      `uvm_field_int(data_addr_o,            UVM_DEFAULT)
      `uvm_field_int(data_we_o,              UVM_DEFAULT)
      `uvm_field_int(data_be_o,              UVM_DEFAULT)
      `uvm_field_int(data_wdata_o,           UVM_DEFAULT)
      `uvm_field_int(data_gnt_i,             UVM_DEFAULT)
      `uvm_field_int(data_rvalid_i,          UVM_DEFAULT)
      `uvm_field_int(data_rdata_i,           UVM_DEFAULT)
  `uvm_object_utils_end

  `uvm_object_new

endclass : data_mem_seq_item
