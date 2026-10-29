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

# 6.4 extracting parts of a date
year(onset)                       # will show the year of the onset 
month(onset)                      # will show the number of month of the onset
month(onset, label = TRUE)        # will show the name of the month (label) of the onset               
wday(onset)                       # will show the number of the weekday of the onset
wday(onset, label = TRUE)         # will show the name of the weekday (label) of the onset

epiyear(onset)                    # will show the epidemiological year of the onset
epiweek(onset)                    # will show the epidemiological week of the onset

# 6.4 Example: counting cases by week
cases <- tibble(
  id     = c(1, 2, 3, 4, 5, 6),
  onset  = ymd(c(
    "2024-03-04", 
    "2024-03-06", 
    "2024-03-06",
    "2024-03-12", 
    "2024-03-13", 
    "2024-03-20"))
)

cases |>                                        # tells us the n-th epi week for the date in a new column
  mutate(epiweek_of_study = epiweek(onset))

cases |>                                        # counts the number days that fall in each n-th epi weeks 
  mutate(epiweek_of_study = epiweek(onset)) |>
  count(epiweek_of_study)























