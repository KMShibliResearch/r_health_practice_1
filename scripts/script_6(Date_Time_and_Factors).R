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

# 6.5 Example: counting cases by week
cases <- tibble(                            
  id              = c(1, 2, 3, 4, 5, 6),
  onset  = ymd(c(
    "2024-03-04", 
    "2024-03-06", 
    "2024-03-06",
    "2024-03-12", 
    "2024-03-13", 
    "2024-03-20"))
)
cases

# tells us the n-th epi week for the date in a new column
cases |>                                        
  mutate(epiweeks = epiweek(onset)) 

# counts the number of cases (rows) that fall in each n-th epi weeks 
cases |>                                        
  mutate(epiweeks = epiweek(onset)) |>
  count(epiweeks)

# 6.6 filling in missing days
cases <- tibble(                          # our onset data for cases               
  id              = c(1, 2, 3, 4, 5, 6),
  onset  = ymd(c(
    "2024-03-04", 
    "2024-03-06", 
    "2024-03-06",
    "2024-03-12", 
    "2024-03-13", 
    "2024-03-20"))
)

all_days <- tibble(                       # all days from where cases begin and up to where cases end 
  onset = seq(
    from = min(cases$onset),
    to   = max(cases$onset),
    by   = "day" 
  )
)
all_days

daily <- all_days |>                       # number of daily cases from the beginning to ending  
  left_join(
    count(cases, onset),                   # joins cases to 'onset' of all_days data set by the "onset" column of both data sets
    by="onset") |> 
  mutate(                                  # replaces 'n' column with '0' where there is 'NA'
    n=replace_na(n, 0)
  )

daily
   
nrow(daily)                                # number of rows in 'daily' variable: total days from beginning to ending
sum(daily$n)                               # sum of the n: which denotes the number of cases

missings_days <-nrow(daily) - sum(daily$n) # number of missing days with no observed/reported/recorded cases 
missings_days

# 6.7 factors and ordered categories 
severity <- factor(
  c("Mild", "Severe", "Moderate", "Mild", "Severe", "Mild"),
  levels = c("Mild", "Moderate", "Severe"),
  ordered = TRUE
)  

severity
table(severity)
sum(severity >= "Moderate")

# 6.8 making age group with cut()
ages <- c(5, 12, 34, 67, 45)
ages

age_grp <- cut(
  ages,
  breaks = c(0, 15, 45, 65, Inf),
  labels = c("0-14", "15-44", "45-64", "65+"),
  right = FALSE
)

age_grp
table(age_grp)


# 6.9 changing the reference category
sex <- factor(c("F", "M", "F", "F", "M"))         # let us say our sample data is 'sex'
levels(sex)                                       # having two levels ("F" for female and "M" for male)
sex <- relevel(sex, ref = "M")                    # re level the 'sex' variable by changing the reference category to "M" from "F"   
levels(sex)                                       # now it shows the level as "M" and "F"
































