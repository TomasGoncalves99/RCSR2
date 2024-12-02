#!/bin/bash

# run_samples.sh
echo "Running run_samples.sh..."
./Scripts/run_samples.sh
echo "run_samples.sh completed."

# create_optimals.py
echo "Running create_optimals.py..."
python ./Scripts/create_optimals.py
echo "create_optimals.py completed."

# create_graphs.sh
echo "Running create_graphs.sh..."
./Scripts/create_graphs.sh
echo "create_graphs.sh completed."

echo "All scripts completed!"
