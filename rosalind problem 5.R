input <- read.delim("data/rosalind_subs.txt", header = F)

hm <- gregexpr(pattern = "(?=CGTCCACCG)", # a regular expression inc. the substring and a zero-width positive lookahead assertion
         text = input$V1[1],              # the string we are searching for the substring in
         perl = TRUE)                     # type of reg exp library.


hm[[1]][1:26] # extract the first element of the list and return the values 1-25.