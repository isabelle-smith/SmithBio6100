
## BIOL6100 - Class 20 (part 2)
## Isabelle Smith
## Apr. 1, 2025

## - - - - - - -

## ggplot iii

## - - - - - - -



library(ggplot2)
library(ggthemes)
library(patchwork)


d <- mpg # use built in mpg data frame





##Plotting multiple panel graphs with patchwork
## - - - - - - -

g1 <- ggplot(data=d) +
  aes(x=displ,y=cty) + 
  geom_point() + 
  geom_smooth()
print(g1)


g2 <- ggplot(data=d) +
  aes(x=fl) +
  geom_bar(fill="tomato",color="black")+ 
  theme(legend.position="none")
print(g2)


g3 <- ggplot(data=d) +
  aes(x=displ) + 
  geom_histogram(fill="royalblue",
                 color="black")
print(g3)


g4 <- ggplot(data=d) +
  aes(x=fl,y=cty,fill=fl) + 
  geom_boxplot() + 
  theme(legend.position="none")

print(g4)


# place two plots horizontally
g1 + g2


# place 3 plots vertically
g1 + g2 + g3 + plot_layout(ncol=1)


# change relative area of each plot
g1 + g2 + plot_layout(ncol=1,heights=c(2,1))


g1 + g2 + plot_layout(ncol=2,widths=c(1,2))


# add a spacer plot 
g1 + plot_spacer() + g2


# use nested layouts
g1 + {
  g2 + {
    g3 +
      g4 +
      plot_layout(ncol=1)
  }
} +
  plot_layout(ncol=1)


# - operator for subtrack placement
g1 + g2 - g3 + plot_layout(ncol=1)


# / and | for intuitive layouts
(g1 | g2 | g3)/g4


# Add title, etc. to a patchwork
g1 + g2 + plot_annotation('This is a title', 
                          caption = 'made with patchwork')


# Change styling of patchwork elements
g1 + g2 +
  plot_annotation(
    title = 'This is a title',
    caption = 'made with patchwork',
    theme = theme(plot.title = element_text(size = 16))
  )


# Add tags to plots
g1 / (g2 | g3) +
  plot_annotation(tag_levels = 'A')

## - - - - - - -





## Swapping axis orientation for multipanel plot
## - - - - - - -

g3a <- g3 + scale_x_reverse()
g3b <- g3 + scale_y_reverse() 
g3c <- g3 + scale_x_reverse() + scale_y_reverse()

(g3 | g3a)/(g3b | g3c)


(g3 + coord_flip() | g3a + coord_flip())/(g3b + coord_flip() | g3c + coord_flip())


# ggsave(filename="MyPlot.pdf",
#        plot=g3,
#        device="pdf",
#        width=20,
#        height=20,
#        units="cm",
#        dpi=300)

## - - - - - - -





## Basic mapping of aesthetic variables
## - - - - - - -

# mapping of a discrete variable to point color
m1 <- ggplot(data=mpg) + 
  aes(x=displ,y=cty,color=class) +
  geom_point(size=3) 
print(m1)


# mapping of a discrete variable to point shape (<= 6)
m1 <- ggplot(data=mpg) + 
  aes(x=displ,y=cty,shape=class) + 
  geom_point(size=3) 
print(m1)


# mapping of a discrete variable to point size (not advised)
m1 <- ggplot(data=mpg) +
  aes(x=displ,y=cty,size=class) + 
  geom_point() 
print(m1)


# mapping a continuous variable to point size 
m1 <- ggplot(data=mpg) + 
  aes(x=displ,y=cty,size=hwy) + 
  geom_point() 
print(m1)


## ~ ~ ~ ~ ~ ~ ~
ggplot(data=mpg) + 
  aes(x=hwy,y=cty,size=cyl) + 
  geom_point()
## ~ ~ ~ ~ ~ ~ ~


# mapping a continuous variable to point color
m1 <- ggplot(data=mpg) + 
  aes(x=displ,y=cty,color=hwy) + 
  geom_point(size=5) 
print(m1)


# mapping two variables to different aesthetics
m1 <- ggplot(data=mpg) + aes(x=displ,y=cty,shape=class,color=hwy) + 
  geom_point(size=5) 
print(m1)


## ~ ~ ~ ~ ~ ~ ~
ggplot(data=mpg) + 
  aes(x=hwy,y=cty,size=cyl, color=fl) + 
  geom_point()
## ~ ~ ~ ~ ~ ~ ~


# use shape for smaller number of categories
m1 <- ggplot(data=mpg) + aes(x=displ,y=cty,shape=drv,color=fl) +  
  geom_point(size=5)  
# use all 3 (size, shape, color) to indicate 5 attributes!
m1 <- ggplot(data=mpg) +
  aes(x=displ,
      y=cty,
      shape=drv,
      color=fl,
      size=hwy) + 
  geom_point()
print(m1)


## ~ ~ ~ ~ ~ ~ ~
ggplot(data=mpg) + 
  aes(x=hwy,y=cty,shape=as.factor(cyl), color=fl) + 
  geom_point(size=3)
## ~ ~ ~ ~ ~ ~ ~


# mapping a variable to the same aesthetic in two different geoms
m1 <- ggplot(data=mpg) + 
  aes(x=displ,y=cty,color=drv) + 
  geom_point(size=2) +
  geom_smooth(method="lm")
print(m1)

## - - - - - - -





## Faceting variables for more effective groupings
# - - - - - - -

# basic faceting with variables split by row, column, or both
m1 <- ggplot(data=mpg) + 
  aes(x=displ,y=cty) + 
  geom_point() 

m1 +  facet_grid(class~fl)

## . . . . . . .

