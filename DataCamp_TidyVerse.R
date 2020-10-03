#install.packages("gapminder")
#install.packages("dplyr")
#install.packages("ggplot2")

library(gapminder)
library(dplyr)
library(ggplot2)

getwd()

#=======##=======##=======##=======##=======##=======##=======##=======##=======##=======#
#Data Wrangling/Manipulation
#=======##=======##=======##=======##=======##=======##=======##=======##=======##=======#
#filter() - Filters dataset into  a smaller much relevant dataset 
gapminder %>% filter(year == 2007)
gapminder %>% 
  filter(country == "India") %>%
  filter(year == 2002)

#arrange() - Arranges the entries in a column of the dataset
#Country with highest population in the year 1982?
gapminder %>% 
  filter(year == 1982) %>%
    arrange(desc(pop))

#mutate() - Changes or adds variables 
# Use mutate to change lifeExp to be in months
gapminder %>% mutate(lifeExp = lifeExp*12 )
# Use mutate to create a new column called lifeExpMonths
gapminder %>% mutate(lifeExpMonths = lifeExp*12)

#query to find life expectancy in months for the year 2007 in descending order
gapminder %>% mutate(lifeExpMonths = lifeExp*12) %>%
  filter(year == 2007) %>%
    arrange(desc(lifeExpMonths))

#=======##=======##=======##=======##=======##=======##=======##=======##=======##=======#
#Data Visualization
#=======##=======##=======##=======##=======##=======##=======##=======##=======##=======#
gapminder_1952 <- gapminder %>%
  filter(year == 1952)
# Change to put pop on the x-axis and gdpPercap on the y-axis
ggplot(gapminder_1952, aes(x = pop, y = gdpPercap)) + geom_point()
ggplot(gapminder_1952, aes(x=pop, y=lifeExp)) + geom_point()

#Logarithmic scale - scale were each fixed distance represents a multiplication of value
ggplot(gapminder_1952, aes(x=pop, y=gdpPercap)) +geom_point() + scale_x_log10() + scale_y_log10()

#Catagorial variable in a scatter plot => colour of point => colour = continent(variablename) inside aes
#Numerical variable in a scatter plot => size of te point => size = pop(variablename) inside aes
ggplot(gapminder_1952, aes(x=pop, y=lifeExp, color=continent, size=gdpPercap)) + geom_point() +scale_x_log10()

#Faceting => +facet_wrap(~variable)[Comparision between catogorical variables such as continents, numbers etc]
ggplot(gapminder_1952, aes(x=pop, y=lifeExp)) + geom_point() + scale_x_log10() + facet_wrap(~continent)

##ALL IN ONE
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, color=continent, size=pop)) + geom_point() 
+ scale_x_log10() + facet_wrap(~year, nrow = 3)

#=======##=======##=======##=======##=======##=======##=======##=======##=======##=======#
#Data transformation wit dplyr - more ways of data exploration
#=======##=======##=======##=======##=======##=======##=======##=======##=======##=======#
##summarize() => <<<<Turns many rows into one 
##summarize() => Summerizes many obervations into a single datapoint
gapminder %>%
  filter(year == 1957) %>%
  summarize(medianLifeExp = median(lifeExp), maxGdpPercap= max(gdpPercap))

#group_by() => before summarizing the data()of entire dataset, it turns groups(within dataset) into one row each
# Find median life expectancy and maximum GDP per capita in each continent in 1957
gapminder %>%
  filter(year == 1957) %>%
  group_by(continent) %>%
  summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))
# Find median life expectancy and maximum GDP per capita in each continent/year combination
gapminder %>%
  group_by(year, continent) %>%
  summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

##=======##=======##=======##=======##=======##=======##=======##=======##=======##=======#
#Visualizing summarized data - more ways of data exploration - Using ggplot2 package
##=======##=======##=======##=======##=======##=======##=======##=======##=======##=======#
by_year <- gapminder %>%
            group_by(year) %>%
            summarize(medianlifeExp = median(lifeExp), maxgdpPercap = max(gdpPercap))
# Create a scatter plot showing the change in medianLifeExp over time
ggplot(by_year, aes(x=year, y=medianlifeExp)) + geom_point() + expand_limits(y=0)

