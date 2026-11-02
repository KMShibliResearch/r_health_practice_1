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

















