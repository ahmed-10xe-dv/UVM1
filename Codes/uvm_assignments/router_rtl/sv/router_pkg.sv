/////////////////////////////////////////////////////////////////////////////////////////
//                                                                                     //
//                                   ROUTER MODULE                                     //
//                                                                                     //
// FILE: router_module.sv                                                              //
// AUTHOR: Ahmed Raza                                                                  //
// DATE: Nov 20, 2024                                                                  //
//                                                                                     //
// DESCRIPTION:                                                                        //
// This package consolidates all components and dependencies for the router module.    //
// It includes UVCs for YAPP, HBUS, and other required packages and modules.           //
//                                                                                     //
/////////////////////////////////////////////////////////////////////////////////////////

package router_pkg;

    // Import UVM base package
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    ///////////////////////////////////////////////////////////
    // Package Imports
    ///////////////////////////////////////////////////////////
    // Import YAPP UVC package
    import yapp_pkg::*;

    // Import channel package
    import channel_pkg::*;

    // Import clock and reset package
    import clock_and_reset_pkg::*;

    // Import HBUS package
    import hbus_pkg::*;

    ///////////////////////////////////////////////////////////
    // Component Declarations
    ///////////////////////////////////////////////////////////
    // Include router components
    `include "router_scoreboard.sv"
    `include "router_reference.sv"
    `include "router_module_env.sv"

endpackage : router_pkg
