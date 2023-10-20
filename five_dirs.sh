#!/bin/bash
mkdir five

for dir_num in {1..5}; do
    mkdir "five/dir$dir_num"

    for file_num in {1..4}; do
        for line in $(seq $file_num); do
            echo $file_num >> "five/dir$dir_num/file$file_num"
        done
    done
done