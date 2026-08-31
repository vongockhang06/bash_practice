#!/bin/bash

declare -A allergy 
allergy[1]="eggs"
allergy[2]="peanuts"
allergy[4]="shellfish"
allergy[8]="strawberries"
allergy[16]="tomatoes"
allergy[32]="chocolate"
allergy[64]="pollen"
allergy[128]="cats"

score="${1}"
request="${2}"

if [[ "${request}" == "allergic_to" ]]; then
    food="${3}"
    
    food_score=0
    for key in "${!allergy[@]}"; do
        if [[ "${allergy[$key]}" == "$food" ]]; then
            food_score="$key"
            break
        fi
    done

    # Bitwise check using arithmetic context (( ))
    if (( food_score > 0 && (score & food_score) != 0 )); then
        echo "true"
    else
        echo "false"
    fi

else
    # Loop over powers of 2 (ascending order)
    res=()
    for i in 1 2 4 8 16 32 64 128; do
        if (( (score & i) != 0 )); then
            res+=("${allergy[${i}]}")
        fi
    done
    echo "${res[@]}"
fi