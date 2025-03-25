
## BIOL6100 - Class 18
## Isabelle Smith
## Mar. 25, 2025

## - - - - - - -

## strategic coding practices ii

## - - - - - - -





## ~ ~ ~ ~ ~ ~ ~ OLD ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

## - - - - - - -

library(pracma)
library(pryr)
library(devtools)
## ...
library(upscaler)

## - - - - - - -





## ...





## - - - - - - -

x <- runif(10)

saveRDS(object=x, file="DataObjects/x.rds")

restored_x <- readRDS(file="DataObjects/x.rds")

## . . . . . . . NEW . . . . . . . . . . . . . . . . . . . . . . . . . . . .

y <- rnorm(3)
z <- pi

bundle <- list(x=x, y=y, z=z)

saveRDS(object=bundle, file="DataObjects/bundle.rds")

restored_bundle <- readRDS(file="DataObjects/bundle.rds")

restored_bundle$y
restored_bundle[[3]]

## - - - - - - -





## Log Files
## - - - - - - -

set_up_log()        ## creates `logfile.txt`
                    ## see package `Packrat`

set_up_log(user_seed=100)


