
## BIOL6100 - Class 9
## Isabelle Smith
## Feb. 11, 2025

## - - - - - - -

## intro to R vi

## - - - - - - -



## Data curation
## - - - - - - -
## * GitHub repository
## * Metadata
## * Metadata template
## * Example of Lauren’s data
## - - - - - - -



## Exporting and importing data
## - - - - - - -
## + in `Files` click on `ToyData.csv` and hit `View File`

# code for reading in a data frame from a.csv

my_data <- read.table(file="ToyData.csv",
                      header=TRUE,
                      sep=",",
                      comment.char="#")
                      ## error = delete then re-add blank line
                      ## edit file in `View File` mode

# inspect object
str(my_data)

# now add a column
my_data$newVar <- runif(4)
head(my_data)
## - - - - - - -



## Use write.table to export to a data file
## - - - - - - -
write.table(x=my_data,
            file="SampleOutputFile.csv",
            #HEADER=TRUE,   ## delete
            sep=",")
## - - - - - - -


## `saveRDS()`: useful when you are working only in R
## - - - - - - -
saveRDS(my_data, file="my_data.RDS") # .RDS suffix is not required, but good for clarity
## - - - - - - -

## `readRDS()`
## - - - - - - -
restored_my_data <-readRDS("my_data.RDS") 
## - - - - - - -
