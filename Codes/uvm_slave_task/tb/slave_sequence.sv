`ifndef SLAVE_SEQ_LIB_SV
`define SLAVE_SEQ_LIB_SV

class slave_default_seq extends uvm_sequence #(slave_item);

  `uvm_object_utils(slave_default_seq)

  slave_item req;
  slave_item res;


  extern function new(string name = "");
  extern task body();


endclass : slave_default_seq


function slave_default_seq::new(string name = "");
  super.new(name);
endfunction : new


task slave_default_seq::body();
  `uvm_info(get_type_name(), "Default sequence starting", UVM_HIGH)
    //Add code here

  for (int j = 0; j < 100; j++) begin
    req = slave_item::type_id::create("req");
    start_item(req);
    finish_item(req);


    for (int i = 0; i < 10; i++) begin
        res = slave_item::type_id::create("res");
        start_item(res);
        assert ( res.randomize() with {res.valid==1;});
        finish_item(res);
    end

end

  `uvm_info(get_type_name(), "Default sequence completed", UVM_HIGH)
  res.print();
endtask : body



`endif // SLAVE_SEQ_LIB_SV

