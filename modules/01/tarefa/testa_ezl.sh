#!/bin/bash
EXE=./lab01
IN=../in
OUT=out
echo Ours is on the left 👈
for infile in `ls $IN/*.ezl`; do
    base=$(basename $infile)
    outfile=$OUT/${base/.ezl/.out}
    echo $infile
    $EXE < $infile | diff --ignore-all-space --ignore-matching-lines --side-by-side --width=60 --color=always $outfile -
    if [[ $? != 0 ]]; then
        break
    fi
done
echo Done
