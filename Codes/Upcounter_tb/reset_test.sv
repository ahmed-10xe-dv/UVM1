// ---------------------------------------------
// |        Reset Test Sequence Class          |
// |-------------------------------------------|
// | Author      : Ahmed Raza                  |
// | Date        : Nov 10                      |
// | Description : This test sequence is       |
// |               designed to verify reset    |
// |               functionality by toggling   |
// |               the reset signal and        |
// |               observing the DUT's behavior|
// ---------------------------------------------

class reset_test extends base_sequence;
    `uvm_object_utils(reset_test)
    
    // Constructor
    function new(string name="reset_test");
      super.new(name);
    endfunction
    
    // Body task to generate and drive items
    virtual task body();
      sequence_item seq1;
  
      // Starting Reset
      `uvm_info("RESET_TEST", "Applying initial reset...", UVM_LOW)
      
      // Create and drive a sequence item with reset active (rstn = 0)
      seq1 = sequence_item::type_id::create("seq1");
      seq1.rstn.rand_mode(0);  // Disable randomization for rstn
      seq1.rstn = 0;
      start_item(seq1);
      assert(seq1.randomize()) else `uvm_error("SEQ", "Randomization failed for sequence item")
      finish_item(seq1);
  
      // Release Reset - Testing functional behavior
      `uvm_info("RESET_TEST", "Releasing reset and applying normal stimulus...", UVM_LOW)
  
      repeat (10) begin
        // Create and drive a sequence item with reset inactive (rstn = 1)
        seq1 = sequence_item::type_id::create("seq1");
        seq1.rstn.rand_mode(0);
        seq1.rstn = 1;
        start_item(seq1);
        assert(seq1.randomize()) else `uvm_error("SEQ", "Randomization failed for sequence item")
        finish_item(seq1);
      end
  
      // Starting Reset Again - Testing reset functionality in active state
      `uvm_info("RESET_TEST", "Reapplying reset to validate reset behavior...", UVM_LOW)
  
      // Create and drive a sequence item with reset active (rstn = 0)
      repeat (2) begin
      seq1 = sequence_item::type_id::create("seq1");
      seq1.rstn.rand_mode(0);
      seq1.rstn = 0;
      start_item(seq1);
      assert(seq1.randomize()) else `uvm_error("SEQ", "Randomization failed for sequence item")
      finish_item(seq1);
      end
  
      `uvm_info("RESET_TEST", "Reset sequence complete.", UVM_LOW)
    endtask : body
    
  endclass : reset_test
  