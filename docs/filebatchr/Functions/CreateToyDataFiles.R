# --------------------------------------
# FUNCTION create_toy_data_files
# required packages: none
# description: build a set of toy csv files
# inputs: number of files, max rows, max columns
# outputs: a set of .csv files in a new subfolder
########################################
create_toy_data_files <- function(nrow=NULL,
                                  ncol=NULL,
                                  nfiles=NULL){

  # assign parameter defaults
  if (is.null(nrow) | is.null(ncol) | is.null(nfiles)) {
    nrow=10
    ncol=9
    nfiles=6
  }
  
  # function body
  
  file_labels <- create_padded_labels(n=nfiles, string="Toy_Data", suffix=".csv")
  
  for (i in 1:nfiles){
    
    df <- as.data.frame(matrix(runif(nrow*ncol), nrow=nrow))
    
    write.table(df, file=paste("CleanedData/ToyDataFiles/", file_labels[i], sep=""), sep=",")
  
  }
  
  #l('...checking function: create_toy_data_files()')

} # end of function create_toy_data_files
# --------------------------------------
#create_toy_data_files()
