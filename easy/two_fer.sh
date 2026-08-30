#!/bin/bash

string="${1}"
if [[ "${#string}" -eq 0 ]]; then
    echo "One for you, one for me."
else
    echo "One for ${string}, one for me."
fi