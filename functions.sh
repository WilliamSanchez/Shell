#!/bin/bash

release_file=/etc/os-release
logfiles=/var/log/updater.log
errorlog=/var/log/updater_errors.log

function checksum()
{
   sum=$(($1+$2))
   echo "the sum of $1 + $2 = $sum"
}

check_exit_status(){

  if [ $? -ne 0  ]
  then
     echo "An error ocurred, please check the $errorlog file."
  fi
}

checksum 1 2

if grep -q "Arch" $release_file 
then
    sudo pacman -Syu 1>>$logfile 2>>$errorlog
    check_exit_status
fi
