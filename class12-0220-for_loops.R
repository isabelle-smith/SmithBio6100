
## BIOL6100 - Class 12
## Isabelle Smith
## Feb. 20, 2025

## - - - - - - -

## medium R ii

## - - - - - - -

## ADDED
## - - - - - - -

16/5
16%/%5
16%%5

## - - - - - - -



## Tip #5: Use next to skip certain elements in the loop
## - - - - - - -

z <- 1:20
# What if we want to work with only the odd-numbered elements?

for (i in seq_along(z)) {
  if(i %% 2==0) next
  print(i)
}

## - - - - - - -
