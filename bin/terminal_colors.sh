#!/bin/bash

if [ "$1" = "8" ]; then
    printf "\e[30mblack\e[m"
    printf " \e[31mred\e[m"
    printf " \e[32mgreen\e[m"
    printf " \e[33myellow\e[m"
    printf " \e[34mblue\e[m"
    printf " \e[35mmagenta\e[m"
    printf " \e[36mcyan\e[m"
    printf " \e[37mwhite\e[m"
else
    for i in {0..255}; do
        printf "\x1b[38;5;${i}mcolour%03d " $i
        [ $(((i+1) % 10)) -eq 0 ] && printf "\n"
    done
fi
