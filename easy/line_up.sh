#!/bin/bash
name="${1}"
order="${2}"
#"${order: -1:1}" need to have space between : and -1
# out of bound: just return empty string not raise error
if [[ "${order: -1:1}" == "1" && "${order: -2:1}" != "1" ]]; then
    tag="st"
elif [[ "${order: -1:1}" == "2" && "${order: -2:1}" != "1" ]]; then
    tag="nd"
elif [[ "${order: -1:1}" == "3" && "${order: -2:1}" != "1" ]]; then
    tag="rd"
else 
    tag="th"
fi 

echo "${name}, you are the ${order}${tag} customer we serve today. Thank you!"