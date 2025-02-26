
## BIOL6100 - Class 14
## Isabelle Smith
## Feb. 26, 2025

## switched w/ Lab 07

## - - - - - - -

## medium R v

## - - - - - - -



## The core ‘verbs’
## - - - - - - -
## *  filter()
## *  arrange()
## *  select()
## *  summarize() and group_by()
## *  mutate()
## - - - - - - -


## Start with a built-in dataset
## - - - - - - -
library(tidyverse)

#you might need to specify which package you're using if it's masked by another package
dyplyr::filter()

data(starwars)
class(starwars)

#this dataset is a tibble: in general, tibbles do "less" as a tradeoff to make code simpler and less prone to crashing

glimpse(starwars)
head(starwars) #also an alternative
## - - - - - - -



#Cleaning up our dataset
## - - - - - - -
#base R has the complete.cases function-this will remove rows with NA's
starwarsClean<-starwars[complete.cases(starwars[,1:10]),]

#you can check for NAs
is.na(starwarsClean[,1])

anyNA(starwarsClean[,1:10])

#filter() funtion-this will pick/subset observations by their values
# * uses >, >=, <, <=, ==, !
# * logical operators like & and |
# * filter automatically excludes NAs,  have to ask for them specifically

filter(starwarsClean, gender=="masculine" & height < 180)

filter(starwars, gender=="masculine", height < 180, height > 100)

filter(starwars, eye_color %in% c("blue", "brown")) #we can %in% for a few different conditions, similar to ==
## - - - - - - -



## arrange() - reorder rows
## - - - - - - -
arrange(starwarsClean, by=height) #defaults to ascending order

arrange(starwarsClean, by=desc(height)) #use desc to put it in descending order

arrange(starwarsClean, height, desc(mass)) #any additional columns will break ties in preceding column

starwars1<-arrange(starwars, height)
tail(starwars1)
## - - - - - - -



## select() - choose variables by their names
## - - - - - - -

#we can do this in base r
starwarsClean[1:10,]

select(starwarsClean, 1:10)
select(starwarsClean, name:homeworld)
select(starwarsClean, -(films:starships)) #you can subset everything except particular variables

#rearrange columns
select(starwarsClean, homeworld, name, gender, species, everything())
select(starwarsClean, contains("color")) #other helpers include: ends_with, starts_with, matches (reg ex), num_range

#rename columns
select(starwarsClean, haircolor=hair_color) #actual name of the column comes after stating the new name you want

rename(starwarsClean, haircolor=hair_color) #rename keeps all the variables
## - - - - - - -



## mutate() - create new variables with functions of existing variables
## - - - - - - -
#create a column that's height divided by mass
mutate(starwarsClean, ratio=height/mass)

starwars_lbs<-mutate(starwarsClean, mass_llbs=mass*2.2)

select(starwars_lbs, 1:3, mass_lbs, everything()) #using select allows us to bring it to the beginning

#if you only wanted the new variable, you can use the transmute function
transmute(starwarsClean, mass_llbs=mass*2.2)

transmute(starwarsClean, mass, mass_llbs=mass*2.2)
## - - - - - - -



## summarize() and group_by() - collapse many values down to a single summary
## - - - - - - -
summarize(starwarsClean, meanheight=mean(height)) #gives the summary stat for the entire tibble

summarize(starwars, meanheight=mean(height)) #does not work properly if your dataset isn't clean

summarize(starwars, meanheight=mean(height, na.rm=T), TotalNumber=n())

#use group_by for additional calculations
starwarsGender<-group_by(starwars, gender)
head(starwarsGender)

summarize(starwarsGender, meanheight=mean(height, na.rm=T), number=n())
## - - - - - - -



## pipe statements / piping
## - - - - - - -
## *  these are sequences of actions that will change your dataset
## *  it will let you pass an intermediate result onto the next function in sequence

## *  you should avoid doing this when you need to manipulate more than one object at a time,
##    or if there are meaningful intermediate objects

## *  formatting: should always have a space before it
##    and usually followed by a new line (usually automatic indent)

starwarsClean %>%
  group_by(gender) %>%
  summarize(meanHeight=mean(height, na.rm=T), number=n())
## - - - - - - -



## case_when() - is useful for multiple conditional ifelse statements
## - - - - - - -
starwarsClean %>%
  mutate(sp=case_when(species=="Human" ~ "Human", TRUE ~ "Non-human")) %>%
  select(name, sp, everything())
## - - - - - - -



## long to wide format and vice-versa
## - - - - - - -
glimpse(starwarsClean)

#make dataset wider
wideSW<-starwarsClean %>%
  select(name, sex, height) %>%
  pivot_wider(names_from=sex, values_from=height, values_fill=NA)
wideSW

pivotSW<-starwars %>%
  select(name, homeworld) %>%
  group_by(homeworld) %>%
  mutate(rn=row_number()) %>%
  ungroup() %>%
  pivot_wider(names_from=homeworld, values_from=name)
pivotSW

#make dataset longer
glimpse(wideSW)

wideSW %>%
  pivot_longer(cols=male:female, names_to="sex", values_to="height", values_drop_na=T)
## - - - - - - -

