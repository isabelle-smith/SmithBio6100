# --------------------------------------
# FUNCTION run_regression
# required packages: none
# description: Run a simple regression model for Species Richness (S) vs. Abundance for every year
# inputs: richness & abundance (vectors)
# outputs: regression model
########################################
run_regression <- function(richness=NULL,abundance=NULL){

# assign parameter defaults - - - - - - - - - - - - - -
  if (is.null(richness)) {
    richness <- runif(10)
  }
  
  if (is.null(abundance)) {
    abundance <- runif(10)
  }
  
  # calculations - - - - - - - - - - - - - - - - - - - - -
  mod <- lm(richness ~ abundance)
  
  # return line - - - - - - - - - - - - - - - - - - - - -
  return(mod)

} # end of function run_regression
# --------------------------------------
# run_regression()
