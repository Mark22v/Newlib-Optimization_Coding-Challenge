//EXECUTION ENVIROMENT: ALE SIMULATOR
//MARCO VELAZQUEZ


//HERE IS STORED THE BUFFER IN ORDER TO BE PRINTED BY THE 64 SYS CALL
.section .data
array: .fill 1000, 1, 'f'
       .byte 'E','\n'

.section .text
.globl _start
  
    _start:
        //PRECONDITIONS HERE TO TEST MEMSET
        la  a0, array
        li  a1, 'A'
        li  a2, 5
        //call memset

        //CODE TO WATCH THE CHANGES IN CONSOLE
        li  a0, 1
        la  a1, array
        li  a2, 1002
        li  a7, 64
        ecall
        //------------------------------------

    _end:
        li a0, 0            # exit code
        li a7, 93           # syscall exit
        ecall