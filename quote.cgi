#!/bin/bash

symbol=$1
lookup=/usr/local/quote/epic.out
echo -e "Content-Type:text/plain\n"

egrep -i "^${symbol}" /usr/local/quote/epic.out |cut -d: -f2
