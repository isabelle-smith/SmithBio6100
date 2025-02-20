
## BIOL6100 - Class 10
## Isabelle Smith
## Feb. 13, 2025

## - - - - - - -

## intro to R ix

## - - - - - - -

##Logical operators
## - - - - - - -

# Simple inequalities
5 > 3
5 < 3
5 >= 5
5 <= 5
5 == 3
5 != 3

# use & for AND
FALSE & FALSE
FALSE & TRUE
TRUE & TRUE
5 > 3 & 1!=2
1==2 & 1!=2

# use | for OR
FALSE | FALSE
FALSE | TRUE
TRUE | TRUE
1==2 | 1!=2

# works with vectors

1:5 > 3

a <- 1:10
b <- 10:1

a > 4 & b > 4

## ~SKIP~
# use "long form" to evaluate left to write until a the first true/false is evaluated
## ~R changed~

# xor for exclusive or testing of vectors
# works for (TRUE FALSE) but not (FALSE FALSE) or (TRUE TRUE)
xor(FALSE,FALSE)
xor(FALSE,TRUE)
xor(TRUE,TRUE)
a <- c(0,0,1)
b <- c(0,1,1)
xor(a,b)

# compare with a | b
# works for (TRUE FALSE) or (TRUE TRUE)
a | b

## - - - - - - -



## Set Operations
## - - - - - - -

# boolean algebra on sets of atomic vectors (logical,numeric, character strings)

a <- 1:7
b <- 5:10

# union to get all elements
union(a,b)
c(a,b)                          ## ADDED (different)
unique(c(a,b))                  ## ADDED (same)

# intersect to get common elements
intersect(a,b)

# setdiff to get distinct elements in a
setdiff(a,b)

setdiff(b,a)

# setequal to check for identical elements
setequal(a,b)                                   ## FALSE

# more generally, to compare any two objects
z <- matrix(1:12,nrow=4,byrow=TRUE)
z1 <- matrix(1:12,nrow=4,byrow=FALSE)

# This just compares element by element
z==z1

# Use identical for entire structures
identical(z,z1)
z1 <- z
identical(z,z1)

# most useful for if statements is %in% or is.element
# these two are equivalent, but I prefer the %in% for readability
d <- 12
d %in% union(a,b)
is.element(d,union(a,b))

# check for partial matching with vector comparisons

d <- c(10,12)
d %in% union(a,b)
d %in% a

## - - - - - - -



##If statements
## - - - - - - -

if (condition) {expression1}

if (condition) {expression1} else {expression2}

if (condition1) {expression1} else
  if (condition2) {expression2} else

## - note that final unspecified else captures rest of the (unspecified) conditions
## - else statement must appear on the same line as the expression
## - typically enclose multiple statements in brackets {} for compound expression

