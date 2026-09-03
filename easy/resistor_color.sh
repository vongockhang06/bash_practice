#!/bin/bash
colors=(
    "black"
    "brown"
    "red"
    "orange"
    "yellow"
    "green"
    "blue"
    "violet"
    "grey"
    "white"
)

if [[ "$1" == "code" ]]; then
    target="$2"
    for i in "${!colors[@]}"; do
        if [[ "${colors[$i]}" == "$target" ]]; then
            echo "$i"
            exit 0
        fi
    done
elif [[ "$1" == "colors" ]]; then
    # Prints each array element on its own line, preserving exact order
    printf '%s\n' "${colors[@]}"
fi