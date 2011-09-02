#!/bin/bash

cat files.lst | while read LINE ; do 
URI=$(echo $LINE|cut -f1 -d" ") ; 
FN=$(echo $LINE|cut -f2 -d" ") ; 
wget -c -O $FN $URI ;
done
