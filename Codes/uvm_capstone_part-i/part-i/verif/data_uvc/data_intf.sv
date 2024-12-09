// ╔════════════════════════════════════════════════════════════════════╗
// ║                              INTERFACE                             ║
// ║     Author      : Ahmed Raza                                       ║
// ║     Date        : 25 Nov 2024                                      ║
// ║     Description : Parameterized data interface using               ║
// ║                   bus_params_pkg for communication between         ║
// ║                   LSU and memory.                                  ║
// ╚════════════════════════════════════════════════════════════════════╝

interface data_intf(
  input logic clk // Clock signal
);

  // Import parameters from bus_params_pkg
  import bus_params_pkg::*;

  // Output signals from LSU to memory
  wire                     data_req_o;             
  wire [BUS_AW-1:0]        data_addr_o;           
  wire                     data_we_o;              
  wire [BUS_DBW-1:0]       data_be_o;              
  wire [BUS_DW-1:0]        data_wdata_o;           


  // Input signals from memory to LSU
  wire                     data_gnt_i;             
  wire                     data_rvalid_i;          
  wire [BUS_AW-1:0]        data_rdata_i;           

  // Clocking block for driver
  clocking driver_cb @(posedge clk);
      input    data_req_o;                          
      input    data_addr_o;                         
      input    data_we_o;                            
      input    data_be_o;                            
      input    data_wdata_o;                         
      output   data_gnt_i;                          
      output   data_rvalid_i;                      
      output   data_rdata_i;                       
  endclocking

  // Clocking block for monitor
  clocking monitor_cb @(posedge clk);
      input   data_req_o;                          
      input   data_addr_o;                         
      input   data_we_o;                            
      input   data_be_o;                            
      input   data_wdata_o;                         
      input   data_gnt_i;                          
      input   data_rvalid_i;                       
      input   data_rdata_i;                        
  endclocking

  // Task to wait for specified positive clock cycles
  task automatic wait_clks(input int num);
      repeat (num) @(posedge clk);
  endtask

  // Task to wait for specified negative clock cycles
  task automatic wait_neg_clks(input int num);
      repeat (num) @(negedge clk);
  endtask

endinterface : data_intf
