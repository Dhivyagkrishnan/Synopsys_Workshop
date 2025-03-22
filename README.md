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
3) `Create license file and vcs_setup file(if doesn't exist)`
4) `Create verilog code file and testbench file using this command: vi <carry_lookahead_adder>.v and vi <cla_tb.v>`
5)For inserting, press 'i' or 'a'.
6)For saving, type ":w" and enter.
7)For coming out of the file type ":q" and enter.
