#!/bin/bash

# Check if two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_directory> <target_directory>"
    exit 1
fi

# Assign arguments to variables
SOURCE_DIR=$1
TARGET_DIR=$2

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory does not exist."
    exit 1
fi

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Iterate over the subdirectories of the source directory (first level only)
for subdir in "$SOURCE_DIR"/*/; do
    # Check if it's a directory
    if [ -d "$subdir" ]; then
        subdir_name=$(basename "$subdir")

        # Create corresponding subdirectory in the target directory
        mkdir -p "$TARGET_DIR/$subdir_name"

        # Iterate over .proto files in the subdirectory
        for proto_file in "$subdir"/*.proto; do
            # Check if any .proto files exist
            echo "Processing files in $subdir_name"
            if [ -f "$proto_file" ]; then
                proto_filename=$(basename "$proto_file" .proto)                

                # Run convert.js and save the output to a .json file in the target subdirectory
                npx pbjs -t json --keep-case "$proto_file" > "$TARGET_DIR/$subdir_name/$proto_filename.json"
            fi
        done
    fi
done

echo "Conversion complete!"