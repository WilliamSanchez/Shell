#!/bin/bash

myvar=1

while [ $myvar -le 10 ]
do
  echo $myvar
  myvar=$(( $myvar +1 ))
  sleep 0.5

done

echo $(pwd)

while [ -f $(pwd)/testfile  ]
do
  echo "The test file exists"
done
echo "The file no longer exists. Existitng;"
