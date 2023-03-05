# Design Simple Microprocessor
# Introduction
An 8-bit soft processor written in Verilog.
# CPU Registers
CPU registers are shown below:
![alt text](image/Register.jpg)
- R0 through R3 are general purpose registers.
- PC is the program counter, which always points to the currently running instruction or its argument. The PC is initialized at address 0x00, so all programs must start there.
- SP is the Stack Pointer, which starts pointing to the end of the RAM memory (address 0xFF), as the stack grows towards lower memory locations.
The stack is used by four instructions: PUSH, POP, BSR, and RET. 
PUSH and POP are used for pushing and popping the general purpose registers to and from the stack, whereas BSR (Branch to SubRoutine) and RET (Return) push and pop the Program Counter respectively. 
## Instruction Set Encoding
![alt text](image/InstructionSetEncoding.jpg)
