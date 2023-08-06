#!/bin/bash

for n in {1..10}
do
  echo $n
  sleep 0.05
done


for file in logfiles/*.log
do
   tar -czvf $file.tar.gz $file
done
