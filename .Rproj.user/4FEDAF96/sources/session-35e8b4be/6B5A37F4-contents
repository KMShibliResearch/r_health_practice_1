# 2.1 concept: object
cases <- 45
population <- 12000
incidence_per_1000 <- (cases/population)*1000
incidence_per_1000

# 2.2 concept: data types
age         <- 34.5          # type: numeric
district    <- "Dhaka"       # type: character
vaccinated  <- TRUE          # type: logical

# type testing
class(age)
class(district)
class(vaccinated)

# 2.3 example: BOdy Mass Index(BMI) calculation
weight_in_kg  <- 70
height_in_m   <- 1.75
bmi           <- weight_in_kg/height_in_m^2
bmi

round(bmi, 1)       # round bmi up to 1 decimal

# 2.4 concept: vectors
ages  <- c(5, 12, 34, 67, 45)
wards <- c("A", "B", "A", "C", "B")

# parameters for vectors
length(ages)
length(wards)

mean(ages)
mean(wards)         # will produce error

median(ages)
median(wards) 

min(ages)
min(wards)

max(ages)
max(wards)

range(ages)
range(wards)

sum(ages)
sum(wards)         # will produce error

# 2.5 vectorized arithmetic: R works on all values at once
village       <- c("North", "South", "East", "West")
vill_cases    <- c(12, 30, 45, 8)
vill_pop      <- c(1000, 2500, 12000, 500)

rate_per_1000 <- (vill_cases/vill_pop)*1000 
rate_per_1000

# 2.6 indexing: picking elements
ages[1]             # picking the 1st element (5)
ages[c(1,3)]        # picking the 1st and 3rd element (5,34)
ages[-2]            # picking all the elements excluding 2nd (5,34,67,45)
ages[2:4]           # picking element from 2nd to 4th (12, 34, 67)

# 2.7 logical test and filtering
ages >= 18          # TRUE for condition satisfied, FALSE for opposite
ages[ages >=18]     # values greater or equal than 18 will show
sum(ages >= 18)     # number of ages that satisfies the condition

# comparison operator (==, !=, >, <, >=, <=, &, |, !)
ages[ages > 10 & ages <50]           # value which satisfies the both condition (12,34,45)

# 2.8 concept: factors (categories)
sex <- factor(c("F", "M", "F", "F", "M"))
levels(sex)
table(sex)

# 2.9 missing values: NA
haemoglobin <- c(11.2, 9.8, NA, 12.5)
haemoglobin

mean(haemoglobin)                   # NA, because one value is missing
mean(haemoglobin, na.rm = TRUE)     # removed NA and mean is calculated on remaining values
sum(is.na(haemoglobin))             # total number of NA or missing value

# 2.10 useful sequences and repeats
1:5
seq(0, 100, by = 25)
rep("Control", 3)

# ---------------------- Exercise 2 -------------------
# 2.1: A district has 240 malaria cases and 80,000 people. Calculate incidence per 10,000.
d_maleria_cases       <- 240
d_population          <- 80000
d_incidence_per_10000 <- (d_maleria_cases/d_population)*10000
d_incidence_per_10000

# 2.2: Given haemoglobin <- c(120, 135, 150, 110, 142) , find the mean and how many readings are 140 or above.
haemoglobin <- c(120, 135, 150, 110, 142)
mean(haemoglobin)
sum(haemoglobin >= 140)

# 2.3: Create a vector of five PM2.5 values (µg/m³) and find the maximum and the ones above 35.
particulate_matter_25 <- c(55, 10, 45, 12, 34)
max(particulate_matter_25)
particulate_matter_25[particulate_matter_25 > 35]

# 2.4: Calculate BMI for a person of 82 kg and 1.68 m
weight_kg <- 82
height_m  <- 1.68

bmi       <- weight_kg/height_m^2
bmi






















