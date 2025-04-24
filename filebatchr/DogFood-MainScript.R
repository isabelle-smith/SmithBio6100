
# dog food = filebatchr()
# Biol 6100 Spring 2025
# Apr. 24, 2025 (class 27)


## Initialize ----

l('dog food: initialize')

library(upscaler)
library(ggplot2)

set_up_log(my_logfile = "dogfood-logfile.txt")

source_batch(folder="Functions")



## Create Global Variables ----

l('dog food: create global variables')

file_names <- list.files(pattern="\\.csv$",
                         path="CleanedData/ToyDataFiles",
                         full.names=TRUE)
param_names <- c("beta0", "beta1")



## Run with Function ----

l('dog food: run with function')

dogfood_df <- file_batch_r(file_names=file_names,
                           fun=dog_food_crunch_data,
                           param_names=param_names)


## Plot Results ----

mod_x <- seq(0,100,by=0.1)
mod_fun <- function(b0,b1,x) b0 + b1*x
mod_df <- data.frame(x=mod_x)

# for (i in 1:nrow(dogfood_df)){
#   
#   x<-7
#   
# }
# 
# mod_df |>
#   ggplot(aes(x=x)) +
#   geom_line(aes(y=y1))


