
## BIOL6100 - Class 6
## Isabelle Smith
## Jan. 30, 2025

## - - - - - - -

## intro to R ii

## - - - - - - -



## Creating an empty vector and adding to it (avoid):
## - - - - - - -
# create an empty vector, specify mode & length
z <- vector(mode="numeric",length=0)  
print(z)

# now add elements to it

z <- c(z,5)
print(z)
# This "dynamic sizing" is very SLOW!
## - - - - - - -



## Better to create a vector of pre-defined length:
## - - - - - - -
# has 100 0s in a numeric vector
z <- rep(0,100) 
head(z)

# but would be better to start with NAs
z <- rep(NA,100)
head(z)

# but what is its type?
typeof(z)

# take advantage of coercion!
z[1] <- "Washington"
head(z)
typeof(z)
## - - - - - - -



## Efficiently creating a vector with many names
## - - - - - - -
my_vector <- runif(100)
tail(my_vector)         ## added
my_names <- paste("Species",seq(1:length(my_vector)),sep="")
head(my_names)         ## added
names(my_vector) <- my_names
head(my_vector)
str(my_vector)
## - - - - - - -



## Using rep to repeat elements and create vectors
## - - - - - - -
# rep for repeating elements
rep(0.5,6) # give the element (or vector!) and number of times to repeat
rep(x=0.5,times=6) # using the argument names is always prudent
rep(times=6,x=0.5) # with argument names, order is not important
my_vec <- c(1,2,3)
rep(x=my_vec,times=2) # applies to entire vectors
rep(x=my_vec,each=2) # repeat each element individually
rep(x=my_vec,times=my_vec) # what does this do?
rep(x=my_vec,each=my_vec) # and this?
## - - - - - - -



## Using seq to create regular sequences
## - - - - - - -
seq(from=2, to=4) # set limits for integer sequences
2:4 # very common short cut with no explicit function wrappers
`:`(2,4)      ## added
seq(from=2,to=4,by=0.5) # use a by function can generate real numbers
seq(from=2,to=4,by=0.67)       ## added
x <- seq(from=2, to=4,length=7) # sometimes easier to just specify the length
print(x)       ## added
my_vec <- 1:length(x) # commonly used, but actually slow
print(my_vec)
seq_along(my_vec) # much faster for models and big data!
seq_len(5) # this is also faster than 1:5
## - - - - - - -



## Using rnorm and runif to create vectors of random numbers
## - - - - - - -
runif(5) # 5 random uniform values betweeon 0 and 1
runif(n=3,min=100, max=101) # 3 random uniform values between 100 and 101

rnorm(6) # 6 random normal values with mean 0 and standard deviation 1
rnorm(n=5, mean=100, sd=30) # 5 random normal values with mean 100 and sd 30

## Explore distributions by sampling and plotting
library(ggplot2) # do this at the very start
z <- runif(1000) #default uniform (0,1)
qplot(x=z)
z <- rnorm(1000) #default normal (0,1)
qplot(x=z)
## - - - - - - -



## Using sample to draw random values from an existing vector
## - - - - - - -
long_vec <- seq_len(10)
typeof(long_vec)
str(long_vec)

sample(x=long_vec) # with no other params, this reorders the vector
sample(x=long_vec, size=3) # specify a number (sampling without replacement)
sample(x=long_vec,size=16,replace=TRUE) # can generate duplicates
my_weights <- c(rep(20,5),rep(100,5)) # create a set of non-zero positive weights (integer or real)
print(my_weights)
sample(x=long_vec,replace=TRUE,prob=my_weights) # sampling with replacement and weights
sample(x=long_vec,replace=FALSE,prob=my_weights) # sampling without replacement and weights
sample(x=long_vec,replace=TRUE,prob=long_vec) # what does this do?
## - - - - - - -



## Techniques for subsetting atomic vectors
## - - - - - - -
z <- c(3.1, 9.2, 1.3, 0.4, 7.5)

# positive index values
z[c(2,3)]

# negative index values to exclude elements
z[-c(2,3)]

# create a vector of logical elements to select conditions

z[z<3]

# equivalent to the following
tester <- z<3
print(tester)
z[tester]

# also use which() function to find subscript indicators
which(z<3)

# this works, but is overkill; just use the boolean operator
z[which(z<3)]

# can also use length() for relative positioning to last element
z[-(length(z):(length(z)-2))]


