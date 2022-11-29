#!/bin/bash

echo "Creating a quiz from kanji.tsv file..."

break(){
echo 
for i in {0..15}; do echo -n "**--**" ; done 
echo 
echo 
}
break
str=$(shuf -n 1 kanji.tsv) 
echo "$str"
echo 
word=$(echo "$str" | cut -f 2)
ans=$(echo "$str" | cut -f5)

echo "$word	$ans"


break
