
## BIOL6100 - Class 11
## Isabelle Smith
## Feb. 18, 2025

## - - - - - - -

## medium R i

## - - - - - - -



## for loops
## - - - - - - -

##  The workhorse function for doing repetitive tasks
##  Universal in all computer languages
##  Controversial in R
##      often not necessary (use vectorized operations!)
##      very slow with binding operations (c,rbind,cbind,list)
##      many operations can be handled by special family of apply functions

## - - - - - - -





## Anatomy of a for loop
## - - - - - - -

##  for (var in seq) { # start of for loop
##   
##    # body of for loop 
##  
##  } # end of for loop

## (1)  var is a counter variable that will hold the current value of the loop
## (2)  seq is an integer vector (or a vector of character strings) that defines
##      the starting and ending values of the loop

## It is traditional in the statistics literature to use variables i,j,k to indicate counters. 

## You can also use t for time, but remember that `t()` is also an R function that transposes a matrix.
## R is smart enough to recognize the difference, but it could cause problems for others.

## There are many ways to indicate the sequence, and the length of our loops will almost always be
## related to the size of a vector that we are working with.

## We will only illustrate one way, because it is universal and applies to all for loops.

for (i in 1:5) {
  cat("stuck in a loop","\n")
  cat(3 + 2,"\n")
  cat(runif(1),"\n")
}


print(i)


my_dogs <- c("chow","akita","malamute","husky","samoyed")
for (i in 1:length(my_dogs)){
  cat("i =",i,"my_dogs[i] =" ,my_dogs[i],"\n")
}


my_bad_dogs <- NULL
for (i in 1:length(my_bad_dogs)){
  cat("i =",i,"my_bad_dogs[i] =" ,my_bad_dogs[i],"\n")
}


## So, a safer way is to use seq_along function:

for (i in seq_along(my_dogs)){
  cat("i =",i,"my_dogs[i] =" ,my_dogs[i],"\n")
}

## But notice now what happens when the vector is empty:

for (i in seq_along(my_bad_dogs)){
  cat("i =",i,"my_bad_dogs[i] =" ,my_bad_dogs[i],"\n")
} # This time we correctly skip my_bad_dogs and do not make the loop


## Alternatively, we may have a constant that we use to define the length of the vector:
  
zz <- 5
for (i in seq_len(zz)){
  cat("i =",i,"my_dogs[i] =" ,my_dogs[i],"\n")
}

## - - - - - - -





## Tip #1: Don’t do things in the loop if you do not need to!
## - - - - - - -

for (i in 1:length(my_dogs)){
  my_dogs[i] <- toupper(my_dogs[i])
  cat("i =",i,"my_dogs[i] =" ,my_dogs[i],"\n")
}

my_dogs <- tolower(my_dogs)

## - - - - - - -





## Tip #2: Do not change object dimensions (cbind,rbind,c,list) in the loop!
## - - - - - - -

my_dat <- runif(1)
for (i in 2:10) {
  temp <- runif(1) 
  my_dat <- c(my_dat,temp) # do not change vector size in the loop!
  cat("loop number =",i,"vector element =", my_dat[i],"\n")
}

length(my_dat)      ## CHANGED

## - - - - - - -





## Tip #3: Do not write a loop if you can vectorize an operation
## - - - - - - -

my_dat <- 1:10
for (i in seq_along(my_dat)) {
  my_dat[i] <-  my_dat[i] + my_dat[i]^2
  cat("loop number =",i,"vector element =", my_dat[i],"\n")
}

# No loop is needed here!
z <- 1:10
z <- z + z^2
print(z)

## - - - - - - -





## Tip #4: Always be alert to the distinction between the counter variable i and the vector element z[i]
## - - - - - - -

z <- c(10,2,4)
for (i in seq_along(z)) {           ## CHANGE `seq_along(z)` TO `1:length(z)`
  cat("i =",i,"z[i] = ",z[i],"\n")
}

print(i)

## - - - - - - -

