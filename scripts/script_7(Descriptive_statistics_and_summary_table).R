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

# 7.3 measurement of the center and spread of variable
# center
mean(bp$sbp)                                     # mean of sbp from bp dataset
median(bp$sbp)                                   # median of sbp from bp dataset

# spread
range(bp$sbp)                                    # range of sbp from bp dataset
sd(bp$sbp)                                       # sandard deviation of sbp from bp dataset
var(bp$sbp)                                      # variance of sbp from bp dataset
min(bp$sbp)                                      # minimum valueof sbp from bp dataset
max(bp$sbp)                                      # maximum value of sbp from bp dataset
quantile(bp$sbp, c(0.25, 0.75))                  # quantile of sbp from bp dataset
IQR(bp$sbp)                                      # InterQuartileRange of sbp from bp dataset

# summary
summary(bp$sbp)                                  # summary of sbp from bp dataset

# 7.4 proportions: hypertension prevalence
bp <- bp |> mutate(hypertension = sbp >= 140)   # new variable created named hypertension
bp

sum(bp$hypertension)                            # sum of the TRUEs for hypertension (frequency)
mean(bp$hypertension)                           # proportion of the TRUEs for hypertension (proportion)
mean(bp$hypertension)*100                       # percentage of the TRUEs for hypertension (proportion)




























