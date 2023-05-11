#!/bin/bash

# Check if input file is provided
if [ -z "$1" ]
then
    echo "Usage: $0 input.yaml"
    exit 1
fi

# Convert all the keys to lowercase
awk 'BEGIN { FS=": *"; OFS=": " } /^[^#]/ { $1=tolower($1) } { print }' "$1" > "${1}.tmp"

# Replace the original file with the modified file
mv "${1}.tmp" "$1"
