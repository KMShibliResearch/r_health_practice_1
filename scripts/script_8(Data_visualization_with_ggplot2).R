# install packages if not yet done
# install.packages("tidyverse")
library(tidyverse)

# 8.1 define practice dataset
bp <- tibble(
  id     = 1:10,
  age    = c(25, 31, 42, 55, 38, 63, 29, 47, 58, 36),
  sex    = c("F", "M", "F", "M", "F", "M", "F", "M", "F", "M"),
  smoker = c("No", "Yes", "No", "Yes", "Yes", "Yes", "No", "No", "Yes", "No"),
  sbp    = c(118, 125, 132, 140, 128, 150, 122, 135, 145, 130)
)
bp

# 8.2 histogram 
ggplot(bp, aes(x = sbp)) +
  geom_histogram(
    binwidth = 5, 
    fill = "steelblue", 
    color = "white"
    ) + 
  labs(title = "Distribution of systolic blood pressure", 
       x = "SBP (mmHg)", 
       y = "Number of people"
       )

# 8.3 bar chart 
ggplot(bp, aes(x = smoker, fill = sex)) + 
  geom_bar(
    position = "dodge",
    ) +
  labs(
    title = "Smoking status by sex", 
    x = "smoker", 
    y = "number of people"
    )

# 8.4 box plot
ggplot(bp, aes(x = smoker, y = sbp, fill = smoker)) +
  geom_boxplot(
    show.legend = TRUE
  ) + 
  geom_jitter(
    width = 0.1, size = 2
  ) +
  labs(
    x = "Smoker",
    y = "SBP (mmHg)",
    title = "Systolic blood pressure by smoking status"
  )

# 8.5 Scatter plot 
ggplot(
  bp, 
  aes(x=age, y=sbp)
  ) + 
  geom_point(
    size = 3, 
    colour = "firebrick",
  ) + 
  geom_smooth(
    method = "lm",
    se = FALSE
  ) + 
  labs(
    title = "Blood pressure rise with age",
    x = "Age (years)",
    y = "SBP (mmHg)"
  )















































