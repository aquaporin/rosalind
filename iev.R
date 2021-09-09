# calculating expected offspring

# AA-AA, AA-Aa, AA,aa, Aa-Aa, Aa-aa, aa-aa)
couples <- c(19873, 17122, 16848, 17474, 19511, 17445)
probdom <- c(1, 1, 1, 3/4, 1/2, 0)
df <- data.frame("number of couples" = couples, "P(dominant)" = probdom)
df$product <- df$number.of.couples * df$P.dominant.
total_couples <- sum(couples[ couples != 0 ])
avg_dominant <- sum(df$product) / total_couples
expected <- avg_dominant * (2*total_couples)
print(expected)
