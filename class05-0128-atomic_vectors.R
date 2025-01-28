
## BIOL6100 - Class 5
## Isabelle Smith
## Jan. 28, 2025

## - - - - - - -

## intro to R

## - - - - - - -



# Using the assignment operator
x <- 5 # preferred
y = 4 # legal but not used except in function defaults
y = y + 1.1
print(y)
y <- y + 1.1
print(y)





## Variable names
z <- 3 # Begin with lower case letter 
plantHeight <- 10 # option "camelCaseFormatting"
plant.height <- 4.2 # avoid periods
plant_height <- 3.3  # optimal "snake_case_formatting"
. <- 5.5 # reserve this for a generic temporary variable (more later)





## Four Data Types:

## dimensions         homogeneous       heterogeneous
## ----------         -----------       -------------
##    1               atomic vector     list
##    2               matrix            data frame
##   (n)              (array)





## Atomic Vectors
## - - - - - - - -
## character strings
## integers, doubles are “numeric”
## logical
## factor (unique to R)
## vector of lists!
## - - - - - - - -
# the combine function
z <- c(3.2, 5, 5, 6)      ## c = `combine` or `concatenate`
print(z)
typeof(z)
is.numeric(z)

# c() always "flattens" to an atomic vector
z <- c(c(3,4),c(5,6)) 
print(z)

# character strings with single or double quotes
z <- c("perch","bass",'trout') 
print(z)

# use both with an internal quote
z <- c("This is only 'one' character string", 'a second')
print(z)
typeof(z)
is.character(z)

# building logicals
# Boolean, not with quotes, all caps
z <- c(TRUE,TRUE,FALSE) 
# avoid abbreviations T, F which will work
print(z)
typeof(z)
is.logical(z)
is.integer(z)





## Three Properties of a Vector
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##    1. TYPE
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
z <- c(1.1, 1.2, 3, 4.4)
typeof(z) # gives type
is.numeric(z) # is. gives logical
Z <- as.character(z) # as. coerces variable     ## added `z <-`
print(z)
typeof(z)
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##    2. LENGTH
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
length(z) # gives number of elements
length(y) # throws error if variable does not exist
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##    3. NAME
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
z <- runif(5)
print(z)      ## added
# optional attribute not initially assigned
names(z) 
print(z)
# add names later after variable is created
names(z) <- c("chow","pug","beagle","greyhound","akita")
print(z)
print(z[2])           ## added
print(z['pug'])       ## added
# add names when variable is built (with or without quotes)
z2 <- c(gold=3.3, silver=10, lead=2)
print(z2)
# reset names
names(z2) <- NULL
# names can be added for only a few elements
# names do not have to be distinct, but often are
names(z2) <- c("copper","zinc")
print(z2)
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##            NOTE: special TYPES
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# NA values for missing data
z <- c(3.2,3.3,NA) # NA is a missing value
typeof(z)
length(z)
typeof(z[3]) # what is the type of third element

z1 <- NA
typeof(z1) #different NA types

print(z)      ## added
is.na(z) # logical operator to find missing values
mean(z) # won't work because of NA
is.na(z)# evaluate to find missing values
!is.na(z) # use ! for NOT missing values
mean(!is.na(z)) # wrong answer based on TRUE FALSE!!
mean(z[!is.na(z)]) # correct use of indexing

# NaN, -Inf, and Inf from numeric division
z <-  0/0   # NaN
typeof(z)
print(z)
z <- 1/0   # Inf
print(z)
z <- -1/0  # - Inf
print(z)

# NULL is an object that is nothing!
# a reserved word in R
z <- NULL
typeof(z)
length(z)
is.null(z) # only operation that works on a null
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




## Three Features of a Vector

## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##    1. COERCION
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# All atomics are of the same type
# if they are different, R coerces them
# logical -> integer -> double -> character

a <- c(2, 2.0)
print(a)
typeof(a) # technically integer coerced to numeric

b <- c("purple","green")
typeof(b)

d <- c(a,b)
print(d)
typeof(d)

# "Mistakes" in numeric variables convert to strings
# Very useful when working with logical variables

a <- runif(10)
print(a)

# Comparison operators yield a logical result
a > 0.5

# do math on a logical and it coerces to an integer!

# How many elements are greater than 0.5?
sum(a > 0.5)

# What proportion of the vector elements are greater than 0.5?

mean(a > 0.5)

# Break down the result
. <- a > 0.5
print(.)
. <- as.integer(.)
print(.)
print(sum(.))
print(mean(.))

#Qualifying exam question! Approximately what proportion of observations drawn from a normal (0,1) distribution are larger than 2.0?

mean(rnorm(1000) > 2)

## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##    2. VECTORIZATION
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# adding a constant to a vector
z <- c(10,20,30)
z + 1

# what happens when vectors are added?

y <- c(1,2,3)
z + y

# results is an "element by element" operation on the vector
# most vector operations can be done this way

z^2

## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##    3. RECYCLING
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# but what if vector lengths are not equal?
z <- c(10,20,30)
x <- c(1,2)
z + x

# warning is issued by calculation is still made
# shorter vector is always "recycled"
# works with scalars (= vector of length(1))



## added for clarification
tens <- seq(0,100,10)
two <- c(1,2)
tens+two
