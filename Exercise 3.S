.data
str1: .asciiz "Calculation of the Greatest Common Divisor of two integers using Euclid's algorithm."
str2: .asciiz "Please enter the first integer:"          #Text that is going to be used later
str3: .asciiz "Please enter the second integer:"          #Text that is going to be used later
str4: .asciiz "The Greatest common divisor is:"        #Text that is going to be used later
str5: .asciiz "Both numbers are zero..." #Text to be printed 

.text                                                       # Program is placed under the .text directive
main:                                                       #The program's main method

la $a0, str1     #ask for the first number          
li $v0, 4          #The system calls for a value to print the string  
syscall          #execute a system call


loop:
la $a0, str2     #ask for the first number          
li $v0, 4          #The system calls for a value to print the string  
syscall          #execute a system call

li $v0, 5        #get the first number
syscall
move $t0, $v0

                         


la $a0, str3     #ask for the second number          
li $v0, 4        #The system calls for a value to print the string     
syscall         #execute a system call

li $v0, 5      #get the second number
syscall
move $t1, $v0
 


beqz $t0,loop                    #check to see if the numbers entered are both zero
beqz $t1, loop




loop1:
div $t0, $t1
mfhi $a0 
li $v0, 1            # System call value for print_int
syscall
beqz $a0, skip   #checks if the number in a0 is equal to zero
move $t0,$t1
move $t1,$a0
j loop1

skip :

la $a0, str4     #print the GCD        
li $v0, 4        #The system calls for a value to print the string     
syscall         #execute a system call

move $a0 , $t0        # To print an integer, it should be first stored to register $a0
li $v0, 1            # System call value for print_int
syscall


j loop
exit:


li $v0,10            # Exit program system call
syscall              # This ends execution