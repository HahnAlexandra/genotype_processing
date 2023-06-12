#!/bin/bash


# Iterate over the folders
echo "Iterating over folders"
for folder in ./*/; do
  # Move into the current folder
  cd "$folder" || continue

# Run the R script on AB1 files in the current folder
  for ab1_file in *.ab1; do
    Rscript ../seq_processing.R "$ab1_file"
  done

# Combine the output FASTA files into a temporary file
  cat *.fa > temp.fasta

  # Add folder name as a prefix to each contig in the temporary file
  sed "s/^>/>$(basename "$folder")/g" temp.fasta > temp_modified.fasta

  # Move the temporary modified file back to the original filename
  mv temp_modified.fasta temp.fasta

  # Append the temporary file to the main output FASTA file
  cat temp.fasta >> "../combined.fasta"

  # Remove the temporary file
  rm temp.fasta

 # Move back to the parent directory
  cd ..
done
