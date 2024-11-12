// ---------------------------------------------
// |          Sequencer Class                  |
// |-------------------------------------------|
// | Author      : Ahmed Raza                  |
// | Date        : Nov 10                      |
// | Description : This class defines a UVM    |
// |               sequencer for sequence items|
// |               of type `sequence_item`.    |
// |               The sequencer is responsible|
// |               for managing the sequence   |
// |               flow and controlling the    |
// |               execution of the items.     |
// ---------------------------------------------

class sequencer extends uvm_sequencer #(sequence_item);
  `uvm_component_utils(sequencer)

  function new(string name= "sequencer" ,uvm_component parent);
    super.new(name,parent);
  endfunction: new
endclass
