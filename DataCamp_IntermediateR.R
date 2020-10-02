#R comparision operators
#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
#Equality operator
# Comparison of logicals
TRUE == FALSE
# Comparison of numerics
-6*14 != 17-101
# Comparison of character strings
"useR" == "user"
# Compare a logical with a numeric
TRUE == 1

#Greater and less than operator
# Comparison of numerics
-6*5+2 >= -10+1
# Comparison of character strings
"raining" <= "raining dogs"
# Comparison of logicals
TRUE > FALSE

#Compare vectors
# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)
# Popular days - days when number of LinkedIn profile views exceed 15
linkedin>15
# Quiet days - days when linkedIn profile views were 5 times or fewer
linkedin<=5
# LinkedIn more popular than Facebook
linkedin>facebook

#Compare matrices
# The social data has been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)
views <- matrix(c(linkedin, facebook), nrow = 2, byrow = TRUE)
# When does views equal 13?
views == 13
# When is views less than or equal to 14?
views <= 14

#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
#R Logical operators
#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
# & and |
# The linkedin and last variable are already defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
last <- tail(linkedin, 1)
# Is last under 5 or above 10?
last<5 | last>10
# Is last between 15 (exclusive) and 20 (inclusive)?
last>15 & last<=20
# The social data (linkedin, facebook, views) has been created for you
# linkedin exceeds 10 but facebook below 10
linkedin>10 & facebook<10
# When were one or both visited at least 12 times?
linkedin>=12 | facebook>=12
# When is views between 11 (exclusive) and 14 (inclusive)?
views>11 & views<=14

#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
#R Conditional Statements
#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14
# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else if (medium == "Facebook") {
  # Add code to print correct string when condition is TRUE
  print("Showing Facebook information")
} else {
  print("Unknown medium")
}
# Control structure for num_views
if (num_views > 15) {
  print("You're popular!")
} else if (num_views <= 15 & num_views > 10) {
  # Add code to print correct string when condition is TRUE
  print("Your number of views is average")
} else {
  print("Try to be more visible!")
}

#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
#R Loops #While and For loops
#=======*=======*=======*=======*=======*=======*=======*=======*=======*=======*
# Initialize the speed variable
speed <- 88
while (speed > 30) {
  print(paste("Your speed is", speed))
  # Break the while loop when speed exceeds 80
  if (speed > 80) {
    break()
  }
  if (speed > 48) {
    print("Slow down big time!")
    speed <- speed - 11
  } else {
    print("Slow down!")
    speed <- speed - 6
  }
}

# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
# Loop version 1
for( rank in linkedin){
  print(rank)
}
# Loop version 2
for(iIndex in 1:length(linkedin)){
  print(linkedin[iIndex])
}

# The tic-tac-toe matrix ttt has already been defined for you
ttt
# define the double for loop
for (i in 1:nrow(ttt)) {
  for (j in 1:ncol(ttt)) {
    print(paste("On row", i, "and column", j, "the board contains", ttt[i,j]))
  }
}

# Pre-defined variables
rquote <- "r's internals are irrefutably intriguing"
chars <- strsplit(rquote, split = "")[[1]]
chars
# Initialize rcount
rcount <- 0
# Finish the for loop
for (char in chars) {
  if(char == 'r'){
    rcount = rcount+1
  } else if (char == 'u'){
    break
  }
}
# Print out rcount
rcount