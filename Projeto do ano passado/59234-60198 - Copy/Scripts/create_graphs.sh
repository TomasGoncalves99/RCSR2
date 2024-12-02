#!/bin/bash

# Find the path to clingraph.exe using 'where' command
clingraph_path=$(where clingraph.exe)

# Extract the directory path from the full path
clingraph_directory=$(dirname "$clingraph_path")

# Activate your Conda environment
source "$clingraph_directory/activate" base

# Create a directory to store the outputs
mkdir -p Graphs

echo "Conda environment activated"

# Replace this with the path to the directory containing your optimal answer files
optimal_answers_directory="./Optimal_answers/"

# Replace this with the path to your ClingraphCode directory
clingraph_code_path="Solutions/"

# Iterate through each file in the optimal answers directory
for filename in $optimal_answers_directory*.lp; do
    # Extract the base name (without extension) of the optimal answer file
    base_name=$(basename "$filename" .lp)

    # Run clingo for the current optimal answer
    clingo_command="clingo $filename --outf=2 --opt-mode=opt"

    # Run clingraph for the current optimal answer
    clingraph_command="clingraph --viz=${clingraph_code_path}/viz.lp --type=digraph --format=svg --select-model=0 --out=render --name-format=${base_name} --dir=Graphs"

    # Combine the commands and run them using eval
    full_command="$clingo_command | $clingraph_command"
    eval $full_command

    echo "Processed $filename"
done

echo "Clingraph command executed"

# Deactivate the Conda environment
conda deactivate
