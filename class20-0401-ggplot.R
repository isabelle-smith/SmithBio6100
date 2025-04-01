
## BIOL6100 - Class 20
## Isabelle Smith
## Apr. 1, 2025

## - - - - - - -

## ggplot ii

## - - - - - - -



source("class19b-0327-ggplot.R")





## Major theme modifications
## - - - - - - -

# use theme parameters to modify font and font size
p1 + theme_classic(base_size=40,base_family="serif")


# defaults: theme_grey, base_size=16,base_family="Helvetica")
# font families (Mac): Times, Ariel, Monaco, Courier, Helvetica, serif,sans


# code for adding additional fonts
library(extrafont)
# font_import()  # Imports all system fonts (run once)


# loadfonts(device = "win")  # For Windows
fonts() # will list loaded fonts


p1 + theme_classic(base_size=35,
                   base_family="Chiller") ## CHANGED from Chalkduster


# use coordinate_flip to invert entire plot
p2 <- ggplot(data=d) +
  aes(x=fl,fill=fl) +
  geom_bar()

print(p2)

p2 + coord_flip() + theme_grey(base_size=20,base_family="sans")

## - - - - - - -





##Minor theme modifications
## - - - - - - -

# use labs for different plot labels
p1 <- ggplot(data=d) +
  aes(x=displ,y=cty) + 
  geom_point() +
  labs(title="My graph title here",
       subtitle="An extended subtitle",
       x="Displacement",
       y="City Mileage",
       caption="Add a caption here") +
  theme_bw(base_size=25,base_family="Magneto") ## CHANGED from Monaco
#    xlim(0,4) + ylim(0,20)
print(p1)


# use attributes for point size shape, color
p1 <- ggplot(data=d) +
  aes(x=displ,y=cty) + 
  geom_point(size=4,
             shape=21,
             color="black",fill="cyan") +
  theme_bw(base_size=25,base_family="Modern No. 20") ## CHANGED from Monaco
print(p1)


# use x and/or y limits to clip data set
p1 <- ggplot(data=d) +
  aes(x=displ,y=cty) + 
  geom_point(size=4,
             shape=21,
             color="black",fill="cyan") +
  xlim(4,7) + 
  ylim(-10,40) +
  theme_bw(base_size=25,base_family="Monotype Corsiva") ## CHANGED from Monaco
print(p1)

## - - - - - - -


