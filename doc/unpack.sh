 #!/bin/bash

PTT=$1       # pattern to filter files for or empty
SRC=${2-"."} # source directory or empty

for FN in $(tree -fi $SRC | grep "$PTT" | grep 7z$) ; do
7z x -y $FN
done
