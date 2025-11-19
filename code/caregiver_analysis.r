library(here)
library(dplyr)
library(ggplot2)

here::i_am(
  "code/caregiver_analysis.R"
)

#input data
df <- read.csv(here("data", "f75_interim.csv"))

# "Mother" vs "Other"
df <- df %>%
  mutate(caregiver_cat = ifelse(caregiver == "Mother", "Mother", "Other"))

# calculate MUAC change percentage
df <- df %>%
  mutate(muac_change_pct = ((muac2 - muac1) / muac1) * 100)

#Summary statistics according to caregiver_cat
summary_stats <- df %>%
  group_by(caregiver_cat) %>%
  summarise(
    mean_change = mean(muac_change_pct, na.rm = TRUE),
    median_change = median(muac_change_pct, na.rm = TRUE),
    sd_change = sd(muac_change_pct, na.rm = TRUE),
    n = n()
  )

print(summary_stats)

# visualization
# Boxplot
ggplot(df, aes(x = caregiver_cat, y = muac_change_pct, fill = caregiver_cat)) +
  geom_boxplot() +
  labs(title = "MUAC Change % by Caregiver Type",
       x = "Caregiver Type",
       y = "MUAC Change (%)") +
  theme_minimal() +
  theme(legend.position = "none")

# Dotplot
ggplot(df, aes(x = caregiver_cat, y = muac_change_pct)) +
  geom_jitter(width = 0.2, height = 0, alpha = 0.6, color = "blue") +
  labs(title = "MUAC Change % by Caregiver Type (Dot Plot)",
       x = "Caregiver Type",
       y = "MUAC Change (%)") +
  theme_minimal()