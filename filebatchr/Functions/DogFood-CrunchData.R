# --------------------------------------
# FUNCTION dog_food_crunch_data
# required packages: none
# description: operate on a single dataframe
# inputs: df = dataframe
#         param_names = character vector of output labels
# outputs: results = list of output values
########################################
dog_food_crunch_data <- function(df=NULL, param_names=NULL){
  
  # assign parameter defaults
  if (is.null(df)) {
    df <- data.frame(runif(10), runif(10), runif(10))
  }
  
  if (is.null(param_names)) {
    param_names <- list("beta0","beta1")
  }
  
  # function body
  
  x <- df[,1]
  y <- df[,2]
  
  set.seed(777)
  mod <- lm(y ~ x)
  
  results <- as.list(summary(mod)$coefficients[,"Estimate"])
  names(results) <- param_names
  
  
  return(results)
  
} # end of function crunch_data
# --------------------------------------
#dog_food_crunch_data()
