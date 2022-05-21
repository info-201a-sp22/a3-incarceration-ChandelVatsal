library(dplyr)
library(ggplot2)
library(plotly)
library("tidyverse")




url_to_read <- paste0(
  "https://github.com/melaniewalsh/Neat-Datasets",
  "/blob/main/us-prison-pop.csv?raw=true"
)

prison_pop <- read.csv(url_to_read, stringsAsFactors = FALSE)


prision_pop_wa <- prison_pop %>%
  filter((county_name == "King County") & (state == "WA")) %>%
  filter(year >= "2000" & year <= "2016") %>%
  select(year, female_prison_pop, male_prison_pop) %>%
  rename("Male" = male_prison_pop) %>%
  rename("Female" = female_prison_pop)




chart2 <- ggplot(prision_pop_wa, aes(year, colour = Gender)) +
  geom_line(aes(y = Female, color = "Female")) +
  geom_line(aes(y = Male, color = "Male")) +
  labs(title = paste("The Difference in Males and Females",
    "in Prison in King County over 2000 to 2016",
    y = "Count", x = "Year"
  ))

ggplotly(chart2)
