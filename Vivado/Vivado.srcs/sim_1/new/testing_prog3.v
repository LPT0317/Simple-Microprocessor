`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2023 06:15:00 PM
// Design Name: 
// Module Name: testing_prog3
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


module testing_prog3();
    reg clk;
    reg reset;
    wire [7:0] prog_data_bus;
    wire [7:0] prog_addr_bus;
    wire [3:0] S_strobe;
    wire [7:0] fact;
    reg [7:0] A;
    reg [7:0] S;
    
    mcp mcp3(
        .clk(clk),
        .reset(reset),
        .in_port_0(A),
        .out_port_1(fact),
        .out_strobe(S_strobe),
        .inst_data_bus(prog_data_bus),
        .inst_address_bus(prog_addr_bus)
    );
    
    program_memory3 pm(
        .address_bus(prog_addr_bus),
        .data_bus(prog_data_bus),
        .reset(reset),
        .program_clk(clk)
    );
    always #5 clk = !clk;

    always @ (negedge(S_strobe[1])) begin
      S <= fact;
      A <= A + 1;
    end
    
    initial begin
        $dumpfile("test.vcd"); 
        $dumpvars(0,testing_prog3); 
        clk <= 0;
        reset <= 1;
        A <= 0;
        #57;
        reset <= 0;
        #53;
        reset <= 1;
        #10507;
        $finish;
    end
endmodule
