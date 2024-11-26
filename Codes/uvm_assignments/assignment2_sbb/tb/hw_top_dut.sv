/*-----------------------------------------------------------------
File name     : hw_top_dut.sv
Developers    : Kathleen Meade, Brian Dickinson
Created       : 01/04/11
Description   : lab06_vif hardware top module for acceleration
              : instantiates clock generator, interfaces and DUT
Notes         : From the Cadence "SystemVerilog Accelerated Verification with UVM" training
-------------------------------------------------------------------
Copyright Cadence Design Systems (c)2015
-----------------------------------------------------------------*/

module hw_top;

  // Clock and reset signals
  logic [31:0]  clock_period;
  logic         run_clock;
  logic         clock;
  logic         reset;

  // YAPP Interface to the DUT
  yapp_if in0(clock, reset);

  // CLKGEN module generates clock
  clkgen clkgen (
    .clock(clock ),
    .run_clock(run_clock),
    .clock_period(clock_period)
  );

  //New -- Clock and Reset Interface
  clock_and_reset_if clk_and_rst_if(
    .clock(clock ),
    .run_clock(run_clock),
    .clock_period(clock_period),
    .reset(reset)

  );

  //New Instantiation for HBUS and Channel Interface
  hbus_if hb_if(
    .clock(clock),
    .reset(reset)
  );

  channel_if chan0_if(
    .clock(clock),
    .reset(reset)
  );

  channel_if chan1_if(
    .clock(clock),
    .reset(reset)
  );

  channel_if chan2_if(
    .clock(clock),
    .reset(reset)
  );



  yapp_router dut(
    .reset(reset),
    .clock(clock),
    .error(),
    // YAPP interface signals connection
    .in_data(in0.in_data),
    .in_data_vld(in0.in_data_vld),
    .in_suspend(in0.in_suspend),
    // Output Channels
    //Channel 0   
    .data_0(chan0_if.data),
    .data_vld_0(chan0_if.data_vld),
    .suspend_0(chan0_if.suspend),
    //Channel 1   
    .data_1(chan1_if.data),
    .data_vld_1(chan1_if.data_vld),
    .suspend_1(chan1_if.suspend),
    //Channel 2   
    .data_2(chan2_if.data),  
    .data_vld_2(chan2_if.data_vld),
    .suspend_2(chan2_if.suspend),

    // Host Interface Signals
    .haddr(hb_if.haddr),
    .hdata(hb_if.hdata_w),
    .hen(hb_if.hen),
    .hwr_rd(hb_if.hwr_rd));




endmodule
