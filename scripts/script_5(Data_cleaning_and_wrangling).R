# 5.1 install and load the library if not yet
install.packages("tidyverse")
library(tidyverse)

# we'll continue with the survey tibble from script_4
survey <- tibble(
  id       = c(1, 2, 3, 4, 5, 6),
  age      = c(23, 45, 31, 67, 12, 50),
  sex      = c("F", "M", "F", "M", "F", "M"),
  district = c("Dhaka", "Dhaka", "Sylhet", "Khulna", "Sylhet", "Dhaka"),
  hb       = c(11.5, 13.2, NA, 12.8, 10.9, 14.1)
)
survey

# 5.2 filter(): choose row
# structure: data |> filter(conditions)              # only those row which satisfied the condition appear
survey |> filter(age >= 18)                          # only those who are greater than 18 y/o will appear         
survey |> filter(district == "Dhaka", sex =="F")     # only those who are female and from district Dhaka will appear
survey |> filter(district == "Dhaka", sex =="M")     # only those who are male and from district Dhaka will appear
survey |> filter(district %in% c("Dhaka", "Sylhet")) # only those who are from Dhaka and Sylhet district will appear

# 5.3 select(), rename(), arrange()
# structure: data |> select(conditions)
survey |> select(id, age, hb)                # selects id, age and hb variable values
survey |> select(district)                   # selects only the district variable values
survey |> select(-sex)                       # selects everything excluding sex variable

# structure: data |> rename( new = old)
survey |> rename(haemoglobin = hb)           # renames hb variable to haemoglobin

# structure: data |> arrange(conditions)
survey |> arrange(age)                       # arranges the survey according to age in asccending order
survey |> arrange(desc(age))                 # arranges the survey according to age in descending order

survey |> arrange(sex)                       # arrange the survey according to sex in asccending alphabetic order
survey |> arrange(desc(sex))                 # arrange the survey according to sex in descending alphabetic order

# 5.4 mutate(): create new variables
# structure: data <- data |> mutate(conditions)
survey <- survey |> mutate(                  # adds another variable named anemic based on the condition
  anemic = hb < 12
)
survey

survey <- survey |> mutate(                  # adds another variable named age group based on the condition
  age_group = case_when(
    age< 15 ~ "0-15",
    age< 45 ~ "15-44",
    age< 65 ~ "45-64",
    TRUE    ~ "65+"
  )
)
survey

# this can also be done in one mutate()
# structure: data <- data |> mutate(condition1, condition2, ...)
survey <- survey |> mutate(
  anemic = hb < 12,
  age_group = case_when(
    age< 15 ~ "0-15",
    age< 45 ~ "15-44",
    age< 65 ~ "45-64",
    TRUE    ~ "65+"
  )
)
survey




