
// Author: Ahmed Raza
// Date: December 12, 2024
// Description: UVM Register classes for the top module design.

class cntrl extends uvm_reg;
  `uvm_object_utils(cntrl)

  rand uvm_reg_field regf1;
  rand uvm_reg_field regf2;
  rand uvm_reg_field regf3;
  rand uvm_reg_field regf4;

  function new(string name = "cntrl");
    super.new(name, 4, UVM_NO_COVERAGE);
  endfunction

  virtual function void build_phase();
    regf1 = uvm_reg_field::type_id::create("regf1");
    regf2 = uvm_reg_field::type_id::create("regf2");
    regf3 = uvm_reg_field::type_id::create("regf3");
    regf4 = uvm_reg_field::type_id::create("regf4");

    regf1.configure(this, 1, 0, "RW", 0, 0, 1, 1, 0);
    regf2.configure(this, 1, 1, "RW", 0, 0, 1, 1, 0);
    regf3.configure(this, 1, 2, "RW", 0, 0, 1, 1, 0);
    regf4.configure(this, 1, 3, "RW", 0, 0, 1, 1, 0);
  endfunction
endclass

class reg1 extends uvm_reg;
  `uvm_object_utils(reg1)

  rand uvm_reg_field datainput1;

  function new(string name = "reg1");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build_phase();
    datainput1 = uvm_reg_field::type_id::create("datainput1");
    datainput1.configure(this, 32, 0, "RW", 0, 0, 1, 1, 0);
  endfunction
endclass

class reg2 extends uvm_reg;
  `uvm_object_utils(reg2)

  rand uvm_reg_field datainput2;

  function new(string name = "reg2");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build_phase();
    datainput2 = uvm_reg_field::type_id::create("datainput2");
    datainput2.configure(this, 32, 0, "RW", 0, 0, 1, 1, 0);
  endfunction
endclass

class reg3 extends uvm_reg;
  `uvm_object_utils(reg3)

  rand uvm_reg_field datainput3;

  function new(string name = "reg3");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build_phase();
    datainput3 = uvm_reg_field::type_id::create("datainput3");
    datainput3.configure(this, 32, 0, "RW", 0, 0, 1, 1, 0);
  endfunction
endclass

class reg4 extends uvm_reg;
  `uvm_object_utils(reg4)

  rand uvm_reg_field datainput4;

  function new(string name = "reg4");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  virtual function void build_phase();
    datainput4 = uvm_reg_field::type_id::create("datainput4");
    datainput4.configure(this, 32, 0, "RW", 0, 0, 1, 1, 0);
  endfunction
endclass
