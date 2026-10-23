# 4.1 installing and loading required packages
install.packages(c("tidyverse", "writexl"))             # once
library(tidyverse)
library(readxl)
library(haven)
library(writexl)

# 4.2 creating and reading a data file
survey <- tibble(
  id       = c(1, 2, 3, 4, 5, 6),
  age      = c(23, 45, 31, 67, 12, 50),
  sex      = c("F", "M", "F", "M", "F", "M"),
  district = c("Dhaka", "Dhaka", "Sylhet", "Khulna", "Sylhet", "Dhaka"),
  hb       = c(11.5, 13.2, NA, 12.8, 10.9, 14.1)
)

# exporting as a csv fiele: survey.csv
write_csv(survey, "data_raw/survey.csv")

# importing the csv file from the data_raw folder and name it survey_imp_csv
survey_imp_csv <- read_csv("data_raw/survey.csv")
survey_imp_csv

# exporting as a excel fiele: survey.xlsx
write_xlsx(survey, "data_raw/survey.xlsx")
# importing the excel file from the data_raw folder and name it survey_imp_xlsx
survey_imp_exel <- read_excel("data_raw/survey.xlsx")
survey_imp_exel

# exporting as a stata fiele: survey.dta
write_dta(survey, "data_raw/survey.dta")
# importing the stata file from the data_raw folder and name it survey_imp_dta
survey_imp_dta <- read_dta("data_raw/survey.dta")
survey_imp_dta

# exporting as a spss fiele: survey.sav
write_sav(survey, "data_raw/survey.sav")
# importing the spss file from the data_raw folder and name it survey_imp_sav
survey_imp_sav <- read_sav("data_raw/survey.sav")
survey_imp_sav



































