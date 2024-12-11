
`include "uvm_macros.svh"
import uvm_pkg::*;

// ------------------- transaction class ---------------------
class transaction extends uvm_sequence_item;
    `uvm_object_utils(transaction)

    bit[7:0] din;
    bit wr_enb;
    bit addr;
    bit rst;
    bit[7:0] dout;

    function new(input string name = "transaction");
        super.new(name);
    endfunction
endclass: transaction

// ------------------- driver class ---------------------
class driver extends uvm_driver #(transaction);
    virtual dut_interface vif;
    `uvm_component_utils(driver)

    function new(input string name = "driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        req = transaction::type_id::create("req");
        if (!uvm_config_db #(virtual dut_interface)::get(this, "", "virtual_intf", vif))
            `uvm_fatal(get_type_name(), "Unable to get virtual_intf vif")
    endfunction

    task reset_dut();
        @(posedge vif.clk);
        vif.rst <= '1;
        vif.wr_enb <= '0;
        vif.din <= '0;
        vif.addr <= '0;
        repeat(5) @(posedge vif.clk);
        `uvm_info(get_type_name(), "---- SYSTEM RESET ----", UVM_NONE)
        vif.rst <= '0;
    endtask

    task drive();
        vif.rst <= '0;
        vif.wr_enb <= req.wr_enb;
        vif.addr <= req.addr;

        if (req.wr_enb) begin
            vif.din <= req.din;
            `uvm_info(get_type_name(), $sformatf(" DATA WRITE wr_data %0d", req.din), UVM_NONE)
            repeat(3) @(posedge vif.clk);
        end else begin
            repeat(2) @(posedge vif.clk);
            `uvm_info(get_type_name(), $sformatf(" DATA READ rd_data %0d", vif.dout), UVM_NONE)
            req.dout = vif.dout;
            @(posedge vif.clk);
        end
    endtask

    virtual task run_phase(uvm_phase phase);
        forever begin
            seq_item_port.get_next_item(req);
            drive();
            seq_item_port.item_done();
        end
    endtask
endclass: driver

// ------------------- monitor class ---------------------
class monitor extends uvm_monitor;
    transaction trans;
    virtual dut_interface vif;
    uvm_analysis_port #(transaction) ap;
    `uvm_component_utils(monitor)

    function new(input string name = "monitor", uvm_component parent = null);
        super.new(name, parent);
        ap = new("ap", this);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        trans = transaction::type_id::create("trans");
        if (!uvm_config_db #(virtual dut_interface)::get(this, "", "virtual_intf", vif))
            `uvm_fatal(get_type_name(), "Unable to get virtual_intf vif")
    endfunction

    task collect_data();
        repeat(3) @(posedge vif.clk);
        trans.wr_enb = vif.wr_enb;
        trans.addr = vif.addr;
        trans.din = vif.din;
        trans.dout = vif.dout;
        `uvm_info(get_type_name(), $sformatf(" DATA SEND TO SB wr_enb is %0d, addr is %0d, din is %0d, dout is %0d",
                            trans.wr_enb, trans.addr, trans.din, trans.dout), UVM_NONE)
        ap.write(trans);
    endtask

    virtual task run_phase(uvm_phase phase);
        forever begin
            collect_data();
        end
    endtask
endclass: monitor

// ------------------- agent class ----------------------
class agent extends uvm_agent;
    `uvm_component_utils(agent)
    driver drv;
    uvm_sequencer #(transaction) seqr;
    monitor mon;

    function new(input string name = "agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        drv = driver::type_id::create("drv", this);
        mon = monitor::type_id::create("mon", this);
        seqr = uvm_sequencer #(transaction)::type_id::create("seqr", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        drv.seq_item_port.connect(seqr.seq_item_export);
    endfunction
endclass: agent

// ------------------- scoreboard class ---------------------
class scoreboard extends uvm_scoreboard;
    uvm_analysis_imp #(transaction, scoreboard) aip;
    bit [7:0] temp_data;
    `uvm_component_utils(scoreboard)

    function new(input string name = "scoreboard", uvm_component parent = null);
        super.new(name, parent);
        aip = new("aip", this);
    endfunction

    virtual function void write(input transaction tr);
        `uvm_info(get_type_name(), $sformatf("data rcvd from Monitor ap, wr_enb is %0d, addr is %0d, din is %0d, dout is %0d",
                           tr.wr_enb, tr.addr, tr.din, tr.dout), UVM_NONE)

        if (tr.wr_enb) begin
            if (!tr.addr) begin
                temp_data = tr.din;
                `uvm_info(get_type_name(), $sformatf(" input data is stored %0d", tr.din), UVM_NONE)
            end else begin
                `uvm_info(get_type_name(), " ---- addr != 0 ---- ", UVM_NONE)
            end
        end else begin
            if (!tr.addr) begin
                if (tr.dout == temp_data)
                    `uvm_info(get_type_name(), "---- TEST PASSED ----", UVM_NONE)
                else
                    `uvm_info(get_type_name(), "---- TEST FAILED ----", UVM_NONE)
            end
        end
    endfunction
endclass: scoreboard

// ---------------------- register class ----------------------
class reg0 extends uvm_reg;
    `uvm_object_utils(reg0)
    rand uvm_reg_field f0;

    function new(input string name = "reg0");
        super.new(name, 8, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        f0 = uvm_reg_field::type_id::create("f0");
        f0.configure(
            .parent(this),
            .size(8),
            .lsb_pos(0),
            .access("RW"),
            .volatile(0),
            .reset(0),
            .has_reset(1),
            .is_rand(1),
            .individually_accessible(1)
        );
    endfunction
endclass: reg0

// ----------------------- register block ---------------------
class reg_blk extends uvm_reg_block;
    // Define registers and other functionality as needed.

    `uvm_object_utils(reg_blk)
 
    rand reg0 reg0_h;  // Instance for all registers
 
    function new(input string name = "reg_blk");
       super.new(name, UVM_NO_COVERAGE); // No separate coverage
    endfunction: new
 
    virtual function build();
       reg0_h = reg0::type_id::create("reg0_h");
       reg0_h.build();                // Calling build method of reg0
       reg0_h.configure(this);        // Configure instance of reg0 (this -> parent)


       //------------------------------------------------------------------------------------
      //Task-1    uvm_reg_access_seq
      //------------------------------------------------------------------------------------


       add_hdl_path("DUT", "RTL");    // Adding path for DUT register access
 
       reg0_h.add_hdl_path_slice("tempreg0", 0, 8);
 
       // Adding address map for all registers
       default_map = create_map("default_map", 0, 1, UVM_LITTLE_ENDIAN); // Address map with byte size and endian type
       default_map.add_reg(reg0_h, 'h0, "RW");  // Register instance, offset address, access type
       default_map.set_auto_predict(0);         // Explicit prediction (disable implicit prediction)
       lock_model();                           // Lock model for no further structural changes
    endfunction: build
 
 endclass: reg_blk
 
 
 // ------------------- register_sequence class -------------------
 class register_sequence extends uvm_sequence;
 
    `uvm_object_utils(register_sequence)
 
    reg_blk reg_blk_h;  // Instance of reg_blk
 
    function new(input string name = "register_sequence");
       super.new(name);
    endfunction: new
 
    virtual task body();
       uvm_status_e status;     // To store the status of txn
       bit[7:0] dv_data, mv_data;  // Variables for hardware register
       bit[7:0] random_inp, read_out;  // Variables for random inputs and reading
 
       repeat(5) begin: B1
          // Frontdoor write
          random_inp = $urandom;
          reg_blk_h.reg0_h.write(status, random_inp, UVM_FRONTDOOR);
          dv_data = reg_blk_h.reg0_h.get();              // Get desired variable
          mv_data = reg_blk_h.reg0_h.get_mirrored_value();  // Get mirrored value
 
          `uvm_info(get_type_name(), $sformatf("After frontdoor write method, Desired value is %0d, Mirrored value is %0d", dv_data, mv_data), UVM_NONE)
 
          reg_blk_h.reg0_h.read(status, read_out, UVM_FRONTDOOR);
          dv_data = reg_blk_h.reg0_h.get();              // Get desired variable (backdoor)
          mv_data = reg_blk_h.reg0_h.get_mirrored_value();  // Get mirrored value (backdoor)
 
          `uvm_info(get_type_name(), $sformatf("After frontdoor read method, Desired value is %0d, Mirrored value is %0d, read_out is %0d", dv_data, mv_data, read_out), UVM_NONE)
 
          $display(" ########################## -------------------- #################### ------------------ ######################### ");
       end: B1
    endtask: body
 
 endclass: register_sequence
 


//------------------------------------------------------------------------------------
//Task-2    1. First write and check desired and mirrored value and then read also check desired and mirrored value
//          2. First use the set method with the value of 10 and then use the get() and get_mirrored_value_method()
//          3. Use predict() with 5 and checks what happens
//          4. Use mirror() with UVM_CHECK 
//------------------------------------------------------------------------------------
 


 // ------------------- write_read_sequence class -------------------
 class write_read_sequence extends uvm_sequence;
    
    `uvm_object_utils(write_read_sequence)
    reg_blk reg_blk_handle;
    function new(input string name = "write_read_sequence");
       super.new(name);
    endfunction: new
 
    virtual task body();
       uvm_status_e status;  // To store the status of transactions
       bit[7:0] rdata;
 
       // Specific Write and Read Sequence
       reg_blk_handle.reg0_h.write(status, 8'hFF, UVM_FRONTDOOR);

       

       `uvm_info(get_type_name(), $sformatf("After Write: Desired=0x%0h, Mirrored=0x%0h", reg_blk_handle.reg0_h.get(), reg_blk_handle.reg0_h.get_mirrored_value()), UVM_MEDIUM)
 
       reg_blk_handle.reg0_h.read(status, rdata, UVM_FRONTDOOR);
       `uvm_info(get_type_name(), $sformatf("After Read: Desired=0x%0h, Mirrored=0x%0h, Read Data=0x%0h", reg_blk_handle.reg0_h.get(), reg_blk_handle.reg0_h.get_mirrored_value(), rdata), UVM_MEDIUM);
       
       
       //Setting the RA value to 10
       reg_blk_handle.reg0_h.set(8'h10);
       `uvm_info(get_type_name(), $sformatf("After SET Method: Desired=0x%0h, Mirrored=0x%0h, Read Data=0x%0h", reg_blk_handle.reg0_h.get(), reg_blk_handle.reg0_h.get_mirrored_value(), rdata), UVM_LOW);


       //Using Predict with 5 value
       reg_blk_handle.reg0_h.predict(8'h5);
       `uvm_info(get_type_name(), $sformatf("After predict Method: Desired=0x%0h, Mirrored=0x%0h, Read Data=0x%0h", reg_blk_handle.reg0_h.get(), reg_blk_handle.reg0_h.get_mirrored_value(), rdata), UVM_LOW);

        //Using mirror
        reg_blk_handle.reg0_h.mirror(status, UVM_CHECK);
        `uvm_info(get_type_name(), $sformatf("After predict Method: Desired=0x%0h, Mirrored=0x%0h, Read Data=0x%0h", reg_blk_handle.reg0_h.get(), reg_blk_handle.reg0_h.get_mirrored_value(), rdata), UVM_LOW);



//------------------------------------------------------------------------------------
// Task-3    
//              Use introspection methods in the register sequence:
//              get_full_name();
//              get_n_maps();
//              get_n_bits();
//              get_address();
//              get_rights();
//---------------------------------------


        `uvm_info(get_type_name(), $sformatf(" Full Name=%s", reg_blk_handle.reg0_h.get_full_name()), UVM_LOW);
        `uvm_info(get_type_name(), $sformatf("Number of Address Maps: %0d", reg_blk_handle.reg0_h.get_n_maps()), UVM_LOW);
        
         // Check the rights for reg0_h in the default address map
         `uvm_info(get_type_name(), $sformatf("Register Rights: %s", reg_blk_handle.reg0_h.get_rights()), UVM_LOW);
 
         // Log the number of bits of reg0_h
         `uvm_info(get_type_name(), $sformatf("Register Width (in bits): %0d", reg_blk_handle.reg0_h.get_n_bits()), UVM_LOW);
         
         // Log the address of reg0_h in the specified address map
         `uvm_info(get_type_name(), $sformatf("Register Address: 0x%0h", reg_blk_handle.reg0_h.get_address()), UVM_LOW);
 
    endtask: body
 
 endclass: write_read_sequence
 
 
 // ------------------- adapter class -------------------
 class adapter extends uvm_reg_adapter;
 
    `uvm_object_utils(adapter)
 
    function new(input string name = "adapter");
       super.new(name);
    endfunction: new
 
    // reg2bus: Convert register transaction to bus transaction
    virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
       transaction itm = transaction::type_id::create("itm");
 
       itm.wr_enb = (rw.kind == UVM_WRITE) ? '1 : '0;
       itm.addr   = rw.addr;
       if(itm.wr_enb) itm.din = rw.data;
 
       return itm;
    endfunction: reg2bus
 
    // bus2reg: Convert bus transaction to register transaction
    virtual function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
       transaction itm;
       assert($cast(itm, bus_item));  // Correct child class cast
 
       rw.kind = (itm.wr_enb) ? UVM_WRITE : UVM_READ;
       rw.data = (itm.wr_enb) ? itm.din : itm.dout;
       rw.addr = itm.addr;
       rw.status = UVM_IS_OK;
    endfunction: bus2reg
 
 endclass: adapter
 
 
 // ------------------- env class -------------------
 class env extends uvm_env;
 
    agent agt_h;                 // Instance of agent
    reg_blk reg_blk_h;           // Instance of reg_blk
    adapter adapter_h;           // Instance of adapter
    uvm_reg_predictor #(transaction) predictor_h;  // Instance of predictor
    scoreboard sb_h;
 
    `uvm_component_utils(env)
 
    function new(input string name = "env", uvm_component parent = null);
       super.new(name, parent);
    endfunction: new
 
    // Build phase: Build all lower-level components in a top-down manner
    virtual function void build_phase(uvm_phase phase);
       super.build_phase(phase);
       predictor_h = uvm_reg_predictor #(transaction)::type_id::create("predictor_h", this);
       agt_h = agent::type_id::create("agt_h", this);
       sb_h = scoreboard::type_id::create("sb_h", this);
       reg_blk_h = reg_blk::type_id::create("reg_blk_h", this);
       reg_blk_h.build();  // Call build method of reg_blk
       adapter_h = adapter::type_id::create("adapter_h", this);
    endfunction: build_phase
 
    // Connect phase: Establish connections between components in a bottom-up manner
    virtual function void connect_phase(uvm_phase phase);
       super.connect_phase(phase);
       agt_h.mon.ap.connect(sb_h.aip);  // Connect monitor to scoreboard
       reg_blk_h.default_map.set_sequencer(.sequencer(agt_h.seqr), .adapter(adapter_h));
       reg_blk_h.default_map.set_base_addr(0);
       predictor_h.map = reg_blk_h.default_map;  // Set predictor map
       predictor_h.adapter = adapter_h;          // Set adapter
       agt_h.mon.ap.connect(predictor_h.bus_in);  // Connect monitor to predictor
    endfunction: connect_phase
 
 endclass: env
 
 
 // ------------------- base_test class -------------------
 class base_test extends uvm_test;
 
    env env_h;  // Instance of env
 
    `uvm_component_utils(base_test)
 
    function new(input string name = "base_test", uvm_component parent = null);
       super.new(name, parent);
    endfunction: new
 
    // Build phase: Build all lower-level components
    virtual function void build_phase(uvm_phase phase);
       super.build_phase(phase);
       env_h = env::type_id::create("env", this);
    endfunction: build_phase
 
    // End of elaboration phase: Print topology in a bottom-up manner
    virtual function void end_of_elaboration_phase(uvm_phase phase);
       super.end_of_elaboration_phase(phase);
       uvm_top.print_topology();
    endfunction: end_of_elaboration_phase
 
    // Report phase: Display simulation results
    virtual function void report_phase(uvm_phase phase);
       uvm_report_server svr;
       super.report_phase(phase);
       svr = uvm_report_server::get_server();
       if(svr.get_severity_count(UVM_FATAL) + svr.get_severity_count(UVM_ERROR) > 0) begin
          `uvm_info(get_type_name(), "-------------- TEST FAIL -------------", UVM_NONE)
       end
       else begin
          `uvm_info(get_type_name(), "-------------- TEST PASS -------------", UVM_NONE)
       end
    endfunction: report_phase
 
 endclass: base_test
 
 
/////////////////////////////  test  ////////////////////////////////////



class test extends base_test;

    `uvm_component_utils(test)					// component FR macrow

      //------------------------------------------------------------------------------------
      //Task-1    uvm_reg_bit_bash_seq
      //          uvm_reg_hw_reset_seq
      //------------------------------------------------------------------------------------ 

   uvm_reg_bit_bash_seq bit_bash_seq;
   uvm_reg_hw_reset_seq reset_seq;
   uvm_reg_access_seq access_seq;

  register_sequence reg_seq;					// instance of register_sequence
  write_read_sequence wr_rd_seq;					// instance of register_sequence



    function new(input string name = "test", uvm_component parent = null);
          super.new(name, parent);
    endfunction: new
    

  virtual function void build_phase(uvm_phase phase);		// simply calling super.build_phase bcz parent 
      super.build_phase(phase);				              // build_phase containing a logic corresponding,to config_db and creating the env

      reg_seq = register_sequence::type_id::create("reg_seq");
      reset_seq = uvm_reg_hw_reset_seq::type_id::create("reset_seq");
      bit_bash_seq = uvm_reg_bit_bash_seq::type_id::create("bit_bash_seq");
      access_seq = uvm_reg_access_seq::type_id::create("access_seq");
      wr_rd_seq = write_read_sequence::type_id::create("wr_rd_seq");


  endfunction: build_phase						


    virtual task run_phase(uvm_phase phase);
       int rdata;

       reg_seq.reg_blk_h = env_h.reg_blk_h;
       wr_rd_seq.reg_blk_handle = env_h.reg_blk_h;
       reset_seq.model = env_h.reg_blk_h;  
       bit_bash_seq.model = env_h.reg_blk_h; 
       access_seq.model = env_h.reg_blk_h; 

          phase.raise_objection(this);
            //   reg_seq.start(env_h.agt_h.seqr);


           //------------------------------------------------------------------------------------
           //Task-1    uvm_reg_hw_reset_seq;
           //          uvm_reg_bit_bash_seq;   
           //------------------------------------------------------------------------------------



           //    reset_seq.start(env_h.agt_h.seqr);                 //Reset built in RAL sequence
           //    bit_bash_seq.start(env_h.agt_h.seqr);                //Bit_bash_seq built in RAL sequence


            //------------------------------------------------------------------------------------
           //Task-1    uvm_reg_access_seq
           //------------------------------------------------------------------------------------

           //    access_seq.start(env_h.agt_h.seqr);                //Access Sequence built in RAL sequence



            //------------------------------------------------------------------------------------
           //Task-2    first write and check desired and mirrored value and then read also check desired and mirrored value
           //------------------------------------------------------------------------------------

              wr_rd_seq.start(env_h.agt_h.seqr);



          phase.drop_objection(this);

          phase.phase_done.set_drain_time(this, 300);		// set_drain_time so that all the stimulus process sucessfully

    endtask: run_phase

endclass: test
 

 // ------------------- Top Module -------------------

module top_tb();

    // DUT interface instantiation
    dut_interface vif();
 
    // Design (DUT) instantiation
    register_dut DUT (
        .clk(vif.clk),
        .rst(vif.rst),
        .addr(vif.addr),
        .wr_enb(vif.wr_enb),
        .din(vif.din),
        .dout(vif.dout)
    );
 
    // Initial block for configuration and running test
    initial begin: B1
        vif.clk = '0;
        uvm_config_db #(virtual dut_interface)::set(null, "*", "virtual_intf", vif);
        run_test("test");  // Run the specified test
    end: B1
 
    // Clock generation (time period 20ns)
    always #10 vif.clk = ~vif.clk;
 
    // Initial block for waveform dumping
    initial begin: B2
        $dumpfile("dump.vcd");
        $dumpvars;
    end: B2
 
 endmodule: top_tb
 