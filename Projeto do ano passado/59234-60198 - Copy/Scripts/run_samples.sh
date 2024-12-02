#!/bin/bash

# Find the path to clingraph.exe using 'where' command
clingraph_path=$(where clingraph.exe)

# Extract the directory path from the full path
clingraph_directory=$(dirname "$clingraph_path")

# Activate your Conda environment
source "$clingraph_directory/activate" base

echo "Conda environment activated"

# Create a directory to store the outputs
mkdir -p Outputs_samples

# Get all input files in the Samples folder
input_files=("Samples/"*)
echo "files: $input_files"
# Loop through each input file
for file in "${input_files[@]}"
do
    # Extract the filename without the path
    filename=$(basename "$file")

    # Run Clingo for the current input file and save the output
    "clingo" "Solutions/parcel1.lp" "$file" > "Outputs_samples/output_$filename.txt"
done

echo "All Clingo runs completed!"

# Deactivate the Conda environment
conda deactivate
