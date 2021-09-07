# calculating protein mass


# read in the protein string
prot_string <- read.delim(file = "C:/Users/sarah/Desktop/rosalind/data/rosalind_prtm (2).txt",header = FALSE)
prot_string <- prot_string$V1[1]
input <- "A   71.03711
          C   103.00919
          D   115.02694
          E   129.04259
          F   147.06841
          G   57.02146
          H   137.05891
          I   113.08406
          K   128.09496
          L   113.08406
          M   131.04049
          N   114.04293
          P   97.05276
          Q   128.05858
          R   156.10111
          S   87.03203
          T   101.04768
          V   99.06841
          W   186.07931
          Y   163.06333"

# split the string into a vector of multiple strings.
input <- gsub("[\r\n]", "", input)      # \r\n = CR + LF ??? Used as a new line character in Windows
input <- strsplit(input, split = " ")   # use " " marks to split strings at all spaces
input <- input[[1]]                     # 
input <- input[!input == ""]            # extract only those elements that are not empty " " marks

# create a data frame with the input data
aa_letter <- input[seq(1, length(input), 2)]
monoisotopic_mass <- input[seq(2, length(input), 2)]
MIMT <- data.frame("amino-acid letter" = aa_letter, "monoisotopic mass" = monoisotopic_mass )

# split the protein string into individual character elements

pro <- strsplit(prot_string, "")[[1]]

# create function to check the monoisotopic mass table + calculate the mass of the protein string

MIM_calculator <- function(pro){
  mim_mass = 0
  for (i in pro) {
  ro <- as.numeric(MIMT[MIMT$amino.acid.letter == i, ]$monoisotopic.mass) 
  mim_mass = mim_mass + ro
  }
}

paste(mim_mass)

