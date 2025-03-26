# --------------------------------------
# FUNCTION extract_year
# required packages: stringr
# description: Extract the year from each file name
# inputs: file name
# outputs: numeric year
########################################
extract_year <- function(filepath=NULL){
  
  # assign parameter defaults - - - - - - - - - - - - - -
  if (is.null(filepath)) {
    filepath <- "WHAT.A.great_year.2002-01.extra.1234567.csv"
  }
  
  # get year - - - - - - - - - - - - - - - - - - - - -
  year <- stringr::str_extract(filepath, "([[:digit:]]{4})-[[:digit:]]{2}", group=1)
  
  # return line - - - - - - - - - - - - - - - - - - - - -
  return(as.numeric(year))

} # end of function extract_year
# --------------------------------------
# extract_year()
