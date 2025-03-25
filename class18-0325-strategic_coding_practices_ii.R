
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
echo_log_console(TRUE)


l() #plain log entry
l('log message that is echoed to the screen')
echo_log_console(FALSE)
l('this message only shows in the log file')
# load libraries
l('load libraries')


set_up_log(overwrite_log=FALSE)       ## need to rerun this line for new log file
l()
l('add a text message for this run')

## - - - - - - -





## Progress Bar for For-Loops
## - - - - - - -

for (k in 1:100){
  show_progress_bar(k)
  Sys.sleep(0.075)
}
l('end of loop')
# Note that the progress bar also points errors


for (k in 1:100){
  show_progress_bar(k)
  Sys.sleep(0.075)
  if(k==52)print(ghost)
}
l('end of loop with error')


for (k in 1:1000){
  show_progress_bar(index=k, counter=50, dot=5)
  Sys.sleep(0.0075)
}
l('end of long loop')

## - - - - - - -





## pracma: tic() & toc()
## - - - - - - -

tic()
for (k in 1:100){
  show_progress_bar(k)
  Sys.sleep(0.075)
}
toc()
l('end of timed loop')

## - - - - - - -





## pryr: mem_used()
## - - - - - - -

set_up_log(overwrite_log=FALSE)
for (i in 1:100){
  show_progress_bar(k)
  l(paste('memory_used=', trunc(mem_used()/10^6),
          "MB;", " i=",i, sep=''))
  z <- runif(n=10^i)
} ## Error: cannot allocate vector of size 74.5 Gb

## - - - - - - -





## Coding with User-Defined Functions
## - - - - - - -

build_function("fit_regression") # creates an R script template for the function
source("Functions/FitRegression.R")
fit_regression()                    ## "...checking function: fit_regression()"


## punctuation conventions
## *  snake_case
## *  camelCase
## *  PascalCase
## *  kebab-case
## *  SCREAMING_SNAKE_CASE


## <-- look @ "Functions/FitRegression.R" -->


## a good function should...
## *  give descriptive (verb-based) name
## *  need limited input (<= 3 things)
## *  does one thing in isolation
## *  relatively short (<= one screen of code)
## *  simple (passable) output
## *  only use given inputs (reusable)
## *  NOT use global variables (reusable)
## *  NOT make global variables
## *  make default values
## - - - - - - -





## Functional Programming
## - - - - - - -

## writing pseudo-code:
## 1. list major steps of task
## 2. make function for each step


build_function(c("select_recipes",
                 "write_shopping_list",
                 "buy_groceries",
                 "cook_meal",
                 "serve_meal",
                 "clean_up"))

## . . . . . . .

