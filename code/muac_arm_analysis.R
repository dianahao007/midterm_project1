library(here)
library(dplyr)
library(ggplot2)

here::i_am("code/muac_arm_analysis.R")
df <- read.csv(here("data", "f75_interim.csv"))

arm_var <- "arm"

df <- df %>%
  mutate(
    muac1 = as.numeric(muac1),
    muac2 = as.numeric(muac2)
  ) %>%
  filter(!is.na(muac1), !is.na(muac2)) %>%
  filter(!is.na(.data[[arm_var]]))
df <- df %>%
  mutate(
    muac_change_pct = ((muac2 - muac1) / muac1) * 100
  )

summary_by_arm <- df %>%
  group_by(.data[[arm_var]]) %>%
  summarise(
    mean_change   = mean(muac_change_pct, na.rm = TRUE),
    median_change = median(muac_change_pct, na.rm = TRUE),
    sd_change     = sd(muac_change_pct, na.rm = TRUE),
    n             = n(),
    .groups = "drop"
  )

print(summary_by_arm)

write.csv(
  summary_by_arm,
  here("Output", "muac_change_by_arm_summary.csv"),
  row.names = FALSE
)

p_box <- ggplot(
  df,
  aes(x = .data[[arm_var]], y = muac_change_pct, fill = .data[[arm_var]])
) +
  geom_boxplot() +
  labs(
    title = "Relative MUAC Change (%) by Randomization Arm",
    x = "Randomization Arm",
    y = "MUAC Change (%)"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

print(p_box)

ggsave(
  filename = here("Output", "muac_change_by_arm_boxplot.png"),
  plot     = p_box,
  width    = 6,
  height   = 4
)
