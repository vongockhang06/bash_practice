#!/bin/bash
input="${1}"
span="${2}"
size="${#input}"
if ((size<span)); then
    echo "span must not exceed string length"
    exit 1
elif ((span<0)); then
    echo "span must not be negative"
    exit 1
elif [[ ! "$input" =~ ^[0-9]+$ ]]; then
    echo "digits input must only contain digits"
    exit 1
fi 

max=0
for ((i=0;i<size-span;i++ )); do
    number=1
    for ((j=i;j<i+span;j++)); do
        digit="${input:j:1}"
        number="$((number*digit))"
    done
    if ((number>max)); then
        max="$number"
    fi
done
echo "$max"