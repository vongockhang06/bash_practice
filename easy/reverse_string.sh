#!/bin/bash
string=${1}
size="${#string}"
res=""
for((i=size-1;i>=0;i--)); do
    char="${string:$i:1}"  #cannot use like array
    res="${res}${char}"
done
echo "${res}"
