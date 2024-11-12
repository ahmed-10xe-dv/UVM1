// ---------------------------------------------
// |        Wrap-Around Test Sequence Class    |
// |-------------------------------------------|
// | Author      : Ahmed Raza                  |
// | Date        : Nov 10                      |
// | Description : This test sequence is       |
// |               designed to verify the      |
// |               counter's wrap-around       |
// |               behavior by incrementing the|
// |               counter value beyond 15 and |
// |               observing it reset to 0.    |
// ---------------------------------------------

class wrap_test extends base_sequence;
    `uvm_object_utils(wrap_test)
    
    // Constructor
    function new(string name="wrap_test");
      super.new(name);
    endfunction
    
    // Body task to generate and drive items
    virtual task body();
      sequence_item seq1;
  
      // Starting Reset
      `uvm_info("wrap_test", "Applying initial reset to counter...", UVM_LOW)
      
      // Create and drive a sequence item with reset active (rstn = 0)
      seq1 = sequence_item::type_id::create("seq1");
      seq1.rstn.rand_mode(0);  // Disable randomization for rstn
      seq1.rstn = 0;
      start_item(seq1);
      assert(seq1.randomize()) else `uvm_error("SEQ", "Randomization failed for sequence item")
      finish_item(seq1);
  
      // Release Reset - Testing wrap-around behavior
      `uvm_info("wrap_test", "Releasing reset and applying stimulus to reach wrap-around point...", UVM_LOW)
  
      repeat (20) begin
        // Create and drive a sequence item with reset inactive (rstn = 1)
        seq1 = sequence_item::type_id::create("seq1");
        seq1.rstn.rand_mode(0);  // Keep reset inactive
        seq1.enable.rand_mode(0);  // Keep enable 1
        seq1.rstn = 1;
        seq1.enable = 1;
        start_item(seq1);
        assert(seq1.randomize()) else `uvm_error("SEQ", "Randomization failed for sequence item")
        finish_item(seq1);
        
      end
  
      `uvm_info("wrap_test", "Wrap test sequence complete. Checking counter behavior for reset at 0 after reaching 15.", UVM_LOW)
    endtask : body
    
endclass : wrap_test
