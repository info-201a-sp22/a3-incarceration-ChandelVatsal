install.packages("usmap")
library(usmap)
library(ggplot2)
library(dplyr)
library(plotly)




prison_pop <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-prison-pop.csv?raw=true", stringsAsFactors = FALSE)


prison_pop <- prison_pop %>% filter(year == "2000")

prison_pop_wa <- prison_pop %>% filter(state == "WA")


map_map <- plot_usmap("states", include = "Washington", data = prison_pop_wa, values = "total_prison_pop", text = paste("County: ", prison_pop_wa$county_name)) +
  scale_fill_continuous(low = "darkturquoise", high = "orange", name = "Number of prisoners") +
  labs(title= "Number of Prisoners in Each County in Washington in 2000") 



ggplotly(map_map, tooltip = "text")


