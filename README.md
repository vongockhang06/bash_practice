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
- ```awk 'condition { action }' filename```: read structured text, select/filter data, extract columns, calculate values, and generate formatted output. awk processes text one line at a time, dividing each line into fields (like ```$1, $2, …, $NF```) using specified field separator. where ```$NF``` is the number of field. Some common options and actions:
    + ```-F```: field separator(use white space by default). 
        Eg: ```awk -F,  '{print $2}' sales.csv```
    + ```NR```: number of rows. 
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

- ```sed 'command' filename```: change, delete, or transform text. We can also use it for character but it is more natural to use ```tr```
    + By default ```sed``` does not effect original file unless we use ```-i``` option
    + Substitution: ```sed 's/old/new/' file```. Replace the first ```old``` by ```new``` if we have many ```old``` on the same line. 
        Eg: ```sed 's/laptop/game/' sales.csv``` It does not effect the sales.csv
    + Replace all occurrences on a line: ```sed 's/old/new/g' file```
        Eg: ```sed 's/orange/apple/g' <<< "orange orange orange"```
    + Specify lines to substitue: ```sed '2s/old/new/' file``` for 2nd line only or ```sed '2,5s/old/new/' file``` for 2nd line to 5th line
    + Delete lines: ```sed 'number,numberd' filename```
        Eg: ```sed '2,5d' sales.csv``` ~ delete from line2 to line 5
    + Delete all lines containing specific words: ```sed '/WORD/d' filename```
    + Delete specified lines containing specific words: ```sed 'range{/WORD/d}' filename```
        #### General rule: pattern+command or range+command no need to have braces. We just use braces when range+pattern+command 
    + Print line: ```sed -n '2,4p' filename ``` where ```-n``` mean don't automatically print every line
    + ```sed``` can also use regex
        Eg: ```sed 's/[0-9]//g' sales.csv``` remove all digit
    + Multiple command: ```sed -e command1 -e command2 filename```

- ```cut```: Used to extract field - column, char, byte but mostly field.
    + ```-d```: delimeter.
    + ```-f```: field want to extract.
        Eg: ```cut -d"," -f1,3 sales.csv``` ~ take field 1 and field 3.
            ```cut -d"," -f1-3 sales.csv``` ~ take field 1 to field 3.
    ### Note: when we want to use -c and -b we can not use -d
    + ```-c```: extract by character.
        Eg:```cut -c2-10 sales.csv``` ~ take char 2 to char 10.
    + ```-b```: extract by byte.
        Eg:```cut -b2-10 sales.csv``` ~ take byte 2 to byte 10.

- ```tr [OPTION] SET1 [SET2]```: transform character
    + Char replacement: ``` echo "hello" | tr "a-z" "A-Z" ```
    + Delete char: ``` echo "Today is 06/10/2026" | tr -d "0-9" ```
    + Squeeze char: ``` echo "aaaaaaaaaaaabbbbbbaaccc" | tr -s "a-z" ```

- ```sort option file ```: sort lines in file. Sort by alphabet by default
    + ```-r```: reverse sorting
    + ```-n```: sort by number not by alphabet anymore
    + Sort by field: ``` sort -t"," -k3,3nr sales.csv ``` ~ sort by ```amount``` field in reverse where ```-t``` means separator, ```-k3,3``` means sorting by key from key 3 to key 3 (so just key 3 only).

- ``` uniq option file ```: remove adjacent duplicate lines in file. Therefor if we run ```uniq``` on the following file:
```text
    Alice
    Bob
    Alice
    Charlie
    Bob
    Alice
```
    + The file remains the same because duplicate is not adjacent. Fix: combine with ```sort```.
    + ```-c```: to count frequency of words.
    + ```-d```: shows duplicate lines (still need to sort).
    + ```-u```: shows uniqe lines (still need to sort).