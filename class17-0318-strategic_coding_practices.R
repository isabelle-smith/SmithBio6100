
## BIOL6100 - Class 17
## Isabelle Smith
## Mar. 20, 2025

## - - - - - - -

## strategic coding practices

## - - - - - - -



## load libraries ----
library(pracma)
library(pryr)
library(devtools)
install_github("ngotelli/upscaler")
help(package="upscaler")
library(upscaler)

## subheader A ----

## subheader B ----





add_folder()        ## adds necessary folders for organization:
                    ## [1] "OriginalData", "CleanedData",
                    ## [3] "Scripts", "Functions", "Plots",
                    ## [6] "Outputs","DataObjects", "Markdown"

                    ## never overwrites folders

                    ## has hidden `keep` files for GitHub


add_folder(c("specialfolder1","specialfolder2"))        ## alternative


metadata_template(file="OriginalData/MyData.csv")

data_table_template(data_frame=NULL, file_name="Outputs/TableA.csv")

create_padded_labels(n=10, string="Species", suffix=".txt")





## - - - - - - -





x <- runif(10)

saveRDS(object=x, file="DataObjects/x.rds")

restored_x <- readRDS(file="DataObjects/x.rds")








