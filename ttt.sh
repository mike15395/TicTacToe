#!/bin/bash -x

echo "Welcome to TIC-TAC-TOE Game!"
arr=(- - - - - - - - -) # intialized empty array with 9 elements

function display_matrix()
{
	echo "${arr[0]} ${arr[1]} ${arr[2]}"
	echo "${arr[3]} ${arr[4]} ${arr[5]}"
	echo "${arr[6]} ${arr[7]} ${arr[8]}"
}

display_matrix
