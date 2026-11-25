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































































































