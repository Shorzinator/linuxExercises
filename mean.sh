#!/bin/bash


if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <column> [file.csv]" 1>&2
    exit 1
fi

column=$1
shift 

if [ "$#" -ge 1 ]; then
    file=$1
else
    file=/dev/stdin
fi

# Initialize variables
sum=0
line_count=0

# Process the file or stdin
# tail -n +2 skips the header of the CSV
tail -n +2 "$file" | cut -d',' -f"$column" | {
    while read value; do
        sum=$(echo "$sum + $value" | bc)
        ((line_count++))
    done


    if [ "$line_count" -eq 0 ]; then
        echo "Error: No data in column." 1>&2
        exit 1
    fi

    mean=$(echo "scale=4; $sum / $line_count" | bc)
    echo "Mean of column $column: $mean"
}