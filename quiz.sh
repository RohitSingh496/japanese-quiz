#!/bin/bash

file=./n4kanji.tsv


#horizontal-breakline
break(){
echo
for i in $(seq $1); do echo -n "**--**" ; done 
echo 
echo 
}

clear
echo "Generated a quiz from $file file."

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


echo -e "$word"
break 2
echo -n "Press Enter to see options..."
read

break 6

reply=$(echo -e "$ans\n$choice1\n$choice2\n$choice3"|shuf| fzf --prompt "Options for this: `echo $word`")

if [ "$reply" == "$ans" ]
then 
	echo -e "You got it correct!"
else
	echo -e "Incorrect,\n'$ans'is the correct answer."
fi

break 6 
