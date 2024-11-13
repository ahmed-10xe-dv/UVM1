// ============================================================================
// Author: Ahmed Raza
// Date: Nov 13, 2024
// Description: Interface for asynchronous FIFO BFM, defining signals and tasks 
//              for write and read operations, along with reset functionality.
// ============================================================================

interface async_fifo_bfm;
  
    // FIFO control and status signals
    bit winc, wclk, wrst_n;            // Write enable, write clock, write reset
    bit rinc, rclk, rrst_n;            // Read enable, read clock, read reset
    logic [FIFO_DATA_WIDTH-1:0] wdata; // Data to write

    // FIFO output signals
    logic [FIFO_DATA_WIDTH-1:0] rdata; // Data to read
    logic wfull;                       // FIFO full status
    logic rempty;                      // FIFO empty status

    // Read and write completion flags
    bit rdDone;
    bit wrDone;
  
    // Task to reset both read and write sides of FIFO
    task reset_rdwr();
        begin
            winc = 0;
            wrst_n = 0;
            rinc = 0;
            rrst_n = 0;
            
            // Wait for reset stabilization
            repeat(6) @(posedge wclk);
            wrst_n = 1'b1;
            repeat(6) @(posedge rclk);
            rrst_n = 1'b1;
        end
    endtask

    // Task to push data into FIFO
    task push(input bit [FIFO_DATA_WIDTH-1:0] data, input bit last);
        begin
            @(posedge wclk);
            while (wfull == 1'b1) begin
                winc = 1'b0;
                wdata = {(FIFO_DATA_WIDTH){1'b0}};
                @(posedge wclk);
            end
            winc = 1'b1;
            wdata = data;

            // If last, stop pushing and set write done flag
            if(last) begin
                @(posedge wclk);
                winc = 1'b0;
                wdata = {(FIFO_DATA_WIDTH){1'b0}};
                repeat(10) @(posedge wclk);
                wrDone = 1;
            end
        end
    endtask : push

    // Task to pop data from FIFO
    task pop(input bit last);
        begin
            @(posedge rclk);

            // Display formatted read status
            $display("\n----------------------------- FIFO Read Status -----------------------------");
            $display("|   Time (ns)   |   rempty   |   rinc   |      rdata      |");
            $display("--------------------------------------------------------------------------");
            $display("| %0t ns       |     %0b      |     %0b    |    %0c    |", 
                     $time, bfm.rempty, bfm.rinc, bfm.rdata);

            while (rempty == 1'b1) begin
                rinc = 1'b0;
                @(posedge rclk);
                $display("| %0t ns       |     %0b      |     %0b    |    %0c    |", 
                         $time, bfm.rempty, bfm.rinc, bfm.rdata);
            end
            $display("--------------------------------------------------------------------------\n");

            rinc = 1'b1;

            // If last, stop popping and set read done flag
            if(last) begin
                @(posedge rclk);
                rinc = 1'b0;
                repeat (10) @(posedge rclk);
                rdDone = 1;
            end
        end
    endtask : pop
    
    // Initial block to generate write and read clocks
    initial begin
        wclk = 1'b0;
        rclk = 1'b0;

        fork
            forever #10ns wclk = ~wclk;
            forever #35ns rclk = ~rclk;     
        join     
    end
  
endinterface
