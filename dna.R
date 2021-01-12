s <- readLines("./input.txt")
nts <- strsplit(s, "")
nts <- nts[[1]]
table(nts)