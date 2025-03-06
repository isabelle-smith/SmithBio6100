
## BIOL6100 - Class 15
## Isabelle Smith
## Mar. 06, 2025

## - - - - - - -

## prob. theor.

## - - - - - - -



## Build a plotting function
## - - - - - - -

############################
# Function: my_histo
# Purpose: creates a ggplot histogram
# Requires: ggplot
# Input: a numeric vector
# Output: a ggplot histogram

############################
# Function: my_histo
# Purpose: creates a ggplot histogram
# Requires: ggplot
# Input: a numeric vector
# Output: a ggplot histogram
library(ggplot2)
my_histo <- function(x=NULL) {
  if(is.null(x)) df=data.frame(x=runif(1000)) else df<-data.frame(x=x)
  p1 <- ggplot(data=df) +
    aes(x=x) +
    geom_histogram(color="black",fill="goldenrod")
  print(p1)   
  
}
my_histo()

## - - - - - - -





## Poisson distribution
## - - - - - - -

library(MASS)
#-------------------------------------------------
# Poisson distribution
# Discrete X >= 0
# Random events with a constant rate lambda
# (observations per time or per unit area)
# Parameter lambda > 0


## NOTE: "zero-inflated poisson"
## has an additional process
## generating zeroes (see ifelse())


## ALSO: "zero-censored poisson"
## occurs when zeros are not recorded


# "d" function generates probability density
hits <- 0:10
myVec <- dpois(x=hits,lambda=1)
my_histo(myVec)                   ## BAD (for discrete)
plot(myVec, type="b")             ## `b` for both


myVec <- dpois(x=hits,lambda=2)
plot(myVec, type="b")


hits <- 0:50
myVec <- dpois(x=hits,lambda=20)
plot(myVec, type="b")


hits <- 0:15
myVec <- dpois(x=hits,lambda=2.3)
plot(myVec, type="b")


sum(myVec)  # sum of density function = 1.0 (total area under curve)
head(myVec)


# for a Poisson distribution with lambda=2, 
# what is the probability that a single draw will yield X=0?

dpois(x=0,lambda=2)


# "p" function generates cumulative probability density; gives the 
# "lower tail" cumulative area of the distribution

hits <- 0:10
myVec <- ppois(q=hits,lambda=2)
plot(myVec, type="b")


# for a Poisson distribution with lambda=2, 
# what is the probability of getting 1 or fewer hits?

ppois(q=1, lambda=2)


# We could also get this through dpois
p_0 <- dpois(x=0,lambda=2)
p_0
p_1 <- dpois(x=1,lambda=2)
p_1
p_0 + p_1


# The q function is the inverse of p
# What is the number of hits corresponding to 50% of the probability mass
qpois(p=0.5,lambda=2.5)                         ## discrete -> not exact
ppois(q=2,lambda=2.5)


           ## randomly generated:
ranPois <- rpois(n=1000,lambda=2.5)
my_histo(ranPois)


# for real or simulated data, we can use the quantile
# function to find the empirical  95% confidence interval on the data

quantile(x=ranPois,probs=c(0.025,0.975))

## - - - - - - -





## Binomial distribution
## - - - - - - -

#-------------------------------------------------
# Binomial distribution
# p = probability of a dichotomous outcome
# size = number of trials
# x = possible outcomes
# outcome x is bounded between 0 and number of trials

# use "d" binom for density function
hits <- 0:10
myVec <- dbinom(x=hits,size=10,prob=0.5)
plot(myVec, type="b")


myCoins <- rbinom(n=50,size=100,prob=0.5)
my_histo(myCoins)


myCoins <- rbinom(n=500,size=100,prob=0.5)
my_histo(myCoins)
quantile(x=myCoins,probs=c(0.025,0.975))

## - - - - - - -





## Negative Binomial distribution
## - - - - - - -

#-------------------------------------------------
# negative binomial: number of failures (values of MyVec)
# in a series of (Bernouli) with p=probability of success 
# before a target number of successes (= size)
# generates a discrete distribution that is more 
# heterogeneous ("overdispersed") than Poisson


hits <- 0:40
myVec <- dnbinom(x=hits, size=5, prob=0.5)
plot(myVec, type="b")


# geometric series is a special case where N= 1 success
# each bar is a constant fraction 1 - "prob" of the bar before it
myVec <- dnbinom(x=hits, size=1, prob=0.1)
plot(myVec, type="b")


## ...

