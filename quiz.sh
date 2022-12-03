#!/bin/bash
clear
echo "Creating a quiz from kanji.tsv file..."

break(){
echo 
for i in {0..5}; do echo -n "**--**" ; done 
echo 
echo 
}

break

#getRandomLine
str=$(shuf -n 1 kanji.tsv) 

#extractWord
word=$(echo "$str" | cut -f 2)

#extractMeaning
ans=$(echo "$str" | cut -f 5)

#createRandomChoice
choice1=$(shuf -n 1 kanji.tsv | cut -f 5 )
choice2=$(shuf -n 1 kanji.tsv | cut -f 5 )
choice3=$(shuf -n 1 kanji.tsv | cut -f 5 )


echo "$word"
break
echo "Press Enter to see options..."
read
reply=$(echo -e "$ans\n$choice1\n$choice2\n$choice3"|shuf| fzf --prompt "Options for this: `echo $word`")

if [ "$reply" == "$ans" ]
then 
	echo "correct"
else
	echo "incorrect"
fi

break
