#!/bin/bash

logfile=job_results.log

echo "The script ran at the following time: $(date)" > $logfile

echo "You entered the argument: $1, $2"

ls $1

lines=$(ls -lh $1 | wc -l)

if [ $# -ne 1  ]
then
  echo "This script requires exactly one directory path passed it."
  echo "Please try again"
  exit 1
fi

echo "you have $(($lines-1)) objects in the $1 directory." 

