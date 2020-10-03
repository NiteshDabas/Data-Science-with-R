#Data to be read from  Flat files, Excel, Databases, Web, Statistical software

#install.packages("utils")
#install.packages("readr")
#install.packages("data.table")
#install.packages("readxl")
#install.packages("gdata")
#install.packages("XLConnect")

library(utils)
library(readr)
library(data.table)
library(readxl)
library(gdata)
library(rJava)
library(XLConnect)

library(help = "readr") #list all datasets in the package
library(help = "readxl")

data() #shows loaded datasets in R
search() #shows loaded packages in R
dir() #lists all directories
getwd() #To check current working directory
setwd("Desktop/Nitesh/RWorkingDirectory/")

#Setting up path for dataset löocation
path <- file.path("~", "//Desktop//Nitesh//DS-IIML//Study//DataSets", "bank_missing.csv")

#Reading dataset into memory
FirstDataset <- read.csv(path, stringsAsFactors=FALSE)
#check if data has been loaded successfully; Inspect/understand the data
head(FirstDataset)
str(FirstDataset)

dim(FirstDataset) # to ceck dimentions of installed dataset

#Utils package
#Comma seperated files - read.csv() => by default header=TRUE and sep=","
#Tab seperated files - read.delim() => by default header=TRUE and sep="/t"
#Read any tabular file [eg: Forward slash (/) seperated files etc.] - read.table()
# Use "sep=" argument to denote te seperator type ["/" in case file is forward slash seperated]
SameDataset <- read.table(path, header=TRUE, sep = ",", stringsAsFactors = FALSE)
head(SameDataset)

#readr package - outputs a tibble. Strings are not imported as factors by default(no stringsAsFactors attribute required)
#Comma seperated files - read_csv() => Instead of read.csv() in utils package
#Tab seperated files - read_tsv() => Instead of read.delim() in utils package
#Read any tabular file [eg: Forward slash (/) seperated files etc.] => read_delim() => instead of read.table() in utils package
#read_delim() assumes that the first row of dataset contains the column names.
path <- file.path("~", "//Desktop//Nitesh//DS-IIML//Study//DataSets", "bank_missing.csv")
datasetsample <- read_csv(path)
head(datasetsample)

datasetsample <- read_csv(path, col_names = FALSE) #For automatic column names generation(X1,X2 etc.)
head(datasetsample)
# col_names =c("", "", ) #number of columns = number of elements in the vector.
# col_types = "ccddil_" => manually set class of a column c=char(string), d= double, i=integer and l=logical to skip a column.
datasetsampleNewColTypes <- read_csv(path, col_types = "cccccdddddiiiiilllll_") #21column types changed => data changed to NA if not compatible wit column type.
head(datasetsampleNewColTypes)
#datasetsample1 <-read_delim(path, delim = "/")

#skip and n_max combination => to skip n rows and read m columns!! Through skip and n_max you can control which part of your flat file you're actually importing into R.
#skip() => skips number of specified rows in a dataset starting from top(including header row => thus manually specify header with skip() function).
#          skip specifies the number of lines you're ignoring in the flat file before actually starting to import data.
#n_max() => Number of records to be read. specifies the number of lines you're actually importing.
datasample_skip10Rselect15Rows <- read_csv(path, skip = 10, n_max = 15)
head(datasample_skip10Rselect15Rows)

#collector() => Another way of setting the types of the imported columns .
#               col_integer() => the column should be interpreted as an integer
#               col_factor(levels, ordered = FALSE) => the column should be interpreted as a factor with levels.

#data.table package => DFata manipulation with high speed.Function to import data => fread() => [designed for huge files] 
#                      fread() provides default column names to dataset data if column names are absent.
#                      fread() automatically infer column types and seperator
#                      fread() is extremely fast
#                      fread() is improved version of read.table() with faster, convinient and customization options.
freadedDataset <- fread(path)
freadedDataset
dim(freadedDataset)

#R packages to interact with Excel => readxl package
#excel_sheets() => list different sheets
#read_excel() => actually import data sheet(.xls & .xlsx) into R
getwd()
dir() #Lists all the files in wd => has to be location of excel file to be imported.
excel_sheets("HT.xlsx") # Lists all the sheets in HT.xlsx excel.
read_excel("HT.xlsx")   # By default first sheet is read.
read_excel("HT.xlsx", sheet = 7)
exceldata <- read_excel("HT.xlsx", sheet = "RTestSheet")
head(exceldata, n=1)
lapply(excel_sheets("HT.xlsx"), read_excel, path="HT.xlsx")
#col_names and skip are ohter two functions one can use in read_excel() function.

#gdata package: alternative way to read excel: instead of read_excel() function.
exceldatagdatapackage <- read.xls("HT.xlsx", sheet = 7,
                      skip = 2, header = FALSE, stringsAsFactors = FALSE,
                      col.names = FALSE)
exceldatagdatapackage
# Add code to import data from first three sheets in HT.xlsx
path <- "HT.xlsx"
urban_sheet1 <- read.xls(path, sheet = 1, stringsAsFactors = FALSE)
urban_sheet2 <- read.xls(path, sheet = 2, stringsAsFactors = FALSE)
urban_sheet3 <- read.xls(path, sheet = 3, stringsAsFactors = FALSE)
# Extend the cbind() call to include urban_sheet3: urban
urban <- cbind(urban_sheet1, urban_sheet2[-1])
urban <- cbind(urban, urban_sheet3[-1])
# Remove all rows with NAs from urban: urban_clean
urban_clean <- na.omit(urban)
# Print out a summary of urban_clean
summary(urban_clean)

#XLConnect => To load and connect xlsheets into R
# Build connection to urbanpop.xlsx
my_book <- loadWorkbook("HT.xlsx")
# List the sheets in my_book
getSheets(my_book)
# Import the second sheet in my_book
readWorksheet(my_book, "RTestSheet")
createSheet(my_book, name = "NewSheet")
getSheets(my_book)
saveWorkbook(my_book)
