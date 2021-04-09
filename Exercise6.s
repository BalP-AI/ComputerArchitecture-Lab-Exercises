#Chrysovalantis Pateiniotis 
#Icsd18174 
.data																# data to be used later in the program
str: .asciiz " Enter temperature "
str1: .asciiz " Enter the number of the temperatures :  "
str3: .asciiz ": "
str2: .asciiz "\n >> Moving average :    "
str4: .asciiz " "
str5: .asciiz "\n >> Average temperatures per "
str6: .asciiz " years:  "

array: .word 0:10											# declaration of the array with 10 spaces 


.text

main:

	li $s1, 1														# initialization of the value for the function 
	
	values:
		la $a0, str 												# load the string str to the register a0
		li $v0, 4													# print the str
		syscall
		li $v0, 1													# print the sum
		move $a0, $s1										# print the value that contains the  s1
		syscall
		la $a0, str3 											# load string that the s1 contains 		
		li $v0, 4													# print s1
		syscall
		li $v0, 5													#asks the user for the first value to initialize the sequence
		syscall
		move $t1, $v0										# move the int to the register t1
		sw $t1, array($t0)									# move the number of the register t1 to the first element of the array
		add $t0,$t0, 4										# moves the counter of the array by one 
		add $s1,$s1,1										# increases the counter by one 
		ble $s1,10,values							# end of value
	
		la $a0, str1												# add string to the a0
		li $v0, 4													# print string to the console 
		syscall
		li $v0, 5													# regognition of the first int from the user to initialize the sequence 
		syscall
		move $t1, $v0										# move the int from the user to the register t1 
	
	la $a0, str2 												# load string str2 to the reigister  a0
	li $v0, 4														# print the string to the console 
	syscall	
	li $t7,0														# initialization of the registers to be used as counters 
	li $t5,0
	li $t6,11
	li $t4, 0
	sub $t6,$t6,$t1
	print_average:                                                                                     # initialization of the function print_average
		move $t0, $t7										# copy the value from the t7 reigster to the t0 register 
		li $t2, 0													#	initialization of values that work as counters 
		li $t3,0		
		add_values:											
			lw $t8, array+0($t0)							# load to the t8 the value of the array that the t0 shows 
			add $t2, $t2, $t8								#calculation of the result and save it in the register $t2
			add $t3,$t3,1										# increases the value of the counter 
			add $t0,$t0, 4									# increases the register that shows the array location  
		blt $t3,$t1,add_values							# end of add_values 
		div $t2,$t2,$t1										
		li $v0, 1													# print sum
		move $a0, $t2										# prints the value of the register t2
		syscall
		la $a0, str4												# load a string to the a0
		li $v0, 4													# print a string in the console 
		syscall
		add $t5,$t5,1											# increase the value of all registers 
		add $t7,$t7,4
		add $t4,$t4,$t2
	blt $t5,$t6,print_average							# end of print_average
	
	div $t4,$t4,$t6								
	la $a0, str5 												# load string in the register a0
	li $v0, 4														# print string in the console 
	syscall
	li $v0, 1														# print the sum
	move $a0, $t1										
	syscall	
	la $a0, str6 												
	li $v0, 4														
	syscall
	li $v0, 1														
	move $a0, $t4											
	syscall	
	
li $v0, 10 														# end of program									
		syscall	