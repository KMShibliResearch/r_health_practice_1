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

# 8.6 epidemic curve
epi <- tibble(
  epiweek = 10:15,
  cases   = c(3, 8, 15, 22, 12, 5)
)
epi

sum(epi$cases)

ggplot(
  epi, aes(x=factor(epiweek), y=cases)
  ) + 
  geom_col(
    width = 1, 
    fill = "darkorange", 
    colour = "white"
  ) + 
  labs(
    title = "Epidemic curve: cases by epidemiological week",
    x = "Epidemiological week",
    y = "Number of cases"
  ) + 
  theme_minimal()

# 8.7 Line chart
monthly <- tibble(
  month   = factor(month.abb, levels = month.abb),
  pm2     = c(95, 82, 60, 45, 38, 30, 28, 29, 35, 50, 78, 98)
)

ggplot(monthly, aes(x = month, y = pm2, group = 1)) + 
  geom_line(linewidth = 1, colour = "purple") +
  geom_point() +
  geom_hline(yintercept = 35, linetype = "dashed") + 
  labs(
    title = "Monthly mean pm2.5",
    x= NULL,
    y= "PM2.5 (µg/m³)"
  )







































