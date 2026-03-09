`timescale 1ns / 1ps

module branch_predictor_tb;

    // Inputs
    reg clk;
    reg rst;
    reg branch_taken;
    reg branch_not_taken;

    // Outputs
    wire prediction;

    // Instantiate the Unit Under Test (UUT)
    branch_predictor uut (
        .clk(clk), 
        .rst(rst), 
        .branch_taken(branch_taken), 
        .branch_not_taken(branch_not_taken), 
        .prediction(prediction)
    );

    // Clock generation (Period = 10ns)
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;      // Start with Reset
        branch_taken = 0;
        branch_not_taken = 0;

        // Wait 20 ns then release reset
        #20;
        rst = 0;
        $display("Reset released. Counts should be 0. Prediction: %b", prediction);

        // --- Scenario 1: Branch Taken occurs ---
        @(posedge clk);
        branch_taken = 1;
        branch_not_taken = 0;
        $display("Input: Branch Taken");
        
        @(posedge clk);
        branch_taken = 0; // Clear input
        // Wait a bit to observe output
        #1; 
        $display("Counts -> Taken: %d, NotTaken: %d | Prediction: %b (Expected: 1)", 
                 uut.taken_count, uut.not_taken_count, prediction);


        // --- Scenario 2: Branch Not Taken occurs twice ---
        @(posedge clk);
        branch_taken = 0;
        branch_not_taken = 1;
        $display("Input: Branch Not Taken");

        @(posedge clk);
        // Keep input high for another clock to simulate another event or just immediate next event
        // For simplicity, let's pulse it per clock.
        // Doing another Not Taken
        branch_not_taken = 1; 
        $display("Input: Branch Not Taken (2nd time)");
        
        @(posedge clk);
        branch_not_taken = 0; 
        #1;
        $display("Counts -> Taken: %d, NotTaken: %d | Prediction: %b (Expected: 0)", 
                 uut.taken_count, uut.not_taken_count, prediction);

        // --- Scenario 3: More Branch Takens to overtake ---
        // Currently Taken: 1, NotTaken: 2. Need >2 Taken for prediction to flip.
        @(posedge clk);
        branch_taken = 1; // Taken becomes 2
        @(posedge clk); 
        branch_taken = 1; // Taken becomes 3
        @(posedge clk);
        branch_taken = 0;
        #1;
        $display("Counts -> Taken: %d, NotTaken: %d | Prediction: %b (Expected: 1)", 
                 uut.taken_count, uut.not_taken_count, prediction);

        // --- Scenario 4: Reset ---
        @(posedge clk);
        rst = 1;
        $display("Input: Reset");
        @(posedge clk);
        rst = 0;
        #1;
        $display("After Reset -> Taken: %d, NotTaken: %d | Prediction: %b (Expected: 0)", 
                 uut.taken_count, uut.not_taken_count, prediction);

        $finish;
    end
      
endmodule
