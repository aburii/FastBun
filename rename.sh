#!/bin/bash

# Check if argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <replacement_string>"
    exit 1
fi

# Store the replacement string
replacement_string=$1

# Find files containing 'test' in the current directory and its subdirectories, excluding /node_modules
files=$(grep -rl 'test' --exclude-dir=node_modules --exclude=bun.lockb .)

echo $files

# Loop through each file and replace 'test' with the provided string
for file in $files; do
    sed -i "" "s/fastbun/$replacement_string/g" $file
    echo "Replaced 'test' with '$replacement_string' in $file"
done

echo "Replacement complete."