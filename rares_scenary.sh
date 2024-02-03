#!/bin/bash

echo "input a variavel"

num=$1
variavel=$2

# if variavel = static or num is equal to 1   continue
#[ "$variavel" = "static" ] || [ $num -eq 1 ]  || exit

# if variavel = static or num is equal to 1   exit
[ "$variavel" = "static" ] || [ $num -eq 1 ] && exit

echo "1 Variavel $num"


[ "$variavel" = "exit" ] || exit

echo "2 Variavel $variavel"
exit

#local is only used in a function
