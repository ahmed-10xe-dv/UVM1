// ---------------------------------------------
// |          Base Sequence Class              |
// |-------------------------------------------|
// | Author      : Ahmed Raza                  |
// | Date        : Nov 10                      |
// | Description : This class defines a base   |
// |               sequence in UVM, which is   |
// |               responsible for generating  |
// |               and driving sequence items |
// |               of type `sequence_item`.   |
// |               The sequence repeats 10    |
// |               times, each time creating  |
// |               a new sequence item,       |
// |               randomizing it, and then   |
// |               finishing it.              |
// ---------------------------------------------

class base_sequence extends uvm_sequence#(sequence_item);
  `uvm_object_utils(base_sequence)

  // Constructor
  function new(string name="base_sequence");
    super.new(name);
  endfunction

  // Body task to generate and drive items
  virtual task body();
    sequence_item seq1;
    
      repeat (10) begin
      // Create sequence item a
      seq1 = sequence_item::type_id::create("seq1");
      // Start item, randomize, and finish item
      start_item(seq1);
      assert(seq1.randomize()) else `uvm_error("SEQ", "Randomization failed for sequence item")
      finish_item(seq1);
    end
  endtask : body

endclass : base_sequence
