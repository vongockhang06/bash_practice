# bash_practice

## ========================= SCRIPTING ====================================
- ```"${order: -1:1}"``` need to have space between : and -1
- out of bound: just return empty string not raise error
- ```declare -A array``` play a role the same as hash <unordered_map> in C++
- ```"${VAR,}"``` lowercases first character
- ```"${VAR,,}"``` lowercases whole word
- ```^``` instead of ```,``` for uppercase instead of lowercase
- In Bash associative arrays, unassigned keys evaluate to an empty string (""), not 0
## ========================= BASH COMMAND ====================================
- Linux handles program outputs:
    + File Descriptor 1 (```stdout```): Standard output. This is where normal, successful messages go. We can use ```&1``` to mean whatever file descriptor 1 is currently pointing to.
    + File Descriptor 2 (```stderr```): Standard error. This is where error messages and warnings go. We can use ```&2``` to mean whatever file descriptor 2 is currently pointing to.
- ```|``` : pipe to run many commands in sequence
Eg: ```cat sales.csv | grep "laptop"```
- ```wc```: word count. Default return: Lines Words Byte
- ```2>```: Redirects error messages instead of normal output. Therefore, we also have ```2>>```.
Eg: ```cat nonexistentfile.txt 2> error.log```
- We can also do like this: ```cat nonexistentfile.txt 2>/dev/null```. where ```2>/dev/null ``` means discard errors
- ```"$?"```: exit code. 0 means success other mean error
- ```tail -n number```: take ```number``` of last lines.
-  ```tail -n +number```: skip ```number-1``` lines at the start
- ```grep```: 