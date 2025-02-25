
## BIOL6100 - Class 13
## Isabelle Smith
## Feb. 25, 2025

## - - - - - - -

## medium R iv

## - - - - - - -



## FROM LAST TIME
## . . . . . . .

species_area_curve <- function(A=1:5000,c= 0.5,z=0.26){
  
  S <- c*(A^z)
  return(S)
}

species_area_plot <- function(A=1:5000,c= 0.5,z=0.26) {
  plot(x=A,y=species_area_curve(A,c,z),type="l",xlab="Island Area",ylab="S",ylim=c(0,2500))
  mtext(paste("c =", c,"  z =",z),cex=0.7) 
  #      return()
}

c_pars <- c(100,150,175)
z_pars <- c(0.10, 0.16, 0.26, 0.3)

par(mfrow=c(3,4))

for (i in seq_along(c_pars)) {
  for (j in seq_along(z_pars)) {
    species_area_plot(c=c_pars[i],z=z_pars[j])
  }
} 

par(mfrow=c(1,1))

## . . . . . . .





## Looping with while or repeat
## - - - - - - -

# looping with for

cut_point <- 0.1
z <- NA
ran_data <- runif(100)
for (i in seq_along(ran_data)) {
  z <- ran_data[i]                ## CHANGED
  if (z < cut_point) break
}
print(z)
print(i)                          ## ADDED

# looping with while

z <- NA
cycle_number <- 0
while (is.na(z) | z >= cut_point) {
  z <- runif(1)
  cycle_number <- cycle_number + 1
  
}
print(z)
print(cycle_number)

# looping with repeat             = SKIPPED

## - - - - - - -





## Using the expand.grid() function to create a dataframe with parameter combinations
## - - - - - - -

expand.grid(c_pars,z_pars)

df <- expand.grid(c_pars = c_pars, z_pars = z_pars)         ## ADDED
head(df)                                                    ## ADDED
str(df)                                                     ## ADDED


##################################################
# function: sa_output
# Summary stats for species-area power function
# input: vector of predicted species richness 
# output: list of max-min, coefficient of variation 
#------------------------------------------------- 
sa_output <- function(S=runif(10)) {                          ## CHANGED from `1:10`
  
  sum_stats <- list(s_gain=max(S)-min(S),s_cv=sd(S)/mean(S))  ## cv = coef. of var.
  
  return(sum_stats)
}
sa_output()


# Build program body with a single loop through 
# the parameters in modelFrame

# Global variables
area <- 1:5000
c_pars <- c(100,150,175)
z_pars <- c(0.10, 0.16, 0.26, 0.3)

# set up model frame
model_frame <- expand.grid(c=c_pars,z=z_pars)
model_frame$s_gain <- NA
model_frame$s_cv <- NA
print(model_frame)


# cycle through model calculations
for (i in 1:nrow(model_frame)) {
  
  # generate S vector
  temp1 <- species_area_curve(A=area,
                              c=model_frame[i,1],
                              z=model_frame[i,2])
  # calculate output stats
  temp2 <- sa_output(temp1)
  # pass results to columns in data frame
  model_frame[i,c(3,4)] <- temp2
  
}
print(model_frame)

## - - - - - - -



