#!/bin/bash

echo "Execute code"


if [ -e test.c ]
then
   gcc -Wall -o test test.c
   #./test 2>&1 | tee  data.txt
   ./test >> data.txt
else
  echo "NOT FILE"
  exit
fi

rm test
