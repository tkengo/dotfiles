#!/bin/bash

if [ "$1" = "8" ]; then
    printf "\e[30m30:black\e[m"
    printf " \e[31m31:red\e[m"
    printf " \e[32m32:green\e[m"
    printf " \e[33m33:yellow\e[m"
    printf " \e[34m34:blue\e[m"
    printf " \e[35m35:magenta\e[m"
    printf " \e[36m36:cyan\e[m"
    printf " \e[37m37:white\e[m"
else
    for i in {0..255}; do
        printf "\x1b[38;5;${i}mcolour%03d " $i
        [ $(((i+1) % 10)) -eq 0 ] && printf "\n"
    done
fi

exit 0
