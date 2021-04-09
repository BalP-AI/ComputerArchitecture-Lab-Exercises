#Chrysovalantis Pteiniotis 
#Icsd18174 
.data

ARRAY: .word 0:10
str1: .asciiz "Give an integer to be added to the list: "
str2: .asciiz "Unsorted array :\n"
str3: .asciiz "Sorted array :\n"
change_line: .asciiz "\n"
space: .asciiz " "

.text
main:

li $t1,1             # loop counter,initialization of the register  t1 with the value of  1
la $t0,ARRAY         # register counter that points to the start of the  <ARRAY>

Label1:              #label

	la $a0,str1  #print str1
	li $v0,4          #system call for print str1
	syscall           #system call

	li $v0,5		  #system call to read integer mode 
	syscall			  #system call
	sw $v0,($t0)      #saves integer in the register  $v0, to the array

	add $t0,4		 #increase the register  counter  t0 by 4 to point to the next position of the array
	add $t1,1        #increase counter by one 

	blt $t1,11,Label1    #check loop(checks if $t1<11 if yes then it goes to label1)

	li $t1,1       #loop counter ,inisialization of the register t1with the value  1  
	la $t0,ARRAY   #counter register  that point to the start <ARRAY>
	li $t2, 0      #print counter

print:  #label

	add $t2,$t2,1      #increases the counter of prints $t2 by 1
	beq $t2,2,print2   # checks if $t2=2 and if yes it goes to the label print2

	la $a0,str2   #print str2
	li $v0,4           #system call to print
	syscall            #system call

	

	
print1:   #label

	lw $a0,($t0)  #it loads the on content  of the register $t0 to the register $a0
	li $v0,1      #system call with the code 1
	syscall       #system call

	la $a0,space   #print the string space
	li $v0,4	   #system call with the code 4 
	syscall        #system call

	add $t1,1    #it increases the counter of the loop by one
	add $t0,4    #increases the register $t0 by 4 to point to the next position of the array

	blt $t1,11 print1  #checks if  $t1<11 and if yes it goes to the label print1

	li $t1,0 #ainitialises the value 0 to the register  $t1 

	la $a0,change_line    #print the string change line
	li $v0,4           #system call with the code 4 to print a string 
	syscall            #system call


A:
	la $t0,ARRAY #pointer register that points to the first element of the array
	li $t3,0     #makes the register  $t3 equal to zero (j=0)
B:
	lw $s1,($t0)  #the register $s1 takes the value of an element of the array (temp1=array[i])
	add $t0,4     # the register increases by 4 so it shows to the next element
	lw $s2,($t0)  #the register $s2 takes the value of the next element of the array(temp2=array[i+1])
	add $t3,1     # j++
	bgt $s1,$s2,swap   #if $s1>$s2 the it goes to the  swap
	Cont:  				#label
	ble $t3,9,B			#loop check (while $t3<=9 then it goes to the  B)
	add $t1,1       #i++
	blt $t1,10,A        #loop check (while $t1<10 then it goes to the  A)

	j print  #junps to the print

print2:
	li $t1,1  #loop counter
	la $t0,ARRAY #register pointer

	la $a0,str3  #print str3
	li, $v0,4		  #system call with the code 4
	syscall			  #system call

	

print3:		 #label for loop 

	lw $a0,($t0)   #print the array element
	li $v0,1       #system call with the code 1 to print element
	syscall        #system call

	la $a0,space  #prints space
	li $v0,4      
	syscall       #system call

	add $t1,1    #increases the counter by 1
	add $t0,4    #increases the register by four to point to the next element of the array

	blt $t1,11 print3 #loop check(if $t1<11 goes to label print3)

	li $v0,10  #system call for exit
	syscall    #system call
	

swap:	          #label for swap
	sw $s1,($t0)  #saves temp1 to array+1
	sub $t0,4     #subtracks from the register 4 so it shows to the previous element of the array
	sw $s2,($t0)  #saves temp2 to the array
	j Cont            #jumps to the  Cont

	li $v0,10            # Exit program system call
	syscall              # This ends execution