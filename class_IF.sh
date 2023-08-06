#!/bin/bash

echo "Statememtn IF ELSE ..."

myNum=200
[ $myNum -eq 200 ] && echo "The condition is true"

if [ ! $myNum -eq 300 ]
then
   echo "the condition is true"
else
   echo "the condition does not equal 200"
fi

# ne
# gt

touch myFile

if [ -f myFile  ]
then
  rm myFile 
  echo "The file exists."
   
else
    echo "The file does not exists."
fi

command=/usr/bin/htop

if [ -f $command  ]
then
   echo "$command is available, let's run it .."
else
   echo "$commmand is not available, installing it ..."
  #sudo apt update && sudo apt install -y htop
fi

command2=htop

if  command2 -v  $command2  ]
then
   echo "$command2 is available, let's run it .."
else
   echo "$commmand2 is not available, installing it ..."
  #sudo apt update && sudo apt install -y htop
fi


$command2
