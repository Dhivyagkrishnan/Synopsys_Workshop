# Synopsys_Workshop
This Repository holds the complete RTL to GDS II flow of Carry Look Ahead Adder using Synopsys tools
## Tools used in the complete flow
**Tool** | **Description** |
:-----------------:|:---------------:|
`Verdi`            |  Debug & verification tool for RTL analysis and waveform visualization
`Design Compiler`  |  Logic synthesis tool converting RTL to gate-level netlist.
`IC Compiler II`   | Physical design tool for floorplanning , placement, CTS, routing, and GDSII generation
 ##  Unix Basics 
 **Command** | **Operation** |
:-----------:|:---------------:|
`ls`         |  list
`mkdir`      |  make directory 
`cd`         |  change directory  
`pwd`        | Present working directory
`VI Editor`  | Vi test(to create test file):Read mode
`I (or) A`   | Insert or append mode
`cat test`   | displays contents of the file in terminal
`:w`         | to save the content 
`:q`         | to come out of the file 
## Verdi:
## General commands:
1) Open terminal and you can check the present working directory using "pwd"
2) To check the list of folders or files present in the current directory, type "ls"
3) `To make a new folder, type: mkdir <RTL2gdsII>`
4) To change directory type: cd <folder_name>
5) `Create license file and vcs_setup file(if doesn't exist)`
6) `Create verilog code file and testbench file using this command: vi <carry_lookahead_adder>.v and vi <cla_tb.v>`
7) For inserting, press 'i' or 'a'
8) For saving, type ":w" and enter
9) For coming out of the file type ":q" and enter
# Verilog Code for Carry_lookahead_adder
```verilog
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
```
### Testbench_code
```verilog
`timescale 1ns/1ns
 include "carry_lookahead_adder.v" // includes the module definition for the carry_lookhead_adder
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
    $fsdbDumpvars();
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
```
10) Source vcs_setup file and license file using commands:
`source license.txt`
`source vcs_setup`
11) View the contents of the vcs_command file and execute the necessary commands to compile and run the simulation
12) Once the GUI opens, add test cases to the waveform for analysis and use the schematic view to inspect the design.

## Waveform 
![image](https://github.com/user-attachments/assets/82c6a998-7e26-4172-81ba-f367cd024358)
## Design Compiler(DC):
1) Source license file and setup_dc files  (Make sure your present working directory is DC folder)
2) Open run_dc.tcl file and make sure to change your file names in first few lines. (Don't change the name of .sdc file.)
3) Come back to terminal, open the dc shell using the command:
`dc_shell`
4) Source the run_dc.tcl file using:
`source run_dc.tcl`
5) To open the GUI, type:
`start_gui`
6) You can select your verilog file and in the toolbar, go to Schematic>>New Schematic to view the schematic
7) Open the run_dc.tcl file, uncomment and copy paste the last line onto the dc_shell terminal. This will write a mapped file in DC>>results folder. 
8) To get reports, type in terminal:
`report_cell` (For cells report)
`report_timing` (For timing report)
9) For exiting the shell use:
exit
## Schematic of Carry_lookahead_adder
![image](https://github.com/user-attachments/assets/6a2bb935-7205-48fd-ad16-71a82d6ebe21)
## Cell Report 
![image](https://github.com/user-attachments/assets/d367d120-7571-4543-8421-647b418ec7a1)
![cellreport2 (1)](https://github.com/user-attachments/assets/a28bdc64-e407-4e0c-a83a-341f4fb58bfc)
## Timing Report 
![timingreport (1)](https://github.com/user-attachments/assets/82bb4277-6e83-4371-96d7-9ca905b010ae)




 




 
 
 

 
