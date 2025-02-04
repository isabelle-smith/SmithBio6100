
## BIOL6100 - Class 7
## Isabelle Smith
## Feb. 04, 2025

## - - - - - - -

## intro to R iii

## - - - - - - -



## CONT: Techniques for subsetting atomic vectors
## . . . . . . .

z <- c(3.1, 9.2, 1.3, 0.4, 7.5) ## added

# also can subset using named vector elements
names(z) <- letters[1:5]
z[c("b","c")]
## - - - - - - -



## Relational operators in R
## - - - - - - -
# <   less than
# >   greater than
# <=  less than or equal to
# >=  greater than or equal to
# ==  equal to
## - - - - - - -



## Logical operators
## - - - - - - -
# ! not
# & and (vector)
# | or (vector)
# xor(x,y)
# && and (only for first element)
# || or (only for first element)
## - - - - - - -



## EXAMPLES
## - - - - - - -
x <- 1:5
y <- c(1:3,7,7)
x == 2
x != 2
x == 1 & y == 7
x == 1 | y == 7
x == 3 | y == 3
xor(x==3, y==3)
# common errors with logicals
# = versus ==
z2 <- 5
z2 == 4 | 6  # gives wrong answer
z2 == 4 | z2 == 6
z2 == (4 | 6)       ## added by me
## - - - - - - -



## Subscripting with missing values
## - - - - - - -
set.seed(90)
z <- runif(10) # simple integer sequence
print(z)

z < 0.5 # create logical vector
z[z < 0.5] # use as index call
which(z < 0.5) # use to get indices for logical
z[which(z < 0.5)] # does same as above

zD <- c(z,NA,NA) # contaminate it
zD[zD < 0.5] # NA values carried along!
zD[which(zD < 0.5)] # NA values dropped
## - - - - - - -

