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
- ```grep -option "word" file_name```: find text matching pattern in files
    + ```-i```: case insensitive
    + ```-n```: line numbers + line
    + ```-v```: lines NOT matching
    + ```-c```: Count matches
    + ```-A number```: matched line + ```number``` of line after the matched line
    + ```-B number```: matched line + ```number``` of line before the matched line
    + ```-C number```: matched line + ```number``` of line after and before the matched line
    + ```-r```: recursive search
    + ```-E```: replace ```word``` by regex pattern
- ```awk 'condition { action }' filename```: read structured text, select/filter data, extract columns, calculate values, and generate formatted output. awk processes text one line at a time, dividing each line into fields (like ```$1, $2, …, $NF```) using specified field separator. where ```$NF``` is the last field. Some common options and actions:
    + ```-F```: field separator(use white space by default). 
        Eg: ```awk -F,  '{print $2}' sales.csv```
    + ```NR```: line number. 
        Eg: ```awk -F, 'NR>1 {print $2, $3}' sales.csv``` ~ print column 2,3  and skip header in sales.csv
    + ```END```: runs after reading the entire file
        Eg: ```awk -F, '{sum+=$3} END {print "Total: " sum}' sales.csv ```
        Calculate total of amount.
        ```awk -F, 'NR>1 {sum+=$3 ; count++} END {print "Total: " sum/count}' sales.csv ```
    + ```BEGIN```: runs before reading the file
        Eg: ```awk -F, 'BEGIN {print "=== Sales Report ==="} NR>1 {sum+=$3; print $2,$3} END {print "Total: " sum}' sales.csv ```
    + ```if else```:
    Eg
    ```bash
            awk -F, '
            {
                if ($4 == "north") {
                    north_sum += $3
                }
                else if ($4 == "east") {
                    east_sum += $3
                }
                else {
                    other += $3
                }
            }
            END {
                print "total:", north_sum, east_sum, other
            } sales.csv
    ```
    + Use associative array without declaring it 
    Eg: ```awk -F, 'NR>1 {count[$4]++} END {for (r in count) print r, count[r]}' sales.csv ``` ~ count per region
    