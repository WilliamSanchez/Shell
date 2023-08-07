#!/bin/bash

release_file=/etc/os-release
logfiles=/var/log/updater.log
errorlog=/var/log/updater_errors.log

check_exit_status(){

  if [ $? -ne 0  ]
  then
     echo "An error ocurred, please check the $errorlog file."
  fi
}


if grep -q "Arch" $release_file 
then
    sudo pacman -Syu 1>>$logfile 2>>$errorlog
    check_exit_status
fi
