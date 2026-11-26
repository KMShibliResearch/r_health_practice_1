# install.packages("tidyverse")
library(tidyverse)

# 10.2 Example: 
a_1 <- 30                     # exposed and sick
b_1 <- 50-30                  # exposed and healthy or not sick
c_1 <- 6                      # unexposed and sick
d_1 <- 50-6                   # unexposed and healthy or not sick

risk_exposed_1 <- a_1/(a_1+b_1)     # exposed group risk
risk_unexposed_1 <- c_1/(c_1+d_1)   # unexposed group risk

risk_ratio_RR_1 <- risk_exposed_1/risk_unexposed_1
risk_difference_RD_1 <- risk_exposed_1 - risk_unexposed_1

odds_ratio_OR_1 <- (a_1*d_1)/(b_1*c_1)
attr_factor_1 <- (risk_ratio_RR_1-1)/risk_ratio_RR_1


# 10.3 Confidence interval with hand
SE_ln_RR_1 <- sqrt(1/a_1 - 1/(a_1+b_1) + 1/c_1 - 1/(c_1+d_1))
CI_95_RR_1 <- exp(log(risk_ratio_RR_1) + c(-1.96, 1.96)*SE_ln_RR_1)

SE_ln_OR_1 <- sqrt(1/a_1 + 1/b_1 + 1/c_1 + 1/d_1)
CI_95_OR_1 <- exp(log(odds_ratio_OR_1) + c(-1.96, 1.96)*SE_ln_OR_1)

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

# 10.5 Fisher's exact test
fisher.test(matrix_table)

# 10.6 Example 2: A case control study
# cases: 45 exposed, 15 unexposed; 
# controls: 25 exposed, 35 unexposed

a_2 <- 45                         # exposed cases
b_2 <- 25                         # exposed controls
c_2 <- 15                         # unexposed cases
d_2 <- 35                         # unexposed controls

odds_ratio_OR_2 <- (a_2*d_2)/(b_2*c_2)
odds_ratio_OR_2

SE_ln_OR_2 <- sqrt(1/a_2 + 1/b_2 + 1/c_2 + 1/d_2)
CI_95_OR_2 <- exp(log(odds_ratio_OR_2) +c(-1.96, 1.96)*SE_ln_OR_2)
CI_95_OR_2











































































