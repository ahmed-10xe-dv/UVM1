// ╔════════════════════════════════════════════════════════════════════════════╗
// ║                         CLASS: multi_seq                                   ║
// ║     Author      : Ahmed Raza                                               ║
// ║     Date        : 25 Nov 2024                                              ║
// ║     Description : This sequence manages the parallel execution of both     ║
// ║                   instruction and data sequences. It coordinates the       ║
// ║                   interaction between the instruction and data sequences   ║
// ║                   by starting them concurrently in the `body` task.        ║
// ╚════════════════════════════════════════════════════════════════════════════╝

class multi_seq extends uvm_sequence;
    `uvm_object_utils(multi_seq)
    `uvm_declare_p_sequencer (virtual_sequencer)

    mem_model mem;
    inst_sequence inst_seq;
    data_sequence data_seq;

    function new(string name="multi_seq");
      super.new(name);
      inst_seq = inst_sequence::type_id::create("inst_seq");
      data_seq = data_sequence::type_id::create("data_seq");
    endfunction

    virtual task body();
      inst_seq.mem = mem;           // Pass the memory model to both sequences
      data_seq.mem = mem;
      
      fork
        inst_seq.start(p_sequencer.instr_seqr);
        data_seq.start(p_sequencer.data_seqr);
      join
    endtask
endclass
