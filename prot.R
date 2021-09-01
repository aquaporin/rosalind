# Translating RNA into protein 


rna_string <- read.delim(file = "rosalind_prot.txt", header = FALSE)
rna_string <- rna_string$V1[1]

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
input <- input[!input == ""]            # extract only those elements that are not empty " " marks

# separate the codons from the corresponding amino acid letters 
codons <- input[seq(1, length(input), 2)]
aminos <- input[seq(2, length(input), 2)]

# put the codons and their corresponding amino acids into a data frame
codon_table <- data.frame("Codon" = codons, "Amino acid" = aminos)

# split the RNA string into codons
trna <- sapply(seq(from=1, to=nchar(rna_string), by=3),
               function(i) substr(rna_string, i, i+2))

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
 
