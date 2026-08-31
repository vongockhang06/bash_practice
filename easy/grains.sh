#!/bin/bash

n="${1}"
if [[ "${n}" == "total" ]]; then
    #Hardcode when find total of whole chessboard
    echo "18446744073709551615"
    exit 0
elif [[ "${n}" -lt 1 || "${n}" -gt 64 ]]; then
    echo "Error: invalid input"
    exit 1
else
    echo "2^(${n}-1)" | bc
    exit 0
fi