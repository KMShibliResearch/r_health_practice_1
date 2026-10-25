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

# 5.5 count(), group_by(), summarise()
# structure: data |> count(variable_name)
survey |> count(age_group)         # counts the number of observations in each category/group (age_group)
survey |> count(district)          # counts the number of observations in each category/group (district)

survey |> group_by(district) |> summarise(n=n())
survey |> group_by(district) |> summarise(mean(hb, na.rm = TRUE))

survey |> group_by(district) |> summarise(n=n(), mean(hb, na.rm = TRUE))

# 5.6 cleaning messy data
messy_data <- tibble(                                           # sample messy data tibble
  sex_raw  = c("F", "female", "Female", " female", "F ", "f ", "male", "Male", "m")
)
messy_data

messy_data <- messy_data |> mutate(                             # trims or removes empty spaces
  sex_raw_trimmed = str_trim(sex_raw)
)
messy_data

messy_data <- messy_data |> mutate(                            # turns everything into lower case
  sex_lowercase = str_to_lower(sex_raw_trimmed)
)
messy_data

messy_data <- messy_data |> mutate(                            
  sex_cleaned = case_when(
    sex_lowercase %in% c("f", "female") ~ "F",
    sex_lowercase %in% c("m", "male") ~ "M"
  )
) 
messy_data

# in one code block but step by step
messy_data <- messy_data |> mutate(
  sex_raw_trimmed = str_trim(sex_raw),
  sex_lowercase = str_to_lower(sex_raw_trimmed),
  sex_cleaned = case_when(
    sex_lowercase %in% c("f", "female")   ~"F",
    sex_lowercase %in% c("m", "male")     ~"M"
  )
)

# in one step
messy_data <- messy_data |> mutate(
  sex_lowercase = str_to_lower(str_trim(sex_raw)),
  sex_cleaned = case_when(
    sex_lowercase %in% c("f", "female") ~ "F",
    sex_lowercase %in% c("m", "male") ~ "M",
  )
)

messy_data
messy_data$sex_cleaned
table(messy_data$sex_cleaned)

# 5.7 duplicate and missing data (1st and last observation are kept same)
survey_2 <- tibble(
  id       = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 1),
  age      = c(23, 45, 31, 67, 12, 50, 35, 25, 14, 23),
  sex      = c("F", "M", "F", "M", "F", "M", "F", "M", "M", "F"),
  district = c("Dhaka", "Dhaka", "Sylhet", "Khulna", "Sylhet", "Dhaka","Sylhet", "Khulna", "Sylhet", "Dhaka"),
  hb       = c(11.5, 13.2, NA, 12.8, 10.9, 14.1, 12.3, NA, NA, 11.5 )
)
survey_2

survey_2 |> distinct()                          # will remove the last observation as it is identical to 1st
survey_2 |> distinct(id, .keep_all = TRUE)      # will keep the first raw per id ( if there is more row for one id it will be removed)
survey_2 |> drop_na(hb)                         # remove rows with missing hb (hb with NA)
survey_2 |> filter(!is.na(hb))                  # keeps only those which are not NA, (removed the NAs)

# 5.8 joining tables
pop <- tibble(                                  # (hypothetical) population for each district
  district   = c("Dhaka", "Khulna", "Sylhet"),
  population = c(10000, 3000, 4000)
)

pop
survey

survey |> 
  left_join(pop, by="district")                 # adding the population to the survey tibble

survey |>                                       # selecting only specific variables
  left_join(pop, by="district") |> 
  select(id, district, population)

# 5.9 reshaping : wide to long
case_wide <- tibble(
  district = c("Dhaka", "Khulna"),
  y2022    = c(120, 80),
  y2023    = c(150, 70)
)
case_wide

case_long <- case_wide |>
  pivot_longer(-district, names_to = "year", values_to = "cases")
case_long

# ---------------- Experimental demonstration of problem(wide) and solution(long) ------------------------
library(ggplot2)

# AWKWARD & BROKEN CONCEPT: You cannot easily map multiple columns to the y-axis 
# with a proper legend without manual hacks.
ggplot(case_wide, aes(x = district)) +
  geom_col(aes(y = y2022), fill = "blue", position = "nudge", width = 0.4) + # Hacky workaround
  geom_col(aes(y = y2023), fill = "red", position = "nudge", width = 0.4)     # Hard to scale


# CLEAN & DYNAMIC: One mapping controls the whole plot
ggplot(case_long, aes(x = district, y = cases, fill = year)) +
  geom_col(position = "dodge") +  # "dodge" puts the bars side-by-side
  labs(
    title = "Cases by District and Year",
    x = "District",
    y = "Number of Cases",
    fill = "Year"
  )


# 5.10 the whole process of cleaning can be done in one codeblock
# survey_clean <- survey |> rename(haemoglobin = hb) |> mutate(sex = factor(sex, levels = c("F", "M")), anemic = haemoglobin < 12) |> filter(age>= 0, age<= 110) |> left_join(pop, by = "district")    # in single line
survey_clean <- survey |> 
  rename(haemoglobin = hb) |> 
  mutate(
    sex = factor(sex, levels = c("F", "M")), 
    anemic = haemoglobin < 12
    ) |> 
  filter(age>= 0, age<= 110) |> 
  left_join(pop, by = "district")      # in multiple line for better understanding

saveRDS(survey_clean, "data_clean/survey_clean.rds")
























