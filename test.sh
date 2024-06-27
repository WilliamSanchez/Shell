#!/bin/sh

myvar="Hi there"

echo $myvar
echo "$myvar"
echo '$myvar'
echo \$myvar

echo Enter some text
read myvar

echo '$myvar' now equals $myvar

echo "Vamos ocultar o echo"

echo "input a variavel"
stty -echo
read var
stty echo
echo "After ocult variavel $var"

exit 0
