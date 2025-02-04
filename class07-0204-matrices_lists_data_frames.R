
## BIOL6100 - Class 7
## Isabelle Smith
## Feb. 04, 2025

## - - - - - - -

## intro to R iv

## - - - - - - -



## Matrices
## - - - - - - -
my_vec <- 1:12

m <- matrix(data=my_vec,nrow=4)
print(m)

m <- matrix(data=my_vec,ncol=3)
print(m)

m <- matrix(data=my_vec,ncol=3,byrow=TRUE)
print(m)
## - - - - - - -



## Lists
## - - - - - - -
# Lists are atomic vectors but each element 
# can hold things of different types and different sizes

my_list <- list(1:10,
                matrix(1:8,nrow=4,byrow=TRUE),
                letters[1:3],
                pi)             ## formatted
str(my_list)
print(my_list)


# using [] gives you a single item, which is of type list
my_list[4]
my_list[4] - 3 # no, can't subtract a number from a list!


# single brackets gives you only the element in that slot, which is always of type list

# to grab the object itself, use [[]]
my_list[[4]]
my_list[[4]] - 3 # now we have the contents

# if a list has 10 elements it is like a train with 10 cars
# [[5]] gives you the contents of car #5
##[c(4,5,6)] gives you a little train with cars 4, 5, and 6

# once the double bracket is called, you can access individual elements as before

my_list[[2]]
my_list[[2]][4,1]

# name list items when they are created

my_list2 <- list(tester=FALSE,little_m=matrix(1:9,nrow=3))

# named elements can be accessed with dollar sign

my_list2$little_m[2,3] # get row 2, column3
my_list2$little_m # show whole matrix
my_list2$little_m[2,] # show second row, all columns
my_list2$little_m[2] # what does this give you?

# The "unlist" strings everything back into
# a single atomic vector; coercion is used if there are mixed data types
unrolled <- unlist(my_list2)
print(unrolled)


# The most common use of list: output from a linear model is a list

library(ggplot2)
y_var <- runif(10)
x_var <- runif(10)
my_model <- lm(y_var~x_var)
qplot(x=x_var,y=y_var)

# look at output in myModel
print(my_model)

# full results are in summary
print(summary(my_model))

# drill down into summary to get what we want
str(summary(my_model))
summary(my_model)$coefficients
summary(my_model)$coefficients["x_var","Pr(>|t|)"]
summary(my_model)$coefficients[2,4]

# use unlist instead

u <- unlist(summary(my_model))
print(u)

my_slope <- u$coefficients2
my_pval <- u$coefficients8
## - - - - - - -



## Data Frames
## - - - - - - -
# a data frame is a list of equal-lengthed vectors, each of which is a column

var_a <- 1:12
var_b <- rep(c("Con","LowN","HighN"),each=4)
var_c <- runif(12)
d_frame <- data.frame(var_a,var_b,var_c)
print(d_frame)
str(d_frame)


