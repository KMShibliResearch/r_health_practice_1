# 3.2 create a Data Frame
patients <- data.frame(
  id     = c(1,2,3,4,5),
  age    = c(5, 12, 34, 67, 45),
  sex    = c("F", "M", "F", "F", "M"),
  ward   = c("A", "B", "A", "C", "B"),
  fever  = c(TRUE, TRUE, FALSE, TRUE, FALSE)
)

patients

# 3.3 inspecting a Data Frame
head(patients, 3)             # first 3 row
nrow(patients)                # number of rows
ncol(patients)                # number of columns
names(patients)               # name of variables or columns 
str(patients)                 # structure and type of the Data Frame
summary(patients)             # quick summary of the Data Frame

# 3.4 selecting a specific variable or a specific column and specific observation of specific row
patients$age                   # will select the age variable from the patients dataframe
patients[2, ]                  # will select all the columns for the second row from the patients dataframe
patients[ , "sex"]             # will select "sex" column for all the rows
patients[patients$age >= 18, ] # will select all the columns for those row which satisfy the condition

# 3.5 adding a new column or variable
patients$adult <- patients$age >= 18   # will add a column named adult satisfying the codition
patients

patients$age_group <- ifelse(
  patients$age < 18, "Child", "Adult"  # will add a column named age_group based on the condition
  )
patients

# 3.6 quick count and group summaries
table(patients$age)                      # frequency table for age variable
table(patients$sex)                      # frequency table for sex variable
table(patients$sex, patients$fever)      # frequency 2x2 cross table for sex and fever variables
tapply(patients$age, patients$sex, mean) # table for mean age of sex 
 
# ---------------------- Exercise 3 -------------------
# 3.1 Create a data frame of six villages with columns village, population, cases. 
village_x <- data.frame(
  village    = c("A", "B", "C", "D", "E", "F"),
  population = c(5000, 1200, 3000, 2500, 6500, 10000),
  cases      = c(50, 22, 50, 30, 75, 45)
)
village_x

# 3.2 Add a column rate_per_1000. 
village_x$rater_per_1000 <- (village_x$cases/village_x$population)*1000
village_x

# 3.3 Show only villages with a rate above 10 per 1,000. 
village_x[village_x$rater_per_1000 > 10, ]

# 3.4 Count how many villages are above that threshold.
sum(village_x$rater_per_1000 > 10)










