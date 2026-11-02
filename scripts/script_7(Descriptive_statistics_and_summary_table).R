# install and load libraries if not yet done
# install.packages("tidyverse")
library(tidyverse)

# 7.2 create a sample data for practice work
bp <- tibble(
  id     = 1:10,
  age    = c(25, 31, 42, 55, 38, 63, 29, 47, 58, 36),
  sex    = c("F", "M", "F", "M", "F", "M", "F", "M", "F", "M"),
  smoker = c("No", "Yes", "No", "Yes", "Yes", "Yes", "No", "No", "Yes", "No"),
  sbp    = c(118, 125, 132, 140, 128, 150, 122, 135, 145, 130)
)
bp

