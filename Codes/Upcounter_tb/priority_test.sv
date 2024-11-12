// ---------------------------------------------
// |   Reset and Enable Signal Priority Test   |
// |-------------------------------------------|
// | Author      : Ahmed Raza                  |
// | Date        : Nov 10                      |
// | Description : This test sequence is       |
// |               designed to verify the      |
// |               priority of reset over      |
// |               enable signals in a counter|
// |               DUT. The sequence first    |
// |               resets the counter, then   |
// |               increments the counter and |
// |               tests the behavior of the  |
// |               enable and reset signals  |
// |               individually.              |
// ---------------------------------------------

class priority_test extends base_sequence;
  `uvm_object_utils(priority_test)
  
  // Constructor
  function new(string name="priority_test");
    super.new(name);
  endfunction
  
  // Body task to generate and drive items
  virtual task body();
    sequence_item seq1;

    // Starting Reset
    `uvm_info("priority_test", "Applying initial reset to counter...", UVM_LOW)
    
    // Create and drive a sequence item with reset active (rstn = 0)
    seq1 = sequence_item::type_id::create("seq1");
    seq1.rstn.rand_mode(0);  // Disable randomization for rstn
    seq1.rstn = 0;
    start_item(seq1);
    assert(seq1.randomize()) else `uvm_error("SEQ", "Randomization failed for sequence item")
    finish_item(seq1);

    // Release Reset - Testing priority signal behavior
    `uvm_info("priority_test", "Releasing reset and applying stimulus to increment counter...", UVM_LOW)

    repeat (5) begin
      // Create and drive a sequence item with reset inactive (rstn = 1)
      seq1 = sequence_item::type_id::create("seq1");
      seq1.rstn.rand_mode(0);  
      seq1.enable.rand_mode(0);  
      seq1.rstn = 1;
      seq1.enable = 1;
      start_item(seq1);
      assert(seq1.randomize()) else `uvm_error("SEQ", "Randomization failed for sequence item")
      finish_item(seq1);
      
    end

    repeat (5) begin
      // Create and drive a sequence item with reset inactive (rstn = 1)
      seq1 = sequence_item::type_id::create("seq1");
      seq1.priority_constraint.constraint_mode(0);
      seq1.rstn.rand_mode(0);  
      seq1.enable.rand_mode(0); 
      seq1.rstn = 0;
      seq1.enable = 1;
      start_item(seq1);
      assert(seq1.randomize()) else `uvm_error("SEQ", "Randomization failed for sequence item")
      finish_item(seq1);
      
    end

    `uvm_info("priority_test", "Priority test sequence complete. Verifying counter behavior after reset is deasserted.", UVM_LOW)
  endtask : body
  
endclass : priority_test
