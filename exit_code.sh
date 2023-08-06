#!/bin/bash

#directory=/etc
directory=/notexist

echo "HOLA"
#exit 199
#echo $?

if [ -d $directory ] 
then
  echo $?
  echo "The directory $directory exists."
else
  echo $?
  echo "The directory $directory doesn't exists"
fi

echo "The exit code for this script is $? "
