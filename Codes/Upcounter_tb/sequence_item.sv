// ---------------------------------------------
// |          Sequence Item Class              |
// |-------------------------------------------|
// | Author      : Ahmed Raza                  |
// | Date        : Nov 10                      |
// | Description : This class defines a        |
// |               sequence item for use in    |
// |               UVM sequences. The class   |
// |               includes random variables   |
// |               for reset (`rstn`), enable |
// |               (`enable`), and output     |
// |               (`out`). It also contains  |
// |               a constraint that ensures  |
// |               the reset has priority over|
// |               enable by setting enable   |
// |               to 0 when reset is 0.      |
// ---------------------------------------------

class sequence_item extends uvm_sequence_item;
  `uvm_object_utils(sequence_item)

  function new(string name= "sequence_item");
    super.new(name);
  endfunction

  rand bit rstn;
  rand bit enable;
  bit [3:0] out;

  // Constraint to prioritize reset over enable
  constraint priority_constraint {
    if (rstn == 0) {
      enable == 0;
    }
  }
endclass
