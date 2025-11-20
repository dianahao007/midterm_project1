library(tidyverse)
library(here)

here::i_am(
  "code/f75_code1.R"
)

#import data set from raw data
f75 <- read.csv(here::here("data", "f75_interim.csv"))
glimpse(f75)

#filter and summarize muca measurements by sex 
boxplot_data <- f75[, c("sex", "muac")]

#save box_plot
saveRDS(
  boxplot_data,
  file = here::here("output", "boxplot_data.rds")
)

