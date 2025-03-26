# --------------------------------------
# FUNCTION calc_abundance
# required packages: none
# description: Calculate Abundance for each year (Total number of individuals found)
# inputs: data.frame
# outputs: numeric abundance
########################################
calc_abundance <- function(df=NULL){
  
  # assign parameter defaults - - - - - - - - - - - - - -
  if (is.null(df)) {
    df <- data.frame(x=runif(1))
  }
  
  # calculations - - - - - - - - - - - - - - - - - - - - -
  abundance <- nrow(df)
  
  # return line - - - - - - - - - - - - - - - - - - - - -
  return(abundance)

} # end of function calc_abundance
# --------------------------------------
# calc_abundance()
