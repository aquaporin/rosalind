# computing GC content of DNA strings
library(Biostrings)

fast <- readDNAStringSet("data/rosalind_gc.txt")
c_content <- letterFrequency(fast,"C", as.prob = TRUE)
g_content <- letterFrequency(fast, "G", as.prob = TRUE)

cg_df <- data.frame("C" = c_content, "G" = g_content)
cg_df$total <- cg_df$C + cg_df$G

rosalind <- names(fast)
rownames(cg_df) <- rosalind

relevant <- cg_df[cg_df$total == max(cg_df$total), ]
id <- rosalind[which.max(relevant$total)]

numb <- relevant[which.max(relevant$total), ]$total * 100

paste(c(id, numb))

