#!/bin/bash

# Check if all parameters are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

# Assign arguments to variables
filesdir="$1"
searchstr="$2"

# Check if filesdir is a directory
if [ ! -d "$filesdir" ]; then
    echo "$filesdir is not a directory"
    exit 1
fi

# Find all files in the directory and subdirectories
filelist=$(find "$filesdir" -type f)

# Initialize counters
numfiles=0
nummatches=0

# Iterate over each file in the file list
while read -r file; do
    # Count number of files
    ((numfiles++))

    # Count number of matching lines in the file
    matches=$(grep -c "$searchstr" "$file")
    ((nummatches += matches))
done <<< "$filelist"

# Print results
echo "The number of files are $numfiles and the number of matching lines are $nummatches"
