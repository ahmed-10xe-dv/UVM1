//---------------------------------------
// File: component_b.sv
// Description: Implements a consumer component with multiple UVM analysis imp ports 
//              to receive transactions.
// Author: Ahmed Raza
// Date: Nov 7, 2024
//---------------------------------------

class component_b extends uvm_component;
  
  transaction trans;

  // Multiple analysis imp ports
  uvm_analysis_imp#(transaction, component_b) analysis_imp;  // Default analysis imp port
  `uvm_analysis_imp_decl(_port_a)
  `uvm_analysis_imp_decl(_port_b)
  uvm_analysis_imp_port_a #(transaction, component_b) analysis_imp_a;  // Additional imp port A
  uvm_analysis_imp_port_b #(transaction, component_b) analysis_imp_b;  // Additional imp port B
  
  `uvm_component_utils(component_b)

  //--------------------------------------- 
  // Constructor
  //---------------------------------------
  function new(string name, uvm_component parent);
    super.new(name, parent);
    analysis_imp = new("analysis_imp", this);
    analysis_imp_a = new("analysis_imp_a", this);
    analysis_imp_b = new("analysis_imp_b", this);
  endfunction : new
  
  //---------------------------------------
  // Analysis imp port write methods
  //---------------------------------------
  virtual function void write_port_a(transaction trans);
    `uvm_info(get_type_name(), $sformatf("Inside write_port_a method. Received transaction on Analysis Imp Port A"), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Transaction Details:\n %s", trans.sprint()), UVM_LOW)
  endfunction

  virtual function void write_port_b(transaction trans);
    `uvm_info(get_type_name(), $sformatf("Inside write_port_b method. Received transaction on Analysis Imp Port B"), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Transaction Details:\n %s", trans.sprint()), UVM_LOW)
  endfunction

  virtual function void write(transaction trans);
    `uvm_info(get_type_name(), $sformatf("Inside write method. Received transaction on default Analysis Imp Port"), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Transaction Details:\n %s", trans.sprint()), UVM_LOW)
  endfunction

endclass : component_b
