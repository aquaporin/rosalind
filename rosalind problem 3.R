input <- read.delim("data/problem3.txt", header =  F) # read in .txt file
cdna <- annoy$V1[1] # extract string

rt <- rev(strsplit(cdna, NULL)[[1]])    # reverse the string
paste(rt, collapse = "")                # collapse the string

reverse_compliment <- chartr("ATGC", "TACG", rt)
paste(reverse_compliment, collapse = "")