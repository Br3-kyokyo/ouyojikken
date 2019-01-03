`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:17:52 10/02/2018 
// Design Name: 
// Module Name:    Kadai1_4 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
/*!
 ���L���W���[���̐ڑ��͈ȉ��̂悤�ɋL�q����B
 Queue2 #(
   //�p�����[�^�̏㏑��
   .WIDTH(WIDTH), .INIT(INIT), .DEPTH(DEPTH)
 ) queue (
   .out(out), .in(in), .reset(reset), .clock(clock)
 );
*/
module Queue2 #(
  //�p�����[�^�̐錾
  parameter WIDTH = 8,
  parameter INIT = 8'b0,
  parameter DEPTH = 16
) (
  //���o�̓|�[�g�̐錾
  output reg [WIDTH - 1: 0] out,
  input [WIDTH - 1: 0] in,
  input reset, clock
);
parameter WIDTH_QUEUE = WIDTH * (DEPTH - 1);

integer i;

// �L���[�̖{��
reg [WIDTH_QUEUE - 1: 0] queue;

always @(posedge clock) begin
  if(reset) begin
    //������
    for(i = 0; i < WIDTH_QUEUE; i = i + WIDTH) begin
      queue[i +: WIDTH] <= INIT;
    end
    out <= INIT;
  end else begin
    out <= queue[0 +: WIDTH];
    queue <= {in, queue[WIDTH_QUEUE - 1: WIDTH]};
  end
end

endmodule