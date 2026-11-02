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

# 7.5 frequency tables for categories
table(bp$smoker)                                # create a frequency table for the smoker variable
prop.table(table(bp$smoker))                    # create a proportion table for the smoker variable

table(bp$sex, bp$smoker, dnn = c("sex", "smoker"))  # dnn: dimnames. creates a cross table of sex and smoker

prop.table(table(bp$sex, bp$ smoker), margin = 1)   # creates row percentage table
prop.table(table(bp$sex, bp$ smoker), margin = 2)   # creates column percentage table


# 7.6 summary table
bp |> group_by(sex) |> 
  summarise(
  n        = n(),
  mean_sbp = mean(sbp),
  sd_sbp   = sd(sbp)
)

# 7.6b many summaries at once
bp |>
  summarise(across(c(age, sbp), list(mean_1 = mean, sd_1 = sd)))

# 7.7 Confidence Interval
ci <- t.test(bp$sbp)$conf.int
round(ci, 1)

# 7.8 professional table with 'gtsummary'
install.packages("gtsummary")
library(gtsummary)

bp |> 
  select(age, sbp, smoker, sex) |>
  tbl_summary(by = sex)


# ---------------------- Exercise 7 -------------------
# 1. Find the mean, median and SD of age in bp .
mean(bp$age)
median(bp$age)
sd(bp$age)

# 2. What percentage of the sample is aged 50 or above?
mean(bp$age >= 50)*100

# 3. Make a cross-table of hypertensive by smoker with row percentages. 
round(
  prop.table(
    table(bp$hypertension, bp$smoker, dnn = c("hypertension", "smoker")), 
    margin = 1),
  1)

# 4. Give the mean SBP separately for smokers and non-smokers.
bp |> 
  group_by(smoker) |>
  summarise(
    mean_sbp = mean(sbp)
  )







