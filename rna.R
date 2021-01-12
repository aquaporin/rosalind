dna <- readLines("./input.txt")
rna <- gsub("T","U", dna)
rna