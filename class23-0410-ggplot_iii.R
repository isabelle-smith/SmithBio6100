

## BIOL6100 - Class 23
## Isabelle Smith
## Apr. 10, 2025

## - - - - - - -

## ggplot v

## - - - - - - -



source("class22-0408-ggplot_iii.R")





## . . . . . . .

# tree map for hierarchical frequency data
# in contrast to mosaic, this can accomodate missing data

# simple one dimensional example (from mpg)

d <- as.data.frame(table(Fuel=mpg$fl,Drive=mpg$drv))
d$Fuel <- rep(c("Compressed Gas",
                "Diesel",
                "Ethanol",
                "Premium",
                "Regular"),3)
d$Drive <- rep(c("Four Wheel",
                 "Front Wheel",
                 "Rear Wheel"),each=5)
treemap(dtf=d,
        index="Fuel",
        vSize="Freq",
        type="index")


# now 2d with subgroups

treemap(dtf=d,
        index=c("Fuel","Drive"),
        vSize="Freq",
        type="index")


treemap(dtf=d,
        index=c("Drive","Fuel"),
        vSize="Freq",
        type="index")

## - - - - - - -



