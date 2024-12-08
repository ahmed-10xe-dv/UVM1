
// ╔════════════════════════════════════════════════════════════════════════════╗
// ║                         CLASS: base_test                                   ║
// ║     Author      : Ahmed Raza                                               ║
// ║     Date        : 29 Nov 2024                                              ║
// ║     Description : This is the base test class for verifying the DUT. It    ║
// ║                   initializes the environment, sets up the required        ║
// ║                   interfaces, processes command-line arguments, loads      ║
// ║                   binary files into memory, and starts the virtual         ║
// ║                   sequence. It also detects specific instructions such     ║
// ║                   as ECALL and manages the test flow.                      ║
// ╚════════════════════════════════════════════════════════════════════════════╝

class base_test extends uvm_test;

    `uvm_component_utils(base_test)
  
    mem_model mem_model_inst;
    env env_inst;
    multi_seq mult_seq;
  
    virtual inst_intf inst_vif;
    virtual dut_intf dut_if;
    virtual data_intf data_if;
  
    // Command-line processor and variables
    uvm_cmdline_processor cmd_proc;
    string binary_path;
    string cmd_binary_arg;
  
    function new(string name = "base_test", uvm_component parent = null);
      super.new(name, parent);
      // Initialize command-line processor
      cmd_proc = uvm_cmdline_processor::get_inst();
    endfunction : new
  
    //---------------------------------------------------------------------------
    // BUILD PHASE
    // Set up environment, interfaces, and command-line processor
    //---------------------------------------------------------------------------
    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
  
      // Getting virtual interfaces
      if (!uvm_config_db #(virtual inst_intf)::get(null, "*", "vif", inst_vif))
        `uvm_fatal("INTF_ERROR", "Instruction interface not configured");
      if (!uvm_config_db #(virtual data_intf)::get(null, "*", "vif", data_if))
        `uvm_fatal("INTF_ERROR", "Data interface not configured");
      if (!uvm_config_db #(virtual dut_intf)::get(null, "*", "vif", dut_if))
        `uvm_fatal("INTF_ERROR", "DUT probe interface not configured");
  
      // Creating environment, memory model, and virtual sequence
      mem_model_inst = mem_model_pkg::mem_model#()::type_id::create("mem_model_inst");
      env_inst = env::type_id::create("env_inst", this);
      mult_seq = multi_seq::type_id::create("mult_seq");
    endfunction : build_phase
  

    function void end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
      uvm_top.print_topology();
    endfunction : end_of_elaboration_phase
  
    //---------------------------------------------------------------------------
    // RUN PHASE
    // Configure DUT, load binary, and start virtual sequence
    //---------------------------------------------------------------------------
    virtual task run_phase(uvm_phase phase);

      phase.raise_objection(this);

      wait(dut_if.rst_ni);   // Wait for reset deassertion                   
      
      dut_if.fetch_enable_i = 1;
      dut_if.boot_addr_i = 32'h0;                                       

      if (cmd_proc.get_arg_value("+bin=", binary_path)) begin            // Get binary path from command-line argument
          binary_path = binary_path;
      end else begin
          binary_path = "";
          `uvm_fatal("Binary Path Error", "Binary path not correct")
      end
  
      load_binary_to_memory(binary_path);
      mult_seq.mem = mem_model_inst;                  // Pass memory model instance to the virtual sequence
      `uvm_info("BASE_TEST", "Memory loaded from binnary and passed to Multi Sequence", UVM_LOW)

      fork
        mult_seq.start(env_inst.vseqr);                // Start Sequence and monitor ECALL concurrently
        monitor_ecall();
      join_any

      `uvm_info("BASE_TEST", "Test completed, shutting down", UVM_LOW)
      phase.drop_objection(this);
    endtask : run_phase

    //---------------------------------------------------------------------------
    // MONITOR ECALL
    // Waits for an ECALL instruction and deassert fetch
    //---------------------------------------------------------------------------
    task monitor_ecall();
      forever begin
        @(posedge inst_vif.clk);
        if (inst_vif.monitor_cb.inst_rdata_i == 32'h73) begin // ECALL detected
          dut_if.fetch_enable_i <= 0;
          `uvm_info(get_full_name(), "ECALL captured, deasserting fetch", UVM_LOW)
          disable monitor_ecall;
        end
      end
    endtask : monitor_ecall
  
    // ---------------------------------------------------------------------------
    // LOAD BINARY TO MEMORY
    // Reads a binary file and writes its content to memory
    // ---------------------------------------------------------------------------
    function void load_binary_to_memory(string filepath);
      int file_desc;
      bit [7:0] byte_data;
      int read_status;
      int mem_addr = 32'h80; // Start address in memory
  
      file_desc = $fopen(filepath, "rb");
      if (file_desc == 0) begin
        `uvm_fatal("FILE_ERROR", "Unable to open binary file")
        return;
      end
  
      // Read file byte by byte and write to memory
      while (!$feof(file_desc)) begin
        read_status = $fread(byte_data, file_desc);
        if (read_status != 0) begin
          mem_model_inst.write_byte(mem_addr, byte_data);
          mem_addr++;
        end else begin
          `uvm_info("FILE_READ", "End of binary file reached", UVM_LOW)
          break;
        end
      end
  
      $fclose(file_desc);
    endfunction : load_binary_to_memory  
  endclass : base_test
  