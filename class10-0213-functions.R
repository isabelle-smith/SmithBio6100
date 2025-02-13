
## BIOL6100 - Class 13
## Isabelle Smith
## Feb. 12, 2025

## - - - - - - -

## intro to R viii

## - - - - - - -



## Scoping In Functions
## - - - - - - -

## - global variables: visible to all parts of the code; declared in main body
## - local variables: visible only within function; declared in function or passed to function through parameters
## - functions “can” see variables in global environment
## - global environment cannot see variables in function environment

my_func <- function(a=3,b=4) {
  z <- a + b
  return(z)
}
my_func()

my_func_bad <-function(a=3) {
  z <- a + b
  return(z)
}
my_func_bad() # crashes because it can't find b
b <- 100
my_func_bad() # OK now because b exists as a global variable

# But it is fine to create variables locally
my_func_ok <- function(a=3) {
  bb <- 100
  z <- a + bb
  return(z)
}

my_func_ok() # no problems now
print(bb) # but this variable is still hidden from the global environment

## - - - - - - -



## Simple regression function
## - - - - - - -

##################################################
# FUNCTION: fitLinear 
# fits simple regression line
# inputs: numeric vector of predictor (x) and response (y)
# outputs: slope and p-value
#------------------------------------------------- 
fitLinear <- function(x=runif(20),y=runif(20)) {
  myMod <- lm(y~x) # fit the model
  myOut <- c(slope=summary(myMod)$coefficients[2,1],
             pValue=summary(myMod)$coefficients[2,4])
  plot(x=x,y=y) # quick and dirty plot to check output
  return(myOut)
}
##################################################
fitLinear()

## - - - - - - -



## Creating a more complex default value
## - - - - - - -

##################################################
# FUNCTION: fitLinear2       
# fits simple regression line
# inputs: numeric vector of predictor (x) and response (y)
# outputs: slope and p-value
#------------------------------------------------- 
fitLinear2 <- function(p=NULL) {
  if(is.null(p)) {
    p <- list(x=runif(20),y=runif(20))
  }
  myMod <- lm(p$y~p$x) # fit the model                    ## FIXED
  myOut <- c(slope=summary(myMod)$coefficients[2,1],
             pValue=summary(myMod)$coefficients[2,4])
  plot(x=p$x,y=p$y) # quick and dirty plot to check output
  return(myOut)
}

##################################################
fitLinear2()
myPars <-list(x=1:10,y=sort(runif(10)))             ## CHANGED
fitLinear2(myPars)

## - - - - - - -



## Using do.call To Pass A List Of Parameters To A Function
## - - - - - - -
z <- c(runif(99),NA)
mean(z) # oops, mean doesn't work if there is an NA
mean(x=z,na.rm=TRUE) # change the default value for na.rm
mean(x=z,na.rm=TRUE,trim=0.05) # check out the "trim" option in help
l <- list(x=z,na.rm=TRUE,trim=0.05) # bundle paramaters as a list
do.call(mean,l) # use the do.call function with the function name and the parameter list
## - - - - - - -
