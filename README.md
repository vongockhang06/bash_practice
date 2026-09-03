# bash_practice
## Note
- "${order: -1:1}" need to have space between : and -1
- out of bound: just return empty string not raise error
- declare -A array play a role the same as hash <unordered_map> in C++
- "${VAR,}" lowercases first character
- "${VAR,,}" lowercases whole word
- ^ instead of , for uppercase instead of lowercase
- In Bash associative arrays, unassigned keys evaluate to an empty string (""), not 0
