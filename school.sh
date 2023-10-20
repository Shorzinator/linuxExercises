#!/bin/bash


sum=0



count=0

# Process the CSV file
cat Property_Tax_Roll.csv |
grep "MADISON SCHOOLS" |
cut -d',' -f7 |
{
    # Read each line (value)
    while read value; do
        # Add the value to the sum
        sum=$(echo "$sum + $value" | bc)

        # Increment the count
        ((count++))
    done

    # Calculate the average
    average=$(echo "scale=2; $sum / $count" | bc)

    # Print the average
    echo "Average Total Assessed Value for properties in the MADISON SCHOOLS district: $average"
}