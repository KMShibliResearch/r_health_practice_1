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

# 6.3 Date arithmetic: delays and duration
onset <- ymd("2024-03-04")              # when the event (or disease) actually started 
report <- ymd("2024-03-09")             # when the event (or disease) is reported
delay <- report - onset                 # difference between two time or event

delay                                   # the result will be: Time difference of 5 days
as.numeric(delay)                       # the result will be: 5

class(onset)                            # class of onset is: "Date"
class(report)                           # class of report is: "Date"

class(delay)                            # class of delay is: "difftime"
class(as.numeric(delay))                # class of (as.numeric(delay)) is: "numeric"




























