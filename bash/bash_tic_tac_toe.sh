#!/bin/bash

#declare -a arr1=(0 1 2)
#declare -a arr2=(3 4 5)
#declare -a arr3=(6 7 8)
declare -a arr=(0 1 2 3 4 5 6 7 8)
win=0
illegitimate=true
game_on=true

draw_board(){
echo -e "${arr[0]} ${arr[1]} ${arr[2]}\n${arr[3]} ${arr[4]} ${arr[5]}\n${arr[6]} ${arr[7]} ${arr[8]}"
}

#winning conditions
check_win(){
if [[ ${arr[0]} == ${arr[1]} && ${arr[0]} == ${arr[2]} ]] || 
[[ ${arr[0]} == ${arr[3]} && ${arr[0]} == ${arr[6]} ]] || 
[[ ${arr[0]} == ${arr[4]} && ${arr[0]} == ${arr[8]} ]] || 
[[ ${arr[2]} == ${arr[4]} && ${arr[2]} == ${arr[6]} ]] || 
[[ ${arr[2]} == ${arr[5]} && ${arr[2]} == ${arr[8]} ]] || 
[[ ${arr[6]} == ${arr[7]} && ${arr[6]} == ${arr[8]} ]];
then echo "The end! Congratulations!" && game_on=false
fi
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

save(){
read -p "If you want to save your current game, press ->s<-" save_pressed
if [[ $save_pressed == "s" ]];
	then echo "save_tested_working";
fi
}

#defining main
main(){
draw_board
save
while [ $game_on == true ]; do
player1
check_win
player2
check_win
done
}

main
