# Genotype sequence processing #

#start with .ab1 files
#make sure they are named readname_index_F/R.ab1

library(sangeranalyseR)

#assemble contig

#ABIF_Directory is the directory containing all .ab1 files
#contigName is reg ex that matches filemanes included in analysis
#REGEX_Suffix* is regex that matches all filenames in F or R directions

parentDir <- "./"

my_contig <- SangerContig(ABIF_Directory = parentDir, 
                          REGEX_SuffixForward = "_[0-9]*_F.ab1$",
                          REGEX_SuffixReverse = "_[0-9]*_R.ab1$",
                          contigName = "Acartia")

#my_contig@objectResults@readResultTable

#look at output in shiny app
#launchApp(my_contig)

writeFasta(my_contig,
           outputDir         = parentDir,
           compress          = FALSE,
           compression_level = NA,
           selection         = "contig")

