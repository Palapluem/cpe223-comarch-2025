`timescale 1ns / 1ps

// Module: branch_predictor
// Characteristics:
// 1. Two 32-bit unsigned registers: one for branch taken count, one for branch not taken count.
// 2. Inputs: clk, rst, branch_taken, branch_not_taken.
// 3. Output: branch_prediction.
module branch_predictor(
    input wire clk,              // Clock signal
    input wire rst,              // Reset signal (active high)
    input wire branch_taken,     // Signal indicates branch is taken
    input wire branch_not_taken, // Signal indicates branch is not taken
    
    output wire prediction       // Output prediction: 1 = Taken, 0 = Not Taken
);

    // 2 unsigned 32-bit registers
    reg [31:0] taken_count;
    reg [31:0] not_taken_count;

    // Combinational Logic for Prediction
    // "if the number of times branches taken is greater than the number of times branches not taken, then the prediction should be branch will be taken."
    // Otherwise (less than or equal), prediction is 0 (Not Taken).
    assign prediction = (taken_count > not_taken_count) ? 1'b1 : 1'b0;

    // Sequential Logic (Synchronous with Clock)
    always @(posedge clk) begin
        if (rst) begin
            // Reset all internal register values to 0
            taken_count <= 32'd0;
            not_taken_count <= 32'd0;
        end else begin
            // If branch_taken input is 1, add 1 to taken_count
            if (branch_taken) begin
                taken_count <= taken_count + 1;
            end
            
            // If branch_not_taken input is 1, add 1 to not_taken_count
            // Assumption: branch_taken and branch_not_taken will not be 1 at the same time.
            else if (branch_not_taken) begin
                not_taken_count <= not_taken_count + 1;
            end
        end
    end

endmodule
