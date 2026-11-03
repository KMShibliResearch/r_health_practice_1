# install.packages("tidyverse")
library(tidyverse)

# 9.2 Code example
# Prevalence: 120 people with diabetes among 1500 surveyed
diabetes_case <- 120
pop_surveyed <- 1500

diabetes_prev <- diabetes_case/pop_surveyed
diabetes_prev

# cumulative incidence (risk): 30 new cases among 1200 at risk over 1 year.
new_cases <- 30
pop_at_risk_at_start <- 1200

cumulative_incidence <- (new_cases/pop_at_risk_at_start)*1000  # per 1000 pop at risk
cumulative_incidence                                           

# Incidence rate: 25 cases in 1250 person-year
cases <- 25
person_year <- 1250

incidence_rate <- (cases/person_year) *1000                   # per 1000 person-year
incidence_rate

# Case fatality: 18 deaths among 360 cases
n_of_deaths <- 18
n_of_cases <- 360

case_fatality <- (n_of_deaths/n_of_deaths)*100               # per 100 or percent

# Crude death rate: 480 deaths in 60,000 people
death_people <- 480
total_pop <- 60000
crude_death_rate <- (death_people/total_pop)*1000            # per 1000 population
crude_death_rate





































