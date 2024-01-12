#!/bin/bash
echo "IN test.sh"
fullpath=~/Pictures/storage/$1
[[ -f $fullpath ]] || (echo "File $fullpath Not Exists" && exit)
feh $fullpath

