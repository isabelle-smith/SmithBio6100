# --------------------------------------
# FUNCTION file_batch_r
# required packages: none
# description:
# inputs: file_names = list of file names
#         crunch_cols = list of columns to analyze in df
#         fun = name of operations function
# outputs: output_df with rows for each data file
########################################
file_batch_r <- function(file_names=NULL, fun=NULL, param_names=NULL){
  
  # assign parameter defaults
  if (is.null(file_names)){
    stop("No input...")
  }
  
  # function body

  m <- matrix(rep(NA, length(file_names)*length(param_names)), nrow=length(file_names))
  output_df <- as.data.frame(m)
  names(output_df) <- param_names
  nobs <- rep(NA, length(file_names))
  
  for (i in 1:length(file_names)){
    
    df <- read.table(file=file_names[[i]], header=TRUE, sep=",")
    
    . <- fun(df=df, param_names=param_names)
    
    output_df[i,] <- .
    
    nobs[i] <- nrow(df)
    
  }
  
  #output_df
  
  output_df <- cbind(ID=1:length(file_names),
                     file=basename(unlist(file_names)),
                     nobs=nobs,
                     output_df)
  
  return(output_df)

} # end of function file_batch_r
# --------------------------------------
# file_batch_r()
