`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:    11:50:10 03/22/25
// Design Name:    
// Module Name:    carry_lookahead_adder
// Project Name:   
// Target Device:  
// Tool versions:  
// Description:
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module carry_lookahead_adder (
    input [7:0] A,     // 8-bit input A
    input [7:0] B,     // 8-bit input B
    input Cin,         // Carry input
    output [7:0] Sum,  // 8-bit Sum output
    output Cout        // Carry output
);

    wire [7:0] P, G;   // Propagate and Generate
    wire [8:0] C;      // Carry bits (8 carries, 1 final carry out)

    // Generate Propagate (P) and Generate (G) signals
    assign P = A ^ B;   // Propagate: Sum when there's no carry
    assign G = A & B;   // Generate: Carry when both bits are 1

    // Carry lookahead logic
    assign C[0] = Cin;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign C[4] = G[3] | (P[3] & C[3]);
    assign C[5] = G[4] | (P[4] & C[4]);
    assign C[6] = G[5] | (P[5] & C[5]);
    assign C[7] = G[6] | (P[6] & C[6]);
    assign C[8] = G[7] | (P[7] & C[7]);

    // Sum and Carry outputs
    assign Sum = P ^ C[7:0];  // Sum is propagate XOR carry
    assign Cout = C[8];        // Final carry output

endmodule