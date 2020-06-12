#!/bin/bash -x

echo "Welcome to TIC-TAC-TOE Game!"
arr=(- - - - - - - - -) # intialized empty array with 9 elements


#player 1 x
#player 2 o
player1symbol='x' #constants
player2symbol='o'

function display_matrix() #function to display board
{
	echo "${arr[0]}  ${arr[1]}  ${arr[2]}"
	echo "${arr[3]}  ${arr[4]}  ${arr[5]}"
	echo "${arr[6]}  ${arr[7]}  ${arr[8]}"
}


function input()		#function to accept user input
{

	echo "Enter Position"
	read position

	if [[ ${arr[$position]} == "-" ]];
	then

				arr[$position]=$sym
	else
		 	echo "Wrong position"
	fi

}

function wincheck()		#checking adjacent cells
{

	if [ ${arr[0]} != "-" ] && [ ${arr[0]} == ${arr[1]} ] &&[ ${arr[1]} == ${arr[2]} ] ;then 
		#1st horizontal row
		game=0
	elif [ ${arr[3]} != "-" ] && [ ${arr[3]} == ${arr[4]} ] &&[ ${arr[4]} == ${arr[5]} ]  ;then
		#2nd horizontal row
		game=0
	elif [ ${arr[6]} != "-" ] && [ ${arr[6]} == ${arr[7]} ] &&[ ${arr[7]} == ${arr[8]} ]  ;then
		#3rd horizontal row
		game=0
	elif [ ${arr[0]} != "-" ] && [ ${arr[0]} == ${arr[3]} ] &&[ ${arr[3]} == ${arr[6]} ]  ;then
		#1st vertical column
		game=0
	elif [ ${arr[1]} != "-" ] && [ ${arr[1]} == ${arr[4]} ] &&[ ${arr[4]} == ${arr[7]} ]  ;then
		#2nd vertical column
		game=0
	elif [ ${arr[2]} != "-" ] && [ ${arr[2]} == ${arr[5]} ] &&[ ${arr[5]} == ${arr[8]} ]  ;then
		#3rd vertical column
		game=0
	elif [ ${arr[0]} != "-" ] && [ ${arr[0]} == ${arr[4]} ] &&[ ${arr[4]} == ${arr[8]} ]  ;then
		#diagonal
		game=0
	elif [ ${arr[2]} != "-" ] && [ ${arr[2]} == ${arr[4]} ] &&[ ${arr[4]} == ${arr[6]} ]  ;then
		#diagonal
		game=0
	fi

}

function main
{
	display_matrix
	game=1 #variable game is used to check win status
			#initially 1 before game starts and 0 when game ends
	count=0	#variable to maintain count of player chance
	while ((count<9)) #game starts here
	do
		flag=1  #flag to switch between players
		if (( flag == 1 ))
		then
			echo "Player 1(x)"		#game starts with displaying board
			sym=$player1symbol		#then player input their symbol
			input
			((++count))							#after each input checking win condition
			wincheck
				if (( game ==0 ))		#if  won then display it
				then
						echo "Player 1 WON"
						display_matrix
						break;
				fi
			display_matrix
			flag=0
		fi


		if (( $count == 9)) #if players chance equal number of cells(9)
									#then game is draw
		then
			echo "Draw"
			break;
		fi

		if (( flag == 0))
		then
			echo "Player 2(o)"
			sym=$player2symbol
			input
			((++count))
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
