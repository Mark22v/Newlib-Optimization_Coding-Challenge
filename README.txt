//MARCO VELAZQUEZ

This code was made for the coding challenge of the Newlib Optimization mentorship at LFX

The goal of this code is to improve the execution time of the original proposed code,
taking in consideration that 80% of the times the number of bytes requested for memset
are multiples of 4. This has to be taking in consideration that code size is a mejor concern.

The file "memset_main.s" contains the assembly code of the "main" function, it only makes a
call to memset, and log all the buffer in the console.
The file "memset_routine.s" contains the assembly code of the memset subroutine, it contains 3
different codes, the original code, 1st proposed code and 2nd proposed code, the code that is
not commented is the selected code to submit for the coding challenge.

Finlaly, the is a makefile just to make the compile and linking process a little faster.

