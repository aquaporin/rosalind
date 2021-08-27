# Mendel's First Law

# k = homozygous dominant
# m = heterozygous
# n = homozygous recessive

# probability of offspring possessing a dominant allele when the number of k,m,
# and n specified.

# Set variables and the total number of organisms
k <- 26
m <- 30
n <- 23
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
p_recessive <- function(a1, a2) {
  # Either parent has is homozygous dominant
  if(a1 == "k" | a2 == "k") return(0)
  # Both parents heterozygous
  if(a1 == "m" && a2 == "m") return(0.25)
  # One parent heterozygous and other homozygous recessive
  if(a1 == "m" && a2 == "n") return(0.5)
  if(a1 == "n" && a2 == "m") return(0.5)
  # Both parents homozygous recessive
  if(a1 == "n" && a2 == "n") return(1)
}

# Fill in matrix
for (r in 1:nrow(matx)) {
  for (c in 1:ncol(matx)) {
    if (r == c) {
      next 
    }
    p1 <- rownames(matx)[r]
    p2 <- colnames(matx)[c]
    matx[r, c] <- p_recessive(p1, p2)
  }
}

# Calculate answer
p_dominant <- 1 - (sum(matx) / (total_pop^2 - total_pop))
print(p_dominant)