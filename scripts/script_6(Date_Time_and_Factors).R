# installing and loading packages/libraries
# install.packages("tidyverse")  [install it if not yet installed]

# load libraries
library(tidyverse)
library(lubridate)

# 6.2 date format
date_1 <- ymd("2024-03-04")
date_1

date_2 <- dmy("04/03/2024")
date_2

date_3 <- dmy("04-03-2024")
date_3

date_4 <- mdy("March 4, 2024")
date_4

class(date_1)
class(date_2)
class(date_3)
class(date_4)
