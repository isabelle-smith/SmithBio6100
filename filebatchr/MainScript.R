
# filebatchr() for operating on batch files
# Biol 6100 Spring 2025
# started Apr. 15, 2025 (class 24)

library(upscaler)
library(ggplot2)

set_up_log()

#build_function("create_toy_data_files")



## Apr. 17, 2025 (class 25) - - - - - - - - - - - - - - - - - - - - -

source_batch(folder="Functions")


#create_toy_data_files(nrow=sample(5:100, 1), ncol=10, nfiles=sample(50:100, 1))


#build_function("crunch_data")


file_names <- list.files(pattern="\\.csv$",
                         path="CleanedData/ToyDataFiles",
                         full.names=TRUE)

crunch_cols <- c(4,5)
param_names <- c("avg", "skew", "weird")


ouput_df <- as.data.frame(matrix(rep(NA, length(file_names)*length(param_names)),
                                 nrow=length(file_names)))

names(ouput_df) <- param_names


