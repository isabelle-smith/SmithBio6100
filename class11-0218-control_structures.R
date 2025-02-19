
## BIOL6100 - Class 11
## Isabelle Smith
## Feb. 18, 2025

## - - - - - - -

## intro to R x

## - - - - - - -


## If statements
## . . . . . . .


#if (condition) {expression1}

#if (condition) {expression1} else {expression2}

#if (condition1) {expression1} else
  #if (condition2) {expression2} else


z <- signif(runif(1),digits=2)
print(z)
z > 0.5
if (z > 0.5) {cat(z, "is a bigger than average number","\n")}   ## added {}

if (z > 0.8) {cat(z,"is a large number","\n")} else             ## added {}
  if (z < 0.2) {cat(z,"is a small number","\n")} else           ## added {}
  {cat(z,"is a number of typical size","\n")
    cat("z^2 =",z^2,"\n")}


# if statement requires a single logical value. With a vector,
# it will assign TRUE/FALSE based on very first element only.

z <- 1:10

# this does not do anything
##if (z > 7) print(z)                 ## did not used to throw an error

# probably not what you want 
##if (z < 7) print(z)                 ## did not used to throw an error

# use subsetting!
print(z[z < 7])


## - - - - - - -





## ifelse to fill vectors
## - - - - - - -


##   `ifelse(test,yes,no)`

##  -   test is an object that can be coerced to a logical yes/no
##  -   yes return values for true elements of test
##  -   no return vales for false elements of test


## Suppose we have an insect population in which each female lays, on average, 10.2 eggs,
## following a Poisson distribution with λ=10.2. However, there is a 35% chance of parasitism,
## in which case no eggs are laid. Here is the distribution of eggs laid for 1000 individuals:

tester <- runif(1000) # start with random uniform elements
eggs <- ifelse(tester>0.35,rpois(n=1000,lambda=10.2),0)
hist(eggs)


## Suppose we have a vector of p values (say from a simulation), and we want 
## to create a vector to highlight the significant ones for plotting purposes.

pVals <- runif(1000)
z <- ifelse(pVals<=0.025,"lowerTail","nonSig")
z[pVals>=0.975] <- "upperTail"
table(z)

### ~ ~ ~ ~ ~ ~ ~
vals <- rnorm(1000)
d <-ifelse(abs(vals)<3, "3sd","more")
d[abs(vals)<2] <- "2sd"
d[abs(vals)<1] <- "1sd"
table(d)
### ~ ~ ~ ~ ~ ~ ~

## Here is how I would probably do this

z1 <- rep("nonSig",1000)
z1[pVals<=0.025] <- "lowerTail"
z1[pVals>=0.975] <- "upperTail"
table(z1)

## - - - - - - -
