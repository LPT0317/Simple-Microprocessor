`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Le Phu Thuan
// 
// Create Date: 03/05/2023 04:30:24 PM
// Design Name: 
// Module Name: ClkDivider
// Project Name: Simple Microprocessor
// Target Devices: Basys3
// Tool Versions: Vivado 2022.2
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ClkDivider(
  input in_clk,
  input reset,
  input [31:0] ratio,
  output reg out_clk
  );
  reg [31:0] count;
  always@(posedge(in_clk)) begin
    if(reset == 0) begin
      count <= 32'd0;
      out_clk <= 1'b0;
    end
    else begin
      count <= count + 1;
      if(count == ratio / 2) begin
        count <= 0;
        out_clk <= ~out_clk;
      end
    end
  end
endmodule
