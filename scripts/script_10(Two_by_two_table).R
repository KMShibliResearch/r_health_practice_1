# install.packages("tidyverse")
library(tidyverse)

# 10.2 Example: 
a <- 30                     # exposed and sick
b <- 50-30                  # exposed and healthy or not sick

c <- 6                      # unexposed and sick
d <- 50-6                   # unexposed and healthy or not sick

risk_exposed <- a/(a+b)     # exposed group risk
risk_unexposed <- c/(c+d)   # unexposed group risk

risk_ratio_RR <- risk_exposed/risk_unexposed
risk_difference_RD <- risk_exposed - risk_unexposed

odds_ratio_OR <- (a*d)/(b*c)
attr_factor <- (risk_ratio_RR-1)/risk_ratio_RR


# 10.3 Confidence interval with hand
SE_ln_RR <- sqrt(1/a - 1/(a+b) + 1/c - 1/(c+d))
exp(log(risk_ratio_RR) + c(-1.96, 1.96)*SE_ln_RR)

SE_ln_OR <- sqrt(1/a + 1/b + 1/c + 1/d)
exp(log(odds_ratio_OR) + c(-1.96, 1.96)*SE_ln_OR)

# 10.4 Chi-square test
matrix_table <- matrix(
  c(30, 20, 6, 44),
  nrow = 2,
  byrow = TRUE,
  dimnames = list(
    Salad = c("Ate", "Did not eat"),
    Outcome = c("Ill", "Well")
  )
)
matrix_table

chisq.test(matrix_table)



















































































