library(usmap)
library(ggplot2)
library(dplyr)
library(plotly)

url_to_read <- paste0(
  "https://github.com/melaniewalsh/Neat-Datasets",
  "/blob/main/us-prison-pop.csv?raw=true"
)

prison_pop <- read.csv(url_to_read, stringsAsFactors = FALSE)


prison_pop <- prison_pop %>% filter(year == "2000")

prison_pop_wa <- prison_pop %>%
  filter(state == "WA") %>%
  rename("County" = county_name) %>%
  rename("Prison" = total_prison_pop) %>%
  rename("Population" = total_pop)


map_map <- plot_usmap("states",
  include = "Washington",
  data = prison_pop_wa, values = "Prison"
) +
  scale_fill_continuous(
    low = "darkturquoise",
    high = "orange", name = "Number of prisoners"
  ) +
  labs(title = "Number of Prisoners in Each County in Washington in 2000") +
  aes(text = paste(County, "\nPopulation: ", Population))


ggplotly(map_map)
