library(dplyr)
library(readr)
library(tidyverse)

prison_pop <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-pop.csv?raw=true", stringsAsFactors = FALSE)
View(prison_pop)

rows_of_data <- nrow(prison_pop)
rows_of_data

cols_of_data <- ncol(prison_pop)
cols_of_data


# Focus on data from only in 2018 
pop_in_2018 <- prison_pop %>% filter(year == "2018") %>% group_by(urbanicity)
View(pop_in_2018)

# Number of prison reports that came from rural, small/mid, suburban, and urban areas
sum_rural <- pop_in_2018 %>% filter(urbanicity == "rural") %>% summarise(n())
sum_rural

sum_small_mid <- pop_in_2018 %>% filter(urbanicity == "small/mid") %>% summarise(n())
sum_small_mid

sum_suburban <- pop_in_2018 %>% filter(urbanicity == "suburban") %>% summarise(n())
sum_suburban

sum_urban <- pop_in_2018 %>% filter(urbanicity == "urban") %>% summarise(n())
sum_urban


# Focus on data from only in 2000 in WA
pop_in_2000_wa <- prison_pop %>% filter(state == "WA") %>% filter(year == "2000")


# Highest prison pop in WA
wa_highest_prison_pop <- pop_in_2000_wa %>% filter(total_prison_pop == max(total_prison_pop, na.rm = TRUE))  %>% pull(total_prison_pop) 
wa_highest_prison_pop

# County in WA that has the highest prison population in 2000 
county_wa_highest_prison_pop <- pop_in_2000_wa %>% filter(total_prison_pop == max(total_prison_pop, na.rm = TRUE)) %>% pull(county_name)
county_wa_highest_prison_pop

# Focus on data from only in 2000 in all
pop_in_2000 <- prison_pop %>% filter(year == "2000")

highest_prison_pop <- pop_in_2000 %>% filter(total_prison_pop == max(total_prison_pop, na.rm = TRUE))  %>% pull(total_prison_pop) 
highest_prison_pop

# County in the US that has the highest prison population in 2000
county_highest_prison_pop <- pop_in_2000 %>% filter(total_prison_pop == max(total_prison_pop, na.rm = TRUE)) %>% pull(county_name)
county_highest_prison_pop

