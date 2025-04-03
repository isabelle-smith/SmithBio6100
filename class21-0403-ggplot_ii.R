
## BIOL6100 - Class 21
## Isabelle Smith
## Apr. 3, 2025

## - - - - - - -

## ggplot iv

## - - - - - - -



source("class20b-0401-ggplot_ii.R")





## . . . . . . .

m1 + facet_grid(class~fl, scales="free_y")


m1 + facet_grid(class~fl, scales="free")


m1 + facet_grid(.~class)


m1 + facet_grid(class~.)


# use facet wrap when variables are not crossed
m1 + facet_grid(.~class)
m1 +  facet_wrap(~class)


m1 + facet_wrap(~class + fl)


m1 + facet_wrap(~class + fl, drop=FALSE)
m1 + facet_grid(class~fl)


# use facet with other aesthetic mapping within rows or columns
m1 <- ggplot(data=mpg) +
  aes(x=displ,y=cty,color=drv) + 
  geom_point() 

m1 + facet_grid(.~class)


# easy to switch to other geoms
m1 <- ggplot(data=mpg) +
  aes(x=displ,y=cty,color=drv) + 
  geom_smooth(se=FALSE,method="lm") 

m1 + facet_grid(.~class)


# fitting with boxplots over a continuous variable
m1 <- ggplot(data=mpg) +  
  aes(x=displ,y=cty) + 
  geom_boxplot()

m1 + facet_grid(.~class)


# add a group and fill mapping for subgroups
m1 <- ggplot(data=mpg) + aes(x=displ,y=cty,group=drv,fill=drv) + 
  geom_boxplot()

m1 + facet_grid(.~class)


# standard plot with all data
p1 <- ggplot(data=d) + 
  aes(x=displ,y=hwy) +
  geom_point() + 
  geom_smooth()
print(p1)


# break out the drive types (note what group affects)
p1 <- ggplot(data=d) +
  aes(x=displ,y=hwy, group=drv) +
  geom_point() + 
  geom_smooth()
print(p1)


# break out the drive types (note what color affects)
p1 <- ggplot(data=d) +
  aes(x=displ,y=hwy, color=drv) +
  geom_point() + geom_smooth()
print(p1)


# break out the drive types (note what fill affects)
p1 <- ggplot(data=d) + 
  aes(x=displ,y=hwy, fill=drv) +
  geom_point() + geom_smooth()
print(p1)


# use both if you want points, lines, and confidence intervals colored
p1 <- ggplot(data=d) + 
  aes(x=displ,y=hwy, color=drv, fill=drv) +
  geom_point() + geom_smooth()
print(p1)


# now use aesthetic mappings within each geom to over-ride defaults
# subset the data frame to pull out what you need

p1 <- ggplot(data=d) + 
  aes(x=displ,y=hwy,col=drv) +
  geom_point(data=d[d$drv=="4",]) + geom_smooth()
print(p1)


# instead of subsetting, just map an aesthetic
p1 <- ggplot(data=d) + 
  aes(x=displ,y=hwy) +
  geom_point(aes(color=drv)) + geom_smooth()
print(p1)


# Conversely, map the smoother, but not the points
p1 <- ggplot(data=d) + 
  aes(x=displ,y=hwy) +
  geom_point() + geom_smooth(aes(color=drv))
print(p1)


# also, subset in the first layer to eliminate some data entirely
# instead of subsetting, just map an aesthetic
p1 <- ggplot(data=d[d$drv!="4",]) + 
  aes(x=displ,y=hwy) +
  geom_point(aes(color=drv)) + geom_smooth()
print(p1)

## - - - - - - -


