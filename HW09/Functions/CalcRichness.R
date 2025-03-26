# --------------------------------------
# FUNCTION calc_richness
# required packages: none
# description: Calculate Species Richness for each year(Number of unique species found)
# inputs: data.frame
# outputs: numeric species richness
########################################
calc_richness <- function(df=NULL){
  
  # assign parameter defaults - - - - - - - - - - - - - -
  if (is.null(df)) {
    df <- data.frame(scientificName=sample(LETTERS, 100, replace=TRUE))
  }
  
  # calculations - - - - - - - - - - - - - - - - - - - - -
  richness <- length(unique(df$scientificName))
  
  # return line - - - - - - - - - - - - - - - - - - - - -
  return(richness)
  
} # end of function calc_richness
# --------------------------------------
# calc_richness()
