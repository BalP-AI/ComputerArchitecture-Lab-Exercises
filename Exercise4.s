#Icsd18174
#Chrysovalantis Patiniotis

.data
array1: .word 0:20 	 #dilwsi pinaka 20 thesewn kai arxikopoihsh
string0: .asciiz "Please enter the first number of the sequence\n"
string1: .asciiz "Enter the step pf the sequence\n"
string2: .asciiz "\nSum of the numbers: "
space: .asciiz " "


.text
main:

la $a0,string0           #prints the first string
li $v0,4
syscall

li $v0,5                #Read the first number
syscall
move $t1,$v0

la $a0,string1         #Prints the second string
li $v0,4
syscall

li $v0,5 	       #Read the step
syscall
move $t2,$v0


li $s0,0              #metritis epanalipsis
li $t3,0              #sum
la $t0,array1         #pointer register


loopA:

sw $t1,($t0) 		#array1[i]=$t1
add $t3,$t3,$t1		 #sum=sum+array1[i]
sw $t1,($t0) 		#array1[i]=$t1
add $t1,$t1,$t2 	#calculates  the next number
add $s0,$s0,1 		 # increases counter by one
add $t0, $t0, 4		 #increases the register by four

blt $s0,20,loopA 	 #loop

li $s0,20 		#loop counter
la $t0,array1+76 	#pointer register that points to the last element of the array
loopB:

lw $a0,($t0)		#prints the element
li $v0,1
syscall

la $a0, space 		#print a space between the two elements that are printed
li $v0, 4                       
syscall

sub $t0,$t0,4  		#reduces the register by the value of four 
sub $s0,$s0,1

bgt $s0,0,loopB 	#loop

la $a0,string2 		#prints string 2
li $v0,4
syscall

move $a0,$t3 		#prints the sum of the element inside the array
li $v0,1
syscall

li $v0,10 		#exits program
syscall
