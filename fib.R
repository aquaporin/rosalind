# A function that calls itself is called a recursive function and this
# technique is known as recursion.


# the rule: the nth term of the sequence = n-1 + (k * n-2) 
curse <- function(n, k){
  if (n <= 2) return(1)
  k*curse(n-2, k) + curse(n-1, k)
}
