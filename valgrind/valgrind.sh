#!/bin/bash

echo "Execute code"

exec ('gcc code_1.c -std=c99  -Wall -Werror=vla -g -o code_1')
