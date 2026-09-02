#!/bin/bash


# Write a shell script finder-app/finder.sh as described below:

#     Accepts the following runtime arguments: the first argument is a path to a directory on the filesystem, referred to below as filesdir; the second argument is a text string which will be searched within these files, referred to below as searchstr

#     Exits with return value 1 error and print statements if any of the parameters above were not specified

#     Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem

#     Prints a message "The number of files are X and the number of matching lines are Y" where X is the number of files in the directory and all subdirectories and Y is the number of matching lines found in respective files, where a matching line refers to a line which contains searchstr (and may also contain additional content).

# Example invocation:

#        finder.sh /tmp/aesd/assignment1 linux


# Check if two arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if filesdir is a valid directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a valid directory"
    exit 1
fi

# Count the number of files recursively
num_files=$(find -L "$filesdir" -type f | wc -l)

# Count the number of matching lines
num_matching_lines=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Print the result
echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"


