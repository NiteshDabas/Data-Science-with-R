print("This is me getting started with R on March 24th 2020")

#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
#R as a calculator
#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
print(6+14)
6+14
6-14
6/14
#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
#Variable Assignment
#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
iMultiplyResult <- 25*5
print(iMultiplyResult)  #Prints the result
iFirst = 12.5
iAdd = 2.5
iDevide = 5
iFirst+iAdd/iDevide     #13
(iFirst+iAdd)/iDevide   #3
#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
#R is case sensitive/Checking Datatype
#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
mylogical <- FALSE
class(mylogical)
myLogical <- "False"
class(myLogical)
#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
#{Linear Algebra in R}
#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
#Vectors in R
#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
Int_Vector <- c(1,2,3)
char_Vector <- c("Nitesh", "Pinky", "Baby")
Logical_Vector <- c(TRUE, FALSE, TRUE)
Poker_Vector <- c(100, -500, -135, 500, -450)
Roulette_Vector <- c(200, 400, -500, 130, -400)
names(Poker_Vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(Roulette_Vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
days_Vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(Poker_Vector) <- days_Vector
names(Roulette_Vector) <- days_Vector
#What the overall profit or loss per day of the week was
total_daily = Poker_Vector + Roulette_Vector
print(total_daily)
#total amount of money you have lost/won with poker
total_Poker = sum(Poker_Vector)
print(total_Poker)
#total amount of money you have lost/won with roulette
total_Roulette = sum(Roulette_Vector)
print(total_Roulette)
#total winnings overall
total_winnings = total_Poker + total_Roulette
print(total_winnings)
total_Roulette>total_Poker
#Notice that in R, First index of a vector starts with 1 and not 0.
Winnings_Wednesday <- total_daily[3]
print(Winnings_Wednesday)
#Roulette results of Tuesday, Wednesday and Thursday to the variable Roulette_Midweek
Roulette_Midweek <- Roulette_Vector[c(2,3,4)]
print(Roulette_Midweek)
Poker_Midweek <- Poker_Vector[c(2:5)]
print(Poker_Midweek)
print(Poker_Midweek[c("Tuesday","Wednesday","Thrusday","Friday")])
#calculate the average of the values in Roulette_Midweek
print(mean(Roulette_Midweek))
#Selection by comparison
#Which days did you make money on poker?
selection_vector <- Poker_Vector>0
print(selection_vector)
#passing logical vector selection_vector to a vector will return vales corresponding to TRUE
print(Poker_Vector[selection_vector])
#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
#Matrices in R
#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
# Construct a matrix with 3 rows that contain the numbers 1 up to 9
matrix(1:9, byrow = TRUE, nrow = 3)
matrix(1:9, byrow = FALSE, nrow = 3)
# Box office Star Wars (in millions!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)
# Create box_office
box_office <- c(new_hope, empire_strikes, return_jedi)
# Construct star_wars_matrix
star_wars_matrix <- matrix(box_office, byrow=TRUE, nrow = 3)
print(star_wars_matrix)
# Vectors region and titles, used for naming
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")
# Name the columns with region
colnames(star_wars_matrix) <- region
# Name the rows with titles
rownames(star_wars_matrix) <- titles
print(star_wars_matrix)
box_office <- c(460.998, 314.4, 290.475, 247.900, 309.306, 165.8)
star_wars_matrix = matrix(box_office, byrow = TRUE, nrow = 3, 
                          dimnames = list(c("A New Hope", "The Empire Strikes Back", "Return of the Jedi"),
                                          c("US", "non-US")))
print(star_wars_matrix)
# Calculate worldwide box office figures
worldwide_vector <- rowSums(star_wars_matrix)
print(worldwide_vector)
# Bind the new variable worldwide_vector as a column to star_wars_matrix
all_wars_matrix <- cbind(star_wars_matrix,worldwide_vector)
print(all_wars_matrix)
star_wars_matrix2 = matrix(c(474.5,  552.5, 310.7,  338.7, 380.3,  468.5), byrow = TRUE, nrow = 3,
                           dimnames = list(c("The Phantom Menace","Attack of the Clones","Revenge of the Sith"),
                                           c("US", "non-US")))
# Combine both Star Wars trilogies in one matrix
all_wars_matrix <- rbind(star_wars_matrix, star_wars_matrix2)
print(all_wars_matrix)
# Total revenue for US and non-US
total_revenue_vector <- colSums(all_wars_matrix)
print(total_revenue_vector)
# Select the non-US revenue for all movies
non_us_all <- all_wars_matrix[,2]
print(non_us_all)
# Average non-US revenue
print(mean(non_us_all))
# Select the non-US revenue for first two movies
non_us_some <- non_us_all[1:2]
print(non_us_some)
# Average non-US revenue for first two movies
mean(mean(non_us_some))
# Estimate the visitors
visitors <- 1/5*(all_wars_matrix)
# Print the estimate to the console
print(visitors)
#to check out the contents of the workspace, 
ls()
#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
#Factors in R for categorical values
#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
# Sex vector
sex_vector <- c("Male", "Female", "Female", "Male", "Male")
# Convert sex_vector to a factor
factor_sex_vector <- factor(sex_vector)
# Print out factor_sex_vector
factor_sex_vector
#Factors - Nominal Factors and Ordinal Factors 
# Animals - Example of Nominal Factor(Order is not explicitly evident)
animals_vector <- c("Elephant", "Giraffe", "Donkey", "Horse")
factor_animals_vector <- factor(animals_vector)
factor_animals_vector
# Temperature - Ordinal Factor((Order is explicitly evident))
temperature_vector <- c("High", "Low", "High","Low", "Medium")
factor_temperature_vector <- factor(temperature_vector, order = TRUE, levels = c("Low", "Medium", "High"))
factor_temperature_vector
#Factor Levels
# Code to build factor_survey_vector
survey_vector <- c("M", "F", "F", "M", "M")
factor_survey_vector <- factor(survey_vector)
# Specify the levels of factor_survey_vector
levels(factor_survey_vector) <- c("Female", "Male")
#Note that statement levels(factor_survey_vector) <- c("Male", "Female") will give error as 
#R assigns factors alphabetically internally and categories in function levels() should match that order
factor_survey_vector
#Summarizing a factor - quick overview of the contents of a variable.
summary(survey_vector)
summary(factor_survey_vector)

#Ordered factors
# Create speed_vector
speed_vector <- c("medium", "slow", "slow", "medium", "fast")
# Convert speed_vector to ordered factor vector
factor_speed_vector <- factor(speed_vector, ordered = TRUE, levels= c("slow", "medium", "fast"))
# Print factor_speed_vector
factor_speed_vector
summary(factor_speed_vector)
#Comparing ordered factors
# Factor value for second data analyst
da2 <- factor_speed_vector[2]
# Factor value for fifth data analyst
da5 <- factor_speed_vector[5]
# Is data analyst 2 faster than data analyst 5?
da2>da5
#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
#Data Frames in R -> collection of lists which contains different data types
#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
data() #shows loaded datasets in R
summary(mtcars) #summarizes the dataset in detail
str(mtcars)     #Investigates the structure of dataset
head(mtcars)
tail(mtcars)
# Create a data frame from the vectors
name <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)
planets_df <- data.frame(name,type,diameter,rotation,rings)
planets_df
str(planets_df)
#Selection of data frame elements
# Print out diameter of Mercury (row 1, column 3)
planets_df[1,3]
# Print out data for Mars (entire fourth row)
planets_df[4,]
# Select first 5 values of diameter column
planets_df[1:5,"diameter"]
#accessing entire rows/columns of a dataframe
rings_vector<-planets_df$rings
rings_vector
# Select planets with diameter < 1
subset(planets_df, subset = planets_df$diameter<1)
# Use order() to create positions
positions <- order(planets_df$diameter)
# Use positions to sort planets_df
planets_df[positions,]
#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
#Lists in R -> collection of elements of different data types in multiple dimentions. 
#A list in R allows you to gather a variety of objects under one name (that is, the name of the list) in an ordered way. These objects can be matrices, vectors, data frames, even other lists, etc.
#Vectors (one dimensional array): can hold numeric, character or logical values. The elements in a vector all have the same data type.
#Matrices (two dimensional array): can hold numeric, character or logical values. The elements in a matrix all have the same data type.
#Data frames (two-dimensional objects): can hold numeric, character or logical values. Within a column all elements have the same data type, but different columns can be of different data type.
#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
# Vector with numerics from 1 up to 10
my_vector <- 1:10 
# Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)
# First 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10,]
# Adapt list() call to give the components names
my_list <- list(my_vector, my_matrix, my_df)
# Print out my_list
my_list <- list(vec = my_vector, mat = my_matrix, df = my_df)
my_list
my_list$vec
my_list$vec[2]