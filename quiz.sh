#!/bin/bash

file=./n4kanji.tsv
score=0
if [ ! $1 ]
then
	totalScore="1"
else
	totalScore="$1"
fi

#color-variables
green="\033[1;32m"
red="\033[1;31m"
blue="\033[1;34m"
cyan="\033[1;36m"
yellow="\033[1;33m"
white="\033[1;38m"
end="\033[0m"

#horizontal-breakline
break(){
echo
for i in $(seq $1); do echo -ne "$cyan**--**$end" ; done 
echo 
echo 
}

clear
echo -e "$yellow Generated a quiz from $file file$end\n\n$white Hit 'ENTER' to start $end "
read -p " "  

startQuiz(){
	clear
	break 2
	
	#getRandomLine
	str=$(shuf -n 1 $file) 
	
	#extractWord
	word=$(echo "$str" | cut -f 1)
	
	#extractMeaning
	ans=$(echo "$str" | cut -f 2)
	
	#createRandomChoice
	choice1=$(shuf -n 1 $file | cut -f 2 )
	choice2=$(shuf -n 1 $file | cut -f 2 )
	choice3=$(shuf -n 1 $file | cut -f 2 )
	
	
	echo -e "$blue $word $end"
	break 2
	echo -n "Press ENTER to see options"
	read
	
	break 6
	
	reply=$(echo -e "$ans\n$choice1\n$choice2\n$choice3"|shuf| fzf --prompt "Options for this: `echo $word`")
	
	if [ "$reply" == "$ans" ]
	then
		score=$((++score))
		echo -e "$green You got it correct! $end"
	else
		echo -e "$red Incorrect, $end \n$green '$ans'$end is the correct answer."
	fi
	
	break 6
	
	echo -e "$white Your score is:$end $yellow'$score/$totalScore'$end"
	
	read
}

#Run startQuiz 'totalScore' times
for i in `seq $totalScore`
do
	startQuiz
done
