#!/bin/bash

if [[ ! $1 ]]; then
    echo -e "Usage:\n\n\t$0 'file name'"
    exit 1
fi

f=$(file 2>/dev/null /proc/*/fd/* | awk '$NF == "(deleted)"{print $(NF-1)}')

if [[ $f ]]; then
    echo "fd $f found..."
    cp -v "$f" "$1"
else
    echo >&2 "No fd found..."
    exit 2
fi
