#!/bin/bash

for i in {0..255}; do
    printf "\x1b[38;5;${i}mcolour%03d " $i
    [ $(((i+1) % 10)) -eq 0 ] && printf "\n"
done
