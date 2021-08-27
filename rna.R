input <- read.delim("data/rosalind_rna.txt", header =  F)
dna <- input$V1

rna <- data.frame(lapply(dna, function(dna) {
  gsub("T", "U", dna)
}))

print(as.character(rna))