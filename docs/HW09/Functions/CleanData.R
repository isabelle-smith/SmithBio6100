# --------------------------------------
# FUNCTION clean_data
# required packages: none
# description: Cleaning the data for any empty/missing cases
# inputs: path to .csv
# outputs: data.frame with no scientificName NAs
########################################
clean_data <- function(filepath=NULL){

  # assign parameter defaults - - - - - - - - - - - - - -
  if (is.null(filepath)) {
    
    dirty_x <- c(runif(75), rep(NA,25))
    dirty_y <- c(runif(75), rep(NA,25))
    
    dirty_df <- data.frame(x=sample(dirty_x, 100),
                           y=sample(dirty_y, 100))
  } else {
    
    dirty_df <- read.csv(filepath)
    
  }
  
  # cleaning - - - - - - - - - - - - - - - - - - - - -
  clean_df <- dirty_df[complete.cases(dirty_df[,"scientificName"]),]
  
  
  # return line - - - - - - - - - - - - - - - - - - - - -
  return(clean_df)

} # end of function clean_data
# --------------------------------------
# clean_data()
