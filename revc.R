s <- readLines("./input.txt")
strand <- strsplit(s, "")[[1]]
rev_strand <- rev(strand)

rev_string <- paste(rev_strand, collapse='')
rev_string
