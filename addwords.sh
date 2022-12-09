#!/bin/sh

echo "Add word: "
read word

echo "Add meaning: "
read meaning

list1check=`cut -f1 ./allWords.tsv | grep -Fxq "$word"; echo $?`
list2check=`cut -f1 ./n4kanji.tsv | grep -Fxq "$word"; echo $?`


if [ $list1check -eq 0 -o $list2check -eq 0 ];
then
    echo "\nThis word already exists!\n\n-----*****-----\n"
    ./addwords.sh
else
    echo "$word\t$meaning" >> ./allWords.tsv
    echo "$word\t$meaning" >> ./n4kanji.tsv
fi
