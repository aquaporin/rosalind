# hamming distance between two strings

data1 <- read.delim("data/rosalind_hamm.txt", header = F)

s1 <- data1$V1[1]
s2 <- data1$V1[2]

hamming_dist <- function(s1,s2){
  mapply(function(x,y)           # mapply applies the function to the vectors element by element
  sum(x!=y),                     # calculate the instances of missed-matched elements
  x = strsplit(s1, ""),          # define x as the first string split into its elements
  y = strsplit(s2, ""))}         # define y as the second string split into its elements

print(hamming_dist(s1,s2))