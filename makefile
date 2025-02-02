#VARIABLE FOR EASIER NAME THE COMPILER
CC = clang --target=riscv32 -march=rv32gc -mabi=ilp32d -mno-relax 
#memset_challenge.s -c -o memset_challenge.o

#VARIABLE FOR EASIER NAME OF THE LINKER
LL = ld.lld

TARGET = memset_main
MEMSET = memset_routine

OBJECTS = $(TARGET).o $(TARGET).x $(MEMSET).o

$(TARGET): $(TARGET).s $(MEMSET).s
	$(CC) $(TARGET).s -c -o $(TARGET).o
	$(CC) $(MEMSET).s -c -o $(MEMSET).o  
	$(LL) $(TARGET).o $(MEMSET).o -o $(TARGET).x
	
clean:
	rm $(OBJECTS)

