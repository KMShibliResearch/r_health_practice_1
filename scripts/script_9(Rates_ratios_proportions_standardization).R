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

# 9.3 comparing the exposed and unexposed: 
rate_exp <- (30/2000)*1000                                   # case rate for exposed group
rate_unexp <- (12/3000)*1000                                 # case rate for unexposed group

rate_exp
rate_unexp

inc_rate_ratio <- rate_exp/rate_unexp                        # incidence rate ratio
inc_rate_ratio

inc_rate_diff <- rate_exp - rate_unexp                       # incidence rate difference
inc_rate_diff

# 9.4 standardization
d <- tibble(
  # area     = rep(c("A", "B"), each = 3),
  # age_grp  = rep(c("0-14", "15-44", "45+"), 2),
  area     = c("A","A","A", "B", "B", "B"),
  age_grp  = c("0-14", "15-44", "45+", "0-14", "15-44", "45+"),
  pop      = c(5000, 8000, 7000, 8000, 7000, 3000),
  deaths   = c(5, 16, 70, 8, 14, 33)
)

d <- d |> 
  mutate(                                                 # age specific death rate per 1000 population
  rate = (deaths/pop)*1000
)
d

# crude death rates by are
d |>
  group_by(area) |>
  summarise(crude_rate = (sum(deaths)/sum(pop))*1000)       # area specific death rate per 1000 population

# 9.5 Direct stadardization
weights <- tibble(
  age_grp  = c("0-14", "15-44", "45+"),
  w          = c(0.30, 0.40, 0.30)
)
weights

d |>
  left_join(weights, by="age_grp") |>
  group_by(area) |> 
  summarise(
    crude     = (sum(deaths)/sum(pop)) *1000,
    adjusted  = sum(rate*w)
  )

# 9.6 Indirect standardizations
ref_rate <- c(1,2,10)/1000      # reference rates (Area A's, per person)
ref_rate

pop_B <- c(8000, 7000, 3000)
pop_B

expected <- sum(ref_rate*pop_B)
expected

observed <- 55 

SMR <- observed/expected
SMR

conf_int_smr <- poisson.test(55, 52)
conf_int_smr

# 9.7 Using packages for rates with confidence interval
install.packages(c("epitools", "epiR"))
library(epitools)

# exact poisson 95% CI for a rate: x events, person-time pt
pois.exact(x = 25, pt = 1250, conf.level = 0.95)


# ------------------------------- Exercises 9-------------------------------
# 1. In a village of 4,000 people, 64 new TB cases occurred in one year. Calculate the incidence per 100,000.
vill_new_TB_cases <- 64
pop_at_risk_with_TB <- 4000

TB_incidence_rate <- (vill_new_TB_cases/pop_at_risk_with_TB)*100000                     # per 100000 pop at risk
TB_incidence_rate

# 2. A hospital recorded 14 deaths among 280 cholera patients. What is the CFR(Case Fatality Rate)?
no_of_deaths_from_cholera <- 14
no_of_cases_from_cholera <- 270

case_fatality_rate_cholera <- (no_of_deaths_from_cholera/no_of_cases_from_cholera)*100  # per 100 cases
case_fatality_rate_cholera
# 3. Smokers: 40 cases in 5000 person-years. Non-smokers: 10 cases in 4000 person-years.
#    Compute the rate ratio and rate difference per 1000 person-years.
smoker_cases <- 40
smoker_person_year <- 5000
smoker_exposed_rate <- (smoker_cases/smoker_person_year)*1000
smoker_exposed_rate

nonsmoker_cases <- 10
nonsmoker_person_year <- 4000
non_smoker_unexposed_rate <- (nonsmoker_cases/nonsmoker_person_year)*1000
non_smoker_unexposed_rate

smoking_rate_ratio <- smoker_exposed_rate/non_smoker_unexposed_ratea
smoking_rate_ratio

smoking_rate_diff <- smoker_exposed_rate - non_smoker_unexposed_rate
smoking_rate_diff

# 9.5 Direct stadardization
weights <- tibble(
  age_grp  = c("0-14", "15-44", "45+"),
  w          = c(0.30, 0.40, 0.30)
)
weights

d |>
  left_join(weights, by="age_grp") |>
  group_by(area) |> 
  summarise(
    crude     = (sum(deaths)/sum(pop)) *1000,
    adjusted  = sum(rate*w)
  )

# 4. Using the standard weights in 9.5, compute the age-standardized rate for a new area C
#    with age-specific rates of 2, 3 and 12 per 1000. 
weights <- tibble(
  age_grp  = c("0-14", "15-44", "45+"),
  w        = c(0.30, 0.40, 0.30)
)
weights

area_c <- tibble(
  age_grp  = c("0-14", "15-44", "45+"),
  rate_c    = c(2, 3, 12)
)
area_c

area_c |> left_join(weights, by="age_grp") |> 
  summarise(
  sum(adjusted_rate_c = rate_c*w)
  )





































