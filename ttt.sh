#!/bin/bash -x

echo "Welcome to TIC-TAC-TOE Game!"
arr=(- - - - - - - - -) # intialized empty array with 9 elements

function display_matrix()
{
	echo "${arr[0]}  ${arr[1]}  ${arr[2]}"
	echo "${arr[3]}  ${arr[4]}  ${arr[5]}"
	echo "${arr[6]}  ${arr[7]}  ${arr[8]}"
}


function input()
{
	echo "Enter Position"
	read position
	echo "Enter symbol"
	read sym

	if (( $position >=0 && $position <=8  ))
	then
			arr[$position]=$sym
	else
		 	echo "Wrong position"
	fi

}

display_matrix

function play()
{
	flag=1
	if ((flag == 1)) #player1
	then
		input
		display_matrix
		flag=0
	fi

	if (( flag == 0)) #player2
	then
		input
		display_matrix
		flag=1
	fi

}

play
