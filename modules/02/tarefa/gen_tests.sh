#!/bin/bash
EXE=./tarefa2.out
IN=../../01/in
OUT=../out02
echo Ours is on the left 👈
for infile in $IN/*.ezl; do
    base=$(basename $infile)
    outfile=$OUT/${base/.ezl/.out}
    echo $infile
    $EXE < $infile | diff --ignore-all-space --ignore-matching-lines --side-by-side --width=60 --color=always $outfile -
    if [[ $? != 0 ]]; then
        break
    fi
done
echo Done
