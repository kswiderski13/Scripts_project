#!/bin/bash

#declare -a arr1=(0 1 2)
#declare -a arr2=(3 4 5)
#declare -a arr3=(6 7 8)
declare -a arr=(0 1 2 3 4 5 6 7 8)
win=0
illegitimate=true
game_on=true
draw=0

draw_board(){
echo -e "${arr[0]} | ${arr[1]} | ${arr[2]}
----------
${arr[3]} | ${arr[4]} | ${arr[5]}
----------
${arr[6]} | ${arr[7]} | ${arr[8]}"
}

select_gamemode(){
	until [[ $gamemode == 1 ]] || [[ $gamemode == 2 ]]
	do
		echo -e "select your gamemode:\n
			1 - PvP\n
			2 - PvE\n"
		read gamemode
	done 
}
#winning conditions
check_win(){

if [[ ${arr[0]} == ${arr[1]} && ${arr[0]} == ${arr[2]} ]] || 
[[ ${arr[0]} == ${arr[3]} && ${arr[0]} == ${arr[6]} ]] ||
[[ ${arr[1]} == ${arr[4]} && ${arr[1]} == ${arr[7]} ]] ||
[[ ${arr[3]} == ${arr[4]} && ${arr[3]} == ${arr[5]} ]] || 
[[ ${arr[0]} == ${arr[4]} && ${arr[0]} == ${arr[8]} ]] || 
[[ ${arr[2]} == ${arr[4]} && ${arr[2]} == ${arr[6]} ]] || 
[[ ${arr[2]} == ${arr[5]} && ${arr[2]} == ${arr[8]} ]] || 
[[ ${arr[6]} == ${arr[7]} && ${arr[6]} == ${arr[8]} ]]
then 
echo "The end! Congratulations!"
game_on=false
fi


if [[ $draw -eq 1 ]]
then 
echo "Draw! Better luck next time"
game_on=false
return
fi

}

draw_check(){
filled=0
for i in "${!arr[@]}"
do
	if [[ ${arr[i]} == "o" ]] || [[ ${arr[i]} == "x" ]]
	then filled=$((filled + 1))
	else
	continue
	fi
	
	if [[ $filled -eq 9 ]]
	then draw=1
	break
	fi
done
}
#player1 turn
player1(){
while [ $illegitimate == true ]; do 
read -p "Player 1: Choose the field: " chosenfield
echo ""
if [[ ${arr[$chosenfield]} == "o" ]] ||
   [[ ${arr[$chosenfield]} == "x" ]];
   then continue;
else illegitimate=false;
fi

done

arr[$chosenfield]="o"
draw_board
#check_win
illegitimate=true
}

#player2 turn
player2(){
while [ $illegitimate == true ]; do 
read -p "Player 2: Choose the field: " chosenfield
echo ""
if [[ ${arr[$chosenfield]} == "o" ]] ||
   [[ ${arr[$chosenfield]} == "x" ]];
   then continue;
else illegitimate=false;
fi

done
arr[$chosenfield]="x"
draw_board
#check_win
illegitimate=true
}


ai_turn(){
while [ $illegitimate == true ]; do 
chosenfield=$(shuf -i 0-8 -n 1)
echo ""
if [[ ${arr[$chosenfield]} == "o" ]] ||
   [[ ${arr[$chosenfield]} == "x" ]];
   then continue;
else illegitimate=false;
fi

done
arr[$chosenfield]="x"
draw_board
#check_win
illegitimate=true
}

save(){
read -p "If you want to save your current game, press ->s<-" save_pressed
if [[ $save_pressed == "s" ]];
	touch saves.txt
	then echo ${arr[@]} > "saves.txt"
	echo "saved";
fi
draw_board
}

load(){
read -p "If you want to load saved game, press ->l<-" load_pressed
if [[ $load_pressed == "l" ]];
	then
	if [ -f saves.txt ];
		then read -ra arr <<< "$(cat saves.txt)"
		echo "game loaded";
	else
		touch saves.txt
		echo ${arr[@]} > "saves.txt"
		echo "no save game detected"
	fi
fi
draw_board
}

#defining main
main(){
select_gamemode
if [[ $gamemode == 1 ]];
	then 
		draw_board
		load
		while [ $game_on == true ]; do
		player1
		save
		draw_check
		check_win
		if [[ $game_on == false ]]
		then break
		fi
		player2
		save
		draw_check
		check_win
		if [[ $game_on == false ]]
		then break
		fi
		done
else 
	draw_board
	load
	while [ $game_on == true ]; do
	player1
	save
	draw_check
	check_win
	if [[ $game_on == false ]]
	then break
	fi
	ai_turn
	draw_check
	check_win
	if [[ $game_on == false ]]
	then break
	fi
	done
fi	
}

main
