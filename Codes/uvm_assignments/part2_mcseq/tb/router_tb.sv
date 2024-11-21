/*-----------------------------------------------------------------
File name     : router_tb.sv
Developers    : Kathleen Meade, Brian Dickinson
Created       : 01/04/11
Description   : lab06_vif router testbench instantiates YAPP UVC
Notes         : From the Cadence "SystemVerilog Accelerated Verification with UVM" training
-------------------------------------------------------------------
Copyright Cadence Design Systems (c)2015
-----------------------------------------------------------------*/

//------------------------------------------------------------------------------
//
// CLASS: router_tb
//
//------------------------------------------------------------------------------

class router_tb extends uvm_env;

  // component macro
  `uvm_component_utils(router_tb)

  //New -- Handles for channel env UVC
  channel_env chan0;
  channel_env chan1;
  channel_env chan2;

  //New -- Handles for HBUS ENV
  hbus_env hb_env;

  clock_and_reset_env clk_rst;

  // yapp environment
  yapp_env yapp;
  
  //Hbus_Sequencer
  router_mcsequencer r_mcsqr;

  // Constructor - required syntax for UVM automation and utilities
  function new (string name, uvm_component parent=null);
    super.new(name, parent);
  endfunction : new


  // UVM build_phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    yapp = yapp_env::type_id::create("yapp", this);
 

    //New--- Factory Registeration
    chan0 = channel_env:: type_id::create("chan0", this);
    chan1 = channel_env:: type_id::create("chan1", this);
    chan2 = channel_env:: type_id::create("chan2", this);

    hb_env = hbus_env:: type_id::create("hb_env", this);

    clk_rst = clock_and_reset_env:: type_id::create("clk_rst", this);

    //New -- Set method
    uvm_config_int::set(this, "chan0", "channel_id", 0);
    uvm_config_int::set(this, "chan1", "channel_id", 1);
    uvm_config_int::set(this, "chan2", "channel_id", 2);

    uvm_config_int::set(this, "hb_env", "num_masters", 1);
    uvm_config_int::set(this, "hb_env", "num_slaves", 0);
       r_mcsqr = router_mcsequencer::type_id::create("r_mcsqr", this);


  endfunction : build_phase
  
    // UVM connect_phase
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    r_mcsqr.hbus_seqr = hb_env.masters[0].sequencer;
    r_mcsqr.yapp_seqr = yapp.tx_agent.sequencer;
  endfunction : connect_phase
  

endclass : router_tb
