#!/bin/bash
if [[ "${#@}" -ne 2 ]];then
    echo "Usage: hamming.sh <string1> <string2>"
    exit 1
fi
seq1="${1}"
seq2="${2}"
if [[ "${#seq1}" -ne "${#seq2}" ]];then
    echo "strands must be of equal length"
    exit 1
fi

count=0
for((i=0;i<${#seq1};i++)){
    c1="${seq1:$i:1}"
    c2="${seq2:$i:1}"
    if [[ "$c1" != "$c2" ]];then
        count="$((count+1))"
    fi
}
echo "${count}"
exit 0