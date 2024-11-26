/////////////////////////////////////////////////////////////////////////////////////////
//                                                                                     //
//                                 UVM COMPARER                                        //
//                                                                                     //
// FILE: uvm_comparer.sv                                                               //
// AUTHOR: Ahmed Raza                                                                  //
// DATE: Nov 20, 2024                                                                  //
//                                                                                     //
// DESCRIPTION:                                                                        //
// This file defines the `comp_equal` function to compare a YAPP packet with a         //
// Channel packet using the `uvm_comparer` class. It performs field-wise comparison,   //
// including address, length, payload, and parity, with detailed error reporting.      //
//                                                                                     //
/////////////////////////////////////////////////////////////////////////////////////////

function bit comp_equal(input yapp_packet yp, input channel_packet cp);
    // Create UVM comparer instance
    uvm_comparer comp = new();
 
    ///////////////////////////////////////////////////////////
    // Field-wise Comparison
    ///////////////////////////////////////////////////////////
 
    // Compare addresses
    if (!comp.compare_field("addr", yp.addr, cp.addr, 2)) begin
       `uvm_error("UVM_COMPARER", "Address comparison failed");
       return 0;
    end
 
    // Compare lengths
    if (!comp.compare_field("length", yp.length, cp.length, 8)) begin
       `uvm_error("UVM_COMPARER", "Length comparison failed");
       return 0;
    end
 
    // Compare payloads
    foreach (yp.payload[i]) begin
       if (!comp.compare_field($sformatf("payload[%0d]", i), yp.payload[i], cp.payload[i], 8)) begin
          `uvm_error("UVM_COMPARER", $sformatf("Payload comparison failed at index %0d", i));
          return 0;
       end
    end
 
    // Compare parity
    if (!comp.compare_field("parity", yp.parity, cp.parity, 8)) begin
       `uvm_error("UVM_COMPARER", "Parity comparison failed");
       return 0;
    end
 
    // Return success if all comparisons passed
    return 1;
 endfunction : comp_equal
 