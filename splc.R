library(tidyverse)
library(Biostrings)
initial <- readDNAStringSet("data/splc.txt")

# step 1. intron splicing and concatenate exons
original <- as.character(initial[1])
introns <- initial[2:length(initial)]
introns <- as.data.frame(introns)

dna <- as.character(initial$Rosalind_4638[ ,2])

# ordered_introns <- introns$x[order(nchar(introns$x), decreasing = TRUE, introns$x)]

for (i in introns$x) {
  dna <- str_remove(string = dna, pattern = i)
}

# step 2. transcription of spliced DNA into RNA
rna <- gsub("T", "U", dna)

# step 3. translate RNA into protein string 

input <- "UUU F      CUU L      AUU I      GUU V
          UUC F      CUC L      AUC I      GUC V
          UUA L      CUA L      AUA I      GUA V
          UUG L      CUG L      AUG M      GUG V
          UCU S      CCU P      ACU T      GCU A
          UCC S      CCC P      ACC T      GCC A
          UCA S      CCA P      ACA T      GCA A
          UCG S      CCG P      ACG T      GCG A
          UAU Y      CAU H      AAU N      GAU D
          UAC Y      CAC H      AAC N      GAC D
          UAA Stop   CAA Q      AAA K      GAA E
          UAG Stop   CAG Q      AAG K      GAG E
          UGU C      CGU R      AGU S      GGU G
          UGC C      CGC R      AGC S      GGC G
          UGA Stop   CGA R      AGA R      GGA G
          UGG W      CGG R      AGG R      GGG G"

# split the string into a vector of multiple strings.
input <- gsub("[\r\n]", "", input)      # \r\n = CR + LF ??? Used as a new line character in Windows
input <- strsplit(input, split = " ")   # use " " marks to split strings at all spaces
input <- input[[1]]                     # 
input <- input[!input == ""]

# separate codons from amino acids + put into a table  
codons <- input[seq(1, length(input), 2)]
aminos <- input[seq(2, length(input), 2)]
codon_table <- data.frame("Codon" = codons, "Amino acid" = aminos)

# split the RNA string into codons
trna <- sapply(seq(from=1, to=nchar(rna), by=3),
               function(i) substr(rna, i, i+2))

# translate the codons into amino acids using the codon table
ribosome <- function(trna){
  protein <- c()
  for (codon in trna){
    if (codon == "UGA" | codon == "UAG" | codon == "UAA") return(protein)
    
    codon_info <- codon_table[codon_table$Codon == codon, ]
    amino_acid <- codon_info$Amino.acid
    protein <- c(protein, amino_acid)
  }
}

protein_string <- paste(ribosome(trna), collapse = "")
print(protein_string)

