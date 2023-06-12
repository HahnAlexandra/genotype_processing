# genotype_processing
takes .ab1 files from Sanger seq, merges F and R and combines reads to a single .fasta

copy folder to your instance
within the directory execute ./genotype_processing.sh

#IMPORTANT

-seq-processing.R requires the sangeranalyseR package

-for the script to run, your .ab1 files should be named {readname}_{index}_F/R.ab1

-reads belonging to a single organism should be in a subdirectory with an informative unique name


