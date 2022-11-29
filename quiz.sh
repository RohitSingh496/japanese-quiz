#!/bin/bash

echo "Creating a quiz from kanji.tsv file..."

break(){
echo 
for i in {0..15}; do echo -n "**--**" ; done 
echo 
echo 
}

break

#getRandomLine
str=$(shuf -n 1 kanji.tsv) 

#extractWord
word=$(echo "$str" | cut -f 2)
#extractMeaning
ans=$(echo "$str" | cut -f5)

echo "$word	$ans"


break
