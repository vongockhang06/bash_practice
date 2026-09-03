#!/bin/bash
res=""
number="$1"
if (( number%3==0 )); then
    res="${res}Pling"
fi

if (( number%5==0 )); then
    res="${res}Plang"
fi

if (( number%7==0 )); then
    res="${res}Plong"
fi

if [[ "$res" == "" ]]; then
    res="$number"
fi
echo "$res"