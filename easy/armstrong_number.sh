#!/bin/bash
input="${1}"
len="${#input}"
int_input=$((input))
sum=0
for((i=0;i<len;i++));do
    sum=$((sum + ${input:$i:1}**len))
done
if [[ "$sum" -eq "$int_input" ]]; then
    echo "true"
else
    echo "false"
fi

