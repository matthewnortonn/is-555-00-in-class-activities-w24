library(tidyverse)

# Because `starwars` is a "hidden" dataset in memory for demonstration, it won't show up in our environment at 
# first, and it'll also be hard to reset it if we make a mistake. So assign it to `df` to make sure you can work
# with it.
df <- starwars

# glimpse turns a data frame on its side. Super useful.
df %>%
  glimpse()
  

# iteratively add operations: 
# height > 100, sex == female, 
# choose name, height, mass, species, films, 
# mass > 50, 
# arrange by mass
# note: filtering on some logical excludes NAs

#df %>% 
#  filter(height > 100) %>% 
#  filter(sex == 'female')

#the above and below are two ways to do this

df %>% 
  filter(height >100,
         sex == 'female') %>% 
  select(name, height, mass, species, films) %>% 
  filter(mass > 50) %>% 
  arrange(desc(mass))


# calculate a new column,weight_lbs = mass * 2.204623
# Make sure it gets saved to the tibble...
df <- df %>% 
  mutate(weight_lbs = mass * 2.204623)

# group and summarize. Pay attention to NAs
# get a count and mean mass by species
df %>% glimpse()

df %>% 
  group_by(species) %>% 
  summarize(species_count = n(),
            avg_mass = mean(mass, na.rm = TRUE))
  

#n() inside of a sumarize will give a count or number count of what you're looking for

# Lots of NAs for average... why? Even for large groups it's NA...


# Humans definitely have SOME mass data...


# so let's exclude NAs from the mean aggregation:



# why does Chagrian have a weird NaN?


# top 5 tallest overall - using slice_head
df %>% 
  arrange(desc(height)) %>% 
  slice_head(n=5)

df %>% 
  arrange(mass) %>% 
  slice_head(n=3)

df %>% 
  slice_min(mass, n=5)

df %>% 
  slice_sample(prop = .1) #this gives a proportion so .1 will give 10% of the total rows

df %>% 
  slice_max(mass, n=5) #requires to think about ties, 

df %>% 
  slice_min(skin_color, n=1, with_ties = F) #go study what ties are

df %>% 
  group_by(species) %>% 
  slice_min(mass, n = 1, with_ties = F) %>% 
  group_by(sex) %>% 
  summarize(avg_height = mean(height, na.rm = T))  #double grouping is usually when you want only a few from each group or create some kind of average



# or just using slice_max


# what is the shortest character for each species? 




# ALso summarize isn't always the goal what if we want a relative 
# comparison of height for each species? I.e., are you tall for a human?
# calculate tallest for each species without summarizing, convert to percentile, show a few of the columns, sort





# Grouping by multiple
# Was is the average birth year for each gender from each homeworld