# Summarize medianGdpPercap within each continent within each year: by_year_continent
by_year_continent <- gapminder  %>%
  group_by(year, continent) %>%
  summarize(medianGdpPercap = median(gdpPercap))
# Plot the change in medianGdpPercap in each continent over time# Plot the change in medianGdpPercap in each continent over time
ggplot(by_year_continent, aes(x=year, y=medianGdpPercap, color=continent)) + geom_point() + expand_limits(y=0)

# Summarize the median GDP and median life expectancy per continent in 2007
by_continent_2007 <- gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarize(medianGdpPercap = median(gdpPercap), medianLifeExp = median(lifeExp))
# Use a scatter plot to compare the median GDP and median life expectancy
ggplot(by_continent_2007, aes(x=medianGdpPercap, y=medianLifeExp)) + geom_point() + expand_limits(y=0)


##=======##=======##=======##=======##=======##=======##=======##=======##=======##=======#
#Different Types of charts using ggplot2 library
##=======##=======##=======##=======##=======##=======##=======##=======##=======##=======#
#Scatter Plots - for comparing two variables wit eac point representing one observation.
#Line Plots - for depicting changes over time.
#Bar Charts - for comparing (summary) statistics for each of several categories b/w themselves suc as catgories, continents etc.
#             (one bar for eac continent wit igt of bar = y axis value). Unlike scatter/line plots bar plots always starts with 0.
#Histograms - for distribution of a one dimentional numeric variable.
#Box Plots  - for comparing the distribution of a numeric variable .

#Lineplot
ggplot(by_year, aes(x=year, y=medianlifeExp)) + geom_line() + expand_limits(y=0)
ggplot(by_year_continent, aes(x=year, y=medianGdpPercap, color=continent)) + geom_line() + expand_limits(y=0)

#Barplot
# Summarize the median gdpPercap by continent in 1952
by_continent <- gapminder %>%
  filter(year == 1952) %>%
  group_by(continent) %>%
  summarize(medianGdpPercap = median(gdpPercap))
# Create a bar plot showing medianGdp by continent
ggplot(by_continent, aes(x= continent, y=medianGdpPercap)) + geom_col()

## Filter for observations in the Oceania continent in 1952
oceania_1952 <- gapminder %>%
  filter(year == 1952, continent == "Oceania")
# Create a bar plot of gdpPercap by country
ggplot(oceania_1952, aes(x=country, y= gdpPercap)) + geom_col()

#Histogram - scatter/line/bar->relation b/w two or more variables. Histogram-> one diamention of a numeric variable at a time
#            histogram shows a "distribution"(bins->interval b/w bins is one unit of varing change). 
#            only one aes(x=var whose distibution is to be examined)
gapminder_1952 <- gapminder %>%
  filter(year == 1952)
# Create a histogram of population (pop), with x on a log scale
ggplot(gapminder_1952, aes(x=pop)) + geom_histogram(bins=50) + scale_x_log10()

#Histogram -> A histogram combines all the life expectancies across all te continents w/o distinguising them.
#Box plots -> A boxplot compares distribution of life expectencies AMONG continents (more than one variables distributions)
#             In boxplot 2 aestetic attributes. x=continents(Var.1) y=lifeexpectency(Var2 WHICH we are comparing)
gapminder_1952 <- gapminder %>%
  filter(year == 1952)
# Create a boxplot comparing gdpPercap among continents
ggplot(gapminder_1952, aes(x=continent, y=gdpPercap)) + geom_boxplot() + scale_y_log10()

##=======##=======##=======##=======##=======##=======##=======##=======##=======##=======#
#Adding titles and Labels to the ggplot graphs
##=======##=======##=======##=======##=======##=======##=======##=======##=======##=======#
names(gapminder)        #To find column names in a dataset
names(gapminder)[2]     #To find name of a Particular column in dataset
 
ggplot(gapminder_1952, aes(x=continent, y=gdpPercap)) + geom_boxplot() + scale_y_log10() +
  labs(title = "Comparing GDP per capita across continents",
       subtitle = "Total Five Continents", 
       y= "GDP per Capita", x= "Continents",
       caption = "Box Plot for GDP per capita across continents") +
  theme(plot.title = element_text(hjust = 0.5))
