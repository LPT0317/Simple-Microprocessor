`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2023 06:16:24 PM
// Design Name: 
// Module Name: testing_prog1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testing_prog1();
    reg clk;
    reg reset;
    wire [7:0] prog_data_bus;
    wire [7:0] prog_addr_bus;
    wire [3:0] S_strobe;
    wire [7:0] sum;
    reg [7:0] A;
    reg [7:0] B;
    reg [7:0] S;
    
    mcp mcp1(
        .clk(clk),
        .reset(reset),
        .in_port_0(A),
        .in_port_1(B),
        .out_port_0(sum),
        .out_strobe(S_strobe),
        .inst_data_bus(prog_data_bus),
        .inst_address_bus(prog_addr_bus)
    );
    
    program_memory1 pm(
        .address_bus(prog_addr_bus),
        .data_bus(prog_data_bus),
        .reset(reset),
        .program_clk(clk)
    );
    always #5 clk = !clk;

    always @ (negedge(S_strobe[0])) begin
      S <= sum;
    end
    
    initial begin
        $dumpfile("test.vcd"); 
        $dumpvars(0,testing_prog1); 
        clk <= 0;
        reset <= 1;
        A <= 0;
        B <= 0;
        S <= 0;
        #50;
        reset <= 0;
        #50;
        reset <= 1;
        #400;
        A <= 2;
        B <= 3;
        #400;
        A <= 21;
        B <= 100;
        #400;
        $finish;
    end
    
endmodule