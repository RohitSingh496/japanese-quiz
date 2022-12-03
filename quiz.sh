#!/bin/bash

file=./n4kanji.tsv

#color-variables
green="\033[1;32m"
red="\033[1;31m"
blue="\033[1;34m"
cyan="\033[1;36m"
end="\033[0m"

#horizontal-breakline
break(){
echo 
for i in {0..1}; do echo -ne "$cyan**--**$end" ; done 
echo 
echo 
}

clear
echo "Generated a quiz from $file file."

break

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
break
echo "Press Enter to see options..."
read
reply=$(echo -e "$ans\n$choice1\n$choice2\n$choice3"|shuf| fzf --prompt "Options for this: `echo $word`")

if [ "$reply" == "$ans" ]
then 
	echo -e "$green You got it correct! $end "
else
	echo -e "$red Incorrect, $end \n$green'$ans'$end is the correct answer."
fi

break
