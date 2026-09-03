#!/bin/bash
declare -A counter
input="$1"
dict="qwertyuiopasdfghjklzxcvbnm"
for ((i=0;i<"${#input}";i++)); do
    char="${input:$i:1}"
    char="${char,,}"
    counter["$char"]=$((counter["$char"] +1))
done

for ((i=0;i<26;i++)); do
    char="${dict:$i:1}"
    if [[ "${counter[$char]}" == "" ]]; then
        echo "false"
        exit 0
    fi 
done 

echo "true"
exit 0