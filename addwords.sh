#!/bin/sh

echo "Add word: "
read word

echo "Add meaning: "
read meaning

echo "$word\t$meaning" >> ./allWords.tsv
