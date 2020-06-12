#!/bin/bash -x

echo "Welcome to TIC-TAC-TOE Game!"
arr=(- - - - - - - - -) # intialized empty array with 9 elements

#player 1 x
#player 2 o
player1symbol='x' #constants
player2symbol='o'

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
	#echo "Enter symbol"
	#read sym

	if (( $position >=0  &&  $position <=8 ))
	then

				arr[$position]=$sym
	else
		 	echo "Wrong position"
	fi

}

function wincheck
{
	if [ ${arr[0]} != "-" ] && [ ${arr[0]} == ${arr[1]} ] &&[ ${arr[1]} == ${arr[2]} ]  ;then
		game=0
	elif [ ${arr[3]} != "-" ] && [ ${arr[3]} == ${arr[4]} ] &&[ ${arr[4]} == ${arr[5]} ]  ;then
		game=0
	elif [ ${arr[6]} != "-" ] && [ ${arr[6]} == ${arr[7]} ] &&[ ${arr[7]} == ${arr[8]} ]  ;then
		game=0
	elif [ ${arr[0]} != "-" ] && [ ${arr[0]} == ${arr[3]} ] &&[ ${arr[3]} == ${arr[6]} ]  ;then
		game=0
	elif [ ${arr[1]} != "-" ] && [ ${arr[1]} == ${arr[4]} ] &&[ ${arr[4]} == ${arr[7]} ]  ;then
		game=0
	elif [ ${arr[2]} != "-" ] && [ ${arr[2]} == ${arr[5]} ] &&[ ${arr[5]} == ${arr[8]} ]  ;then
		game=0
	elif [ ${arr[0]} != "-" ] && [ ${arr[0]} == ${arr[4]} ] &&[ ${arr[4]} == ${arr[8]} ]  ;then
		game=0
	elif [ ${arr[2]} != "-" ] && [ ${arr[2]} == ${arr[4]} ] &&[ ${arr[4]} == ${arr[6]} ]  ;then
		game=0
	fi
	
}



function main
{
	display_matrix
	game=1
	while ((game != 0))
	do
		flag=1
		if (( flag == 1 ))
		then
			echo "Player 1(x)"
			sym=$player1symbol
			input
			wincheck
				if (( game ==0 ))
				then
						echo "Player 1 WON"
						display_matrix
						break;
				fi
			display_matrix
			flag=0
		fi

		if (( flag == 0))
		then
			echo "Player 2(o)"
			sym=$player2symbol
			input
			wincheck
					if (( game == 0 ))
				then
						echo "Player 2 WON"
						display_matrix
						break;
				fi
			display_matrix
			flag=1
		fi
	done
}

main
