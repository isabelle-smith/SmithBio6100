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
    ncol=10
    nfiles=15
  }
  
  # function body
  
  for (i in 1:nfiles){
    df <- as.data.frame(matrix(runif(nrow*ncol), nrow=nrow))
    
    file_labels <- create_padded_labels(n=nfiles, string="Toy_Data", suffix=".csv")
    
    write.table(df, file=paste("CleanedData/ToyDataFiles/", file_labels[i], sep=""))
  
  }
  
  #l('...checking function: create_toy_data_files()')

} # end of function create_toy_data_files
# --------------------------------------
#create_toy_data_files()
