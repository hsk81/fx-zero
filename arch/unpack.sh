 #!/bin/bash

PTT=$1           # pattern to filter files for or empty
TAR=${2-"build"} # target directory or empty
SRC=${3-"."}     # source directory or empty

mkdir $TAR -p ;

for FN in $(tree -fi $SRC | grep "$PTT" | grep \.tar\.gz$) ; do
tar xfzv $FN --directory $TAR ;
done ;
