// ---------------------------------------------
// |             Scoreboard Class              |
// |-------------------------------------------|
// | Author      : Ahmed Raza                  |
// | Date        : Nov 12                      |
// | Description : This class defines a UVM    |
// |               scoreboard that receives    |
// |               sequence items from the     |
// |               monitor, compares them with |
// |               a reference model, and logs |
// |               the results. It includes   |
// |               a method to check if the    |
// |               DUT's output matches the   |
// |               reference model's output.  |
// ---------------------------------------------

`include "uvm_macros.svh"

class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)

  // Analysis imp for receiving data from the monitor
  uvm_analysis_imp #(sequence_item, scoreboard) sc_imp;

  // Declare a handle for the sequence item and reference output
  sequence_item seq1;
  logic [3:0] ref_out;

  // Constructor
  function new(string name = "scoreboard", uvm_component parent);
    super.new(name, parent);
  endfunction : new

  // Build phase to construct analysis imp port and initialize ref_out
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sc_imp = new("sc_imp", this);
    ref_out = 4'b0000;  // Initialize reference output to zero
  endfunction : build_phase

  // Write method to receive sequence item from monitor and compare with reference
  virtual function void write(sequence_item seq);
    `uvm_info(get_type_name(), $sformatf("Inside write method. Received seq from Monitor."), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Printing transaction:\n%s", seq.sprint()), UVM_LOW)

    // Call the reference model to get expected output
    ref_counter(seq.enable, seq.rstn);
    
    // Compare DUT output (from seq) with reference model output
    if (seq.out == ref_out) begin
      `uvm_info("SCOREBOARD", 
        $sformatf("Test Pass: DUT output %0d :: reference model %0d | enable = %0d, rstn = %0d", 
        seq.out, ref_out, seq.enable, seq.rstn), UVM_LOW)
    end 
    else begin
      `uvm_error("SCOREBOARD", 
        $sformatf("Test Fail: DUT output %0d does not match reference %0d | enable = %0d, rstn = %0d", 
        seq.out, ref_out, seq.enable, seq.rstn))
    end
  endfunction : write

  // Reference model task for simulating counter behavior
  task ref_counter(logic enable, logic rstn);
    // Reset reference output if rstn is low, otherwise increment if enabled
    if (!rstn)
      ref_out = 4'b0000;  // Reset counter
    else if (enable)
      ref_out = ref_out + 1;  // Increment counter if enabled
    else
      ref_out = ref_out;
  endtask : ref_counter

endclass : scoreboard
