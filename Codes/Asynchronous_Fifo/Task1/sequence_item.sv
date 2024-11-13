// ============================================================================
// Author: Ahmed Raza
// Date: Nov 13, 2024
// Description: Sequence item class for the FIFO with data fields and constraints.
//              Includes randomized data generation for verification.
// ============================================================================

class sequence_item extends uvm_sequence_item;
  `uvm_object_utils(sequence_item);

  // Constructor to initialize sequence item name
  function new(string name = "sequence_item");
    super.new(name);
  endfunction

  // Data fields for FIFO transaction
  rand logic [FIFO_DATA_WIDTH-1:0] wdata; // Randomized write data
  logic [FIFO_DATA_WIDTH-1:0] rdata;      // Read data (non-randomized)

  // Constraint for wdata to control distribution of random values
  constraint data {
    wdata dist {
      8'h00 := 1,        // 0x00 has specific probability
      [8'h01:8'hFE] := 1, // Mid-range values have equal probability
      8'hFF := 1          // 0xFF has specific probability
    };
  }
  
endclass
