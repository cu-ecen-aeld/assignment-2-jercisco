#!/bin/bash

# Check if all parameters are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

# Assign arguments to variables
writefile="$1"
writestr="$2"

echo $writefile

# Create the file and write to it
echo "$writestr" > "$writefile"

# Check if file was created successfully
if [ ! -f "$writefile" ]; then
    echo "Error: Could not create file $writefile"
    exit 1
fi

echo "File $writefile created successfully"
