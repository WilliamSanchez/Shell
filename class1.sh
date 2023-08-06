#!/bin/bash

IFS=''
set foo bar bam

echo "$@"
echo "$*"
unset IFS

echo "$*"

PATH_DIR=$0

echo "Patch of PATH_DIR $PATH_DIR"

files=$(ls ~/x-tools)

echo "[$(date)] My RESULT $files"
echo "My path $(pwd)"
myNum=20
echo "$myNum - 30 = $(expr $myNum - 30)"
