# Mendel's First Law

# k = homozygous dominant
# m = heterozygous
# n = homozygous recessive

# probability of offspring possessing a dominant allele when the number of k,m,
# and n specified.

# Set variables and the total number of organisms
k <- 2
m <- 3
n <- 2
total_pop <- sum(k,m,n)

# Create matrix filled with zeroes
matx <- matrix(0, total_pop,  total_pop)

# Make a vector with correct number of k, n, and m members
totk <- replicate(k, "k")
totm <- replicate(m, "m")
totn <- replicate(n, "n")
pop <- c(totk, totm, totn)

# Set row and column names of matrix
rownames(matx) <- pop
colnames(matx) <- pop

# Create probability function. Calculates P(recessive).
p_recessive <- function(a1, a2){
  if(a1 == "k") return(0)
  if(a2 == "k") return(0)
  if(a1 == "m" && a2 == "m") return(0.25)
  if(a1 == "m" && a2 == "n") return(0.75)
  if(a1 == "n" && a2 == "m") return(0.75)
  if(a1 == "n" && a2 == "n") return(1)
}

# Fill in matrix
# Calculate answer
# Turn everything into a function

empty_vec <- vector()

for(i in matx){
  empty_vec <- empty_vec + p_recessive(matx[i, ], matx[ ,i])
}

