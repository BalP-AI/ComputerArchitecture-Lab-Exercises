.data                                          # Program data are placed below the .data directive
str: .asciiz "Valantis Pateiniotis \n"        #String of text to be used later
str1: .asciiz "321/2018174\n"            #String of text to be used later
.text                                     # Program is placed under the .text directive 
main:                                   # Standard label in QtSpim for the main program.
la $a0, str                              # To print a string, first its address should be stored to register $a0
li $v0 ,4                                #The system calls for a value to print the string
syscall                                 # Use this MIPS command to execute a system call
la $a0,str1                               # To print a string, first its address should be stored to register $a0 
li $v0,4                                  #The system calls for a value to print the string  
syscall                                  # Use this MIPS command to execute a system call

li $v0,10   # Exit program system call        
syscall   # This ends execution