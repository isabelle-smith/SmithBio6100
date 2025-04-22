
# filebatchr() for operating on batch files
# Biol 6100 Spring 2025
# started Apr. 15, 2025 (class 24)

library(upscaler)
library(ggplot2)

set_up_log()

#build_function("create_toy_data_files")



## Apr. 17, 2025 (class 25) - - - - - - - - - - - - - - - - - - - - -

# source_batch(folder="Functions")
# 
# 
# #create_toy_data_files(nrow=sample(5:100, 1), ncol=10, nfiles=sample(50:100, 1))
# 
# 
# #build_function("crunch_data")
# 
# 
# file_names <- list.files(pattern="\\.csv$",
#                          path="CleanedData/ToyDataFiles",
#                          full.names=TRUE)
# 
# crunch_cols <- c(4,5)
# param_names <- c("avg", "skew", "weird")
# 
# 
# ouput_df <- as.data.frame(matrix(rep(NA, length(file_names)*length(param_names)),
#                                  nrow=length(file_names)))
# 
# names(ouput_df) <- param_names



## Apr. 22, 2025 (class 26) - - - - - - - - - - - - - - - - - - - - -

#source_batch(folder="Functions")


#create_toy_data_files(nrow=15, ncol=10, nfiles=8)


## GLOBAL VARIABLES ~ ~ ~ ~ ~ ~ ~

file_names <- list.files(pattern="\\.csv$",
                         path="CleanedData/ToyDataFiles",
                         full.names=TRUE)
crunch_cols <- c(4,5)
param_names <- c("avg", "skew", "weird")


# ## NEW: lapply() ~ ~ ~ ~ ~ ~ ~
# 
# z <- lapply(file_names, read.table, sep=",") ## loads all dfs at once ()
# final <- lapply(z, crunch_data)



## back to the loops ~ ~ ~ ~ ~ ~ ~

m <- matrix(rep(NA, length(file_names)*length(param_names)), nrow=length(file_names))
output_df <- as.data.frame(m)
names(output_df) <- param_names
nobs <- rep(NA, length(file_names))

for (i in 1:length(file_names)){

  df <- read.table(file=file_names[[i]], header=TRUE, sep=",")

  . <- crunch_data(df=df, crunch_cols=unlist(crunch_cols), param_names=param_names)

  output_df[i,] <- .

  nobs[i] <- nrow(df)

}

#output_df

output_df <- cbind(ID=1:length(file_names),
                   file=basename(unlist(file_names)),
                   nobs=nobs,
                   output_df)



## one big file ~ ~ ~ ~ ~ ~ ~

##build_function("file_batch_r")
# 
# source_batch(folder="Functions")
# 
# file_batch_r(file_names=file_names,
#              fun=crunch_data,
#              crunch_cols=crunch_cols,
#              param_names=param_names)


