# This code takes the best answer of the sample output.
# I do this because initially it gives some possible answers and Optimizes them
# gradually, this code takes the last optimum answer.
import os

# Samples
output_directory = "./Outputs_samples/"

# Where to save the Optimun answer
optimal_answers_directory = "./Optimal_answers/"
os.makedirs(optimal_answers_directory, exist_ok=True)

# Iterates through each file in the output directory
for filename in os.listdir(output_directory):
    if filename.endswith(".lp.txt"):
        # Construct the full path to the current output file
        output_file_path = os.path.join(output_directory, filename)

        # Read the contents of the output file
        with open(output_file_path, "r") as file:
            output_content = file.read().splitlines()

        # Find the index of the line containing "OPTIMUM FOUND" (case-insensitive)
        optimum_index = next((index for index, line in enumerate(output_content) if "OPTIMUM FOUND" in line.upper()), None)

        # Check if "OPTIMUM FOUND" is present in the output
        if optimum_index is not None:
            # Extract the optimal answer line (2 lines before there's the answer!)
            optimal_answer_line = output_content[optimum_index - 2].replace(")",").")

            # Save the optimal answer to a new .lp file (filename[:-7] to "remove" the ".txt.lp")
            new_lp_file_path = os.path.join(optimal_answers_directory, f"optimal_answer_{filename[:-7]}.lp")

            with open(new_lp_file_path, "w") as new_file:
                new_file.write(optimal_answer_line)
                print(f"Optimal answer saved for {filename}")
        else:
            print(f"No 'OPTIMUM FOUND' line in {filename}") # Never gonna happen...
