`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:53:00 03/22/2025
// Design Name:   carry_lookahead_adder
// Module Name:   cla_tb.v
// Project Name:  PMKVY
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: carry_lookahead_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;

    reg [7:0] A, B;  // 8-bit inputs A and B
    reg Cin;          // Carry input
    wire [7:0] Sum;   // 8-bit sum output
    wire Cout;        // Carry output

    // Instantiate the carry lookahead adder module
    carry_lookahead_adder cla (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        // Display the output
        $monitor("A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b", A, B, Cin, Sum, Cout);
        
        // Test case 1
        A = 8'b00001111; B = 8'b00000001; Cin = 0;
        #10;
        
        // Test case 2
        A = 8'b11111111; B = 8'b11111111; Cin = 0;
        #10;

        // Test case 3
        A = 8'b01010101; B = 8'b10101010; Cin = 1;
        #10;
        
        // Test case 4
        A = 8'b00000000; B = 8'b00000000; Cin = 1;
        #10;

        // Test case 5
        A = 8'b10101010; B = 8'b01010101; Cin = 0;
        #10;
        
        $finish;  // End the simulation
    end

endmodule

