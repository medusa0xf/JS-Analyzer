#!/bin/bash

# Check if the input file argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <input_file> [output_file]"
    exit 1
fi

# Input file containing JS URLs
input_file="$1"

# Output file to store the results, default to "output_results.txt" if not provided
output_file="${2:-output_results.txt}"

# Create the output file
> "$output_file"

# Check if /usr/local/bin/extract.sh exists and is executable
extract_sh="/usr/local/bin/extract.sh"
if [ ! -x "$extract_sh" ]; then
    echo "Error: /usr/local/bin/extract.sh script not found or not executable."
    exit 1
fi

# Process each JS URL from the input file
while read -r url; do
    # Get the name of the JS file from the URL
    js_file_name=$(basename "$url")

    # Fetch the JS file using curl and pass the output to /usr/local/bin/extract.sh
    result=$(curl -s "$url" | "$extract_sh")

    # Write the JS file name and result to the output file
    echo "JS File: $js_file_name" >> "$output_file"
    echo "$result" >> "$output_file"

    # Separator between each JS file's result
    echo "--------------------" >> "$output_file"
done < "$input_file"

echo "Processing complete. Results written to $output_file."
