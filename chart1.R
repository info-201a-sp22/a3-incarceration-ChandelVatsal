library(dplyr)
library(ggplot2)
library(plotly)

url_to_read <- paste0(
  "https://github.com/melaniewalsh/Neat-Datasets",
  "/blob/main/us-prison-pop.csv?raw=true"
)

prison_pop <- read.csv(url_to_read, stringsAsFactors = FALSE)


prision_pop_wa <- prison_pop %>% filter(state == "WA")


prision_pop_wa <- prision_pop_wa %>% filter((county_name == "King County") & (state == "WA")) 

prision_pop_wa <- prision_pop_wa %>% filter(year >= "2000" & year <= "2016")



filtered_data <- prision_pop_wa %>% group_by(year, county_name)


chart1 <- ggplot(filtered_data, aes(year, colour = Race)) +
  geom_line(aes(y = aapi_prison_pop, color = "Asian or Pacific Islander")) +
  geom_line(aes(y = black_prison_pop, color = "Black")) +
  geom_line(aes(y = latinx_prison_pop, color = "Latinx")) +
  geom_line(aes(y = native_prison_pop, color = "Native American")) +
  geom_line(aes(y = other_race_prison_pop, color = "Other/Unknown")) +
  geom_line(aes(y = white_prison_pop, color = "White")) +
  scale_color_manual(values = c(
    "Black", "Red", "Green",
    "Blue", "Purple", "Brown"
  )) +
  labs(title = paste0(
    "The Different Population Counts For Different",
    "Races in King County Prison Over 2000 to 2016"
  ), y = "Count", x = "Year") +
  scale_x_continuous(breaks = seq(1970, 2016, by = 5))


ggplotly(chart1)
