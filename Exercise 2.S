.data                                                    # Program data are placed below the .data directive
str1: .asciiz "Please enter the size of the Fibonacci sequence:"          #Text that is going to be used later
str2: .asciiz " "
int1: .word 0       # First integer variable, initialized to 0
int2: .word 1      # Second integer variable, initialized to 1
sum: .word 0         # Variable for storing the sum of the two integers


.text               # Program is placed under the .text directive
main:                #The program's main method

la $a0, str1     #ask for the first number          
li $v0, 4          #The system calls for a value to print the string  
syscall          #execute a system call

li $v0, 5        #get the first number
syscall
move $t1, $v0

lw $s0, int1         # Load register $s0 with the value of int1
lw $s1, int2         # Load register $s1 with the value of int2

sub $t1,3          #Reduce the users entry by 3 for printing reasons later

move $a0 , $s0        # To print an integer, it should be first stored to register $a0
li $v0, 1            # System call value for print_int
syscall

la $a0, str2     #prints space        
li $v0, 4          #The system calls for a value to print the string  
syscall          #execute a system call


move $a0 , $s1        # To print an integer, it should be first stored to register $a0
li $v0, 1            # System call value for print_int
syscall

la $a0, str2     #prints space         
li $v0, 4          #The system calls for a value to print the string  
syscall          #execute a system call


#loop
loop:
bgt $t0,$t1,exit
 addi $t0,$t0,1

add $s0, $s0, $s1    # Add the two registers and place the sum in $s0

sw $s0, sum          # Store the sum in memory (in variable sum)
sw $s1, int2           # Store the int2 in memory 

lw $s0 , int2          # Load register $s0 with the value of int2
lw $s1 , sum            # Load register $s1 with the value of sum
move $a0 , $s1        # To print an integer, it should be first stored to register $a0
li $v0, 1            # System call value for print_int
syscall

la $a0, str2     #ask for the first number          
li $v0, 4          #The system calls for a value to print the string  
syscall          #execute a system call

#loop
j loop
exit:


li $v0,10            # Exit program system call
syscall              # This ends execution