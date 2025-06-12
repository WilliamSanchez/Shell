#!/bin/bash

echo "Execute code"

output=false;

make clean
make 

output=$(./exec_program)

echo "output process {$output}"
