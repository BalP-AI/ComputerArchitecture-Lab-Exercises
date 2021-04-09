.data                                                    # Program data are placed below the .data directive
str1: .asciiz "Please enter the first integer:"          #Text that is going to be used later
str2: .asciiz "Please enter the second integer:"          #Text that is going to be used later
str3: .asciiz "The result of the subtraction is:"        #Text that is going to be used later


.text                                                       # Program is placed under the .text directive
main:                                                       #The program's main method

la $a0, str1     #ask for the first number          
li $v0, 4          #The system calls for a value to print the string  
syscall          #execute a system call

li $v0, 5        #get the first number
syscall
move $t0, $v0

la $a0, str2     #ask for the second number          
li $v0, 4        #The system calls for a value to print the string     
syscall         #execute a system call

li $v0, 5      #get the second number
syscall
move $t1, $v0



la $a0, str3          #print the subtraction text
li $v0, 4           #The system calls for a value to print the string  
syscall            #execute a system call

sub $t0,$t0,$t1   #subtraction and the value is stored to the $t0

move $a0, $t0        # To print an integer, it should be first stored to register $a0
li $v0, 1            # System call value for print_int
syscall





li $v0,10            # Exit program system call
syscall 