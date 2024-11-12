// ---------------------------------------------
// |         Hold Test Sequence Class          |
// |-------------------------------------------|
// | Author      : Ahmed Raza                  |
// | Date        : Nov 10                      |
// | Description : This test sequence is       |
// |               designed to verify the      |
// |               counter's behavior when the |
// |               enable signal is deasserted |
// |               (held at 0). The test       |
// |               initially resets the counter|
// |               increments it, and then     |
// |               holds the counter value by  |
// |               disabling the enable signal.|
// ---------------------------------------------

class hold_test extends base_sequence#(sequence_item);
    `uvm_object_utils(hold_test)
    
    // Constructor
    function new(string name="hold_test");
      super.new(name);
    endfunction
    
    // Body task to generate and drive items
    virtual task body();
      sequence_item seq1;
  
      // Applying Initial Reset
      `uvm_info("hold_test", "Applying initial reset to counter...", UVM_LOW)
      
      // Create and drive a sequence item with reset active (rstn = 0)
      seq1 = sequence_item::type_id::create("seq1");
      seq1.rstn.rand_mode(0);       // Disable randomization for rstn
      seq1.rstn = 0;
      start_item(seq1);
      assert(seq1.randomize()) else `uvm_error("SEQ", "Randomization failed for sequence item")
      finish_item(seq1);
  
      // Releasing Reset and Incrementing Counter
      `uvm_info("hold_test", "Releasing reset and applying stimulus to increment counter...", UVM_LOW)
  
      repeat (10) begin
        // Create and drive a sequence item with reset inactive (rstn = 1) and enable active
        seq1 = sequence_item::type_id::create("seq1");
        seq1.rstn.rand_mode(0);    
        seq1.enable.rand_mode(0);   
        seq1.rstn = 1;
        seq1.enable = 1;
        start_item(seq1);
        assert(seq1.randomize()) else `uvm_error("SEQ", "Randomization failed for sequence item")
        finish_item(seq1);
      end

      // Holding Counter Value by Disabling Enable
      `uvm_info("hold_test", "Disabling enable signal to hold counter value...", UVM_LOW)
      
      repeat (5) begin
        // Create and drive a sequence item with reset inactive (rstn = 1) and enable inactive
        seq1 = sequence_item::type_id::create("seq1");
        seq1.rstn.rand_mode(0);     
        seq1.enable.rand_mode(0);   
        seq1.rstn = 1;
        seq1.enable = 0;
        start_item(seq1);
        assert(seq1.randomize()) else `uvm_error("SEQ", "Randomization failed for sequence item")
        finish_item(seq1);
      end
  
      `uvm_info("hold_test", "Hold test sequence complete. Checking if counter value holds when enable is 0.", UVM_LOW)
    endtask : body
    
endclass : hold_test
