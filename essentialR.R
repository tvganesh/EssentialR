#############################################################################
#
# Essential R
# Hit the ground running - A quick tutorial of  R programming
# Author: Tinniam V Ganesh
# Date : 15/3/2017
# Email: tvganesh.85@gmail.com 
# Blog: https://gigadom.wordpress.com/
#
#############################################################################
##A) Variables
##1. Main variable types
# a) Character
# b) numeric

x<- "Hello world" # Can also use x= "Hello World"
x
class(x)
y<-2.5
y
class(y)


#2.  Vectors - All elements of same type
myvector <- c(1,2,4,5,8,10,12)
myvector
myvector <- 2:12
myvector
charVector <- c("one","two","three") # character vector
charVector

#Display the variable
myvector

# Check the class
class(myvector)

# Creating vectors with sequences
myvector <- seq(5,50,by=5)
myvector

# Get help on any topic using '?'
?seq

# or
help(seq)

# Create a sequence between 6 & 43 with a period length of 7
seq(6,43,by=7)

# This is useful when we want 7 equal intervals between 6 & 43
seq(6,43,length=7)

###3.  Matrices
# generates 5 x 4 numeric matrix
y<-matrix(1:20, nrow=5,ncol=4)
class(y)


###4. Lists - Elements can be dissimilar
w <- list(name="Fred", mynumbers=charVector, mymatrix=y, age=5.3)
w

##5. Data frames
#A data frame is more general than a matrix, in that different columns can have different mode
d <- c(1,2,3,4)
e <- c("red", "white", "red", NA)
f <- c(TRUE,TRUE,TRUE,FALSE)
mydataframe <- data.frame(d,e,f)
names(mydataframe) <- c("ID","Color","Passed") # variable names
mydataframe
class(mydataframe)


#B)
#############################################################################################
#
## Subsetting
#
#############################################################################################
#1. Subsetting vectors
myvector <- seq(2,20,by=2)
myvector

#Get elements 3 to 7 of myvector
myvector[4]
# Range of elements
s <- myvector[3:7]
s

# Subset based on a condition
b <- myvector>10
a <- myvector[b]
#Combine both in a single statement
a <- myvector[ myvector>10]

# Subset based on substring
m <- c("about","aboard","board","bus","cat","abandon")
a <- grep("ab",m)
# String with "ab"
containsAB <- m[a]
#Or
containsAB <- m[grep("ab",m)]
containsAB

# Arithmetic operations on vectors
myvector1 <- seq(3,30,by=3)
myvector1

# Addition of 2 vectors
a <- myvector + myvector1
a
# Product
b <- myvector * myvector1
b
# Raising element to a power
myvector^3


#2.  Accessing elements in matrix
y<-matrix(1:20, nrow=5,ncol=4)
y
y[2,3]

A <- matrix(1:9,nrow=3,ncol=3)

B <- matrix(seq(5,10,length=9),nrow=3,ncol=3)
#### Matrix operations
# C = A*B                    # Element wise multiplication
# C = A %*% B                # Matrix multiplication

#3. Subsetting lists
w <- list(name="Fred", mynumbers=charVector, mymatrix=y, age=5.3)
w

# To access an object in a list , use [[]]e.g
w[[2]]
# You can further access the elements in the object depending on the type
a = w[[2]] #a is a vector
a[2]
b=w[[3]]
b
#
b[2,3]

#4. Subsetting dataframes
# R comes with already available data frames with which you can do any data science with
data()
attach(mtcars)

head(mtcars,3)
# We can subset like matrices
mtcars[2:5,3:6]

mtcars[,3:7]
# There are other ways of hanlding dataframes which will be shown below
#####################################################################################
#C. A list of operations commonly used
# Get the current working directory
getwd()

#Set the working directory. Note the forward slash
setwd("/home/rstudio/R")
getwd()
setwd("..")

#Check the directory. Also possible to use Session -> Set Working Directory-><dir>
getwd()

# Show objects
ls()

# Remove  object
rm("x")

#Remove all objects
rm(list=ls())

#Show contents of dir
dir()

# Other useful commands
#dir.create("testdir")                   # Create a directory
#file.create("myTest.R")                 # Create a file
#file.exists("mytest.R")                 # Check if file exists
#file.rename("mytest.R","mytest2.R")     # Rename a file

# To print an object
myvector <- seq(2,20,by=2)
myvector
myvector
print(myvector)

# For loops
for(i in 1:10){
  print(i*5)
}

for(i in seq_along(myvector)){
  print(myvector[i])
}

# In R avoid for loops if possible. Try to use the while vector using sapply,lapply,tapply
# instead of for loops. for loops are very performance intensive to vector operations


### R functions. To create a function
# This is how a function is defined
product <- function(a, b){
  c <- a*b
  c
}

product(7,12)
product(13,18)

##########################################################################################

### Accessing elements in a dataframe
# There are several datasets available that comes with R
# The Dataframe is a tabular form of data with many rows and columns. The
# type of data can vary from column to column but are the same in each column
data()
class(iris)

# Create a new data frame from iris. Iris is a small plant.
# See https://en.wikipedia.org/wiki/Iris_(plant)
df <- iris
#or we can use iris dataframe as is

# Check the size of the data
dim(iris)

#Check the 1st few rows of the data frame
head(iris)

# A more useful command to check the type of a dataframe is***
str(iris)

# Check the column names of iris
colnames(iris) or # names(iris)

``
#Check the class***
sapply(iris,class)

# Get a feel of the data
summary(iris)
str(iris)

# Inspect the data. Display top 6 and bottom 6 of the dataframe
head(iris,6)
tail(iris,6)

#Subset data
#1. Display 1-6 rows and 2-4 columns
iris[1:6,2:4]

#2. Display all rows  for columns 1:3
iris[,1:3]

#3. Display all columns for rows 1:5
iris[1:5,]

#Column names
colnames(iris)

# Rename columns, if needed, to something more is easy to refer to
colnames(iris) <- c("lengthOfSepal","widthOfSepal","lengthOfPetal","widthOfPetal","Species")
colnames(iris)


View(iris)

# Other ways of subsetting the data


iris$Species

# Subset all rows which have "setosa" as the Species
#Also note that to refer to a column we need to use the '$' symbol
a <- iris$Species == "setosa"

# This gives the rows for which species is 'setosa'
a


#Subset these rows. The "," indicates include all colums for these rows
b <- iris[a,]

dim(b)
b

colnames(b)

b$widthOfSepal
# Compute the mean
meanSepal <- mean(b$widthOfSepal)
meanSepal

# A useful function is sapply which can compute a function across a list
m <- sapply(b[1:4],mean)
m


#Plot the values of any columm. The box plot is useful
?boxplot

boxplot(b$lengthOfSepal,main="Length of Sepal")

# To get all 4 plots in a 2 x 2 matrix setup.Draw all 4 plots
par(mfrow=c(2,2)) # Set 2 rows x 2 columns
par(mar=c(4,4,2,2)) # Set the margins
boxplot(b$lengthOfSepal,main="Length of Sepal")
boxplot(b$widthOfSepal,main="Width of Sepal")
boxplot(b$lengthOfPetal,main="Length of Petal")
boxplot(b$widthOfPetal,main="Width of Petal")

# Reset the display with the following call. Otherwise you will get a 2 x 2 plots
dev.off()

# A useful function to to check how data looks is the pairs function
# This function will take pairs of columns and do a scatter plot.
pairs(iris)


########################################Cleaning data ##############################################

# The problem with the IRIS data set is that it is neat and tidy.
# Lets look at some real world data

# The following call does not convert strings in the data frame as factors
# Also remove records which do not have values 'na.strings" where the
# NA (not available) strings can be "NA" or "-"
#Check the help of read.csv
?read.csv
tendulkar= read.csv("./tendulkar.csv",stringsAsFactors = FALSE,na.strings=c(NA,"-"))
summary(tendulkar)
str(tendulkar)
colnames(tendulkar)

#Display top 5 and bottom 5 rows
head(tendulkar)
tail(tendulkar)

sapply(tendulkar,class)

# View the data frame
View(tendulkar)


# Real world data will require a lot of cleaning before you can use it
a <- tendulkar$Runs != "DNB"
tendulkar <- tendulkar[a,]
dim(tendulkar)

# Remove rows with 'TDNB'
c <- tendulkar$Runs != "TDNB"
tendulkar <- tendulkar[c,]

# Remove rows with absent
d <- tendulkar$Runs != "absent"
tendulkar <- tendulkar[d,]
dim(tendulkar)

# Remove the "* indicating not out
tendulkar$Runs <- as.numeric(gsub("\\*","",tendulkar$Runs))
View(tendulkar)
dim(tendulkar)

# Another useful function for cleaning data is complete.cases
?complete.cases
# Check if all rows are complete and have values in all columns
c <- complete.cases(tendulkar)
c
# Check the number of rows in th dataframe
length(c)

# Determine the number of TRUE's
sum(c)

#Subset the rows which are complete
tendulkar <- tendulkar[c,]
dim(tendulkar)

# Now the data is clean
head(tendulkar,10)


########################################Plotting#############################################
### Base plot
# Do some base plotting
plot(tendulkar$Runs,as.numeric(tendulkar$BF))
#Add title and x and y labels
plot(tendulkar$Runs,as.numeric(tendulkar$BF), pch=18, main="Tendulkar Runs scored vs Balls Faced",
     xlab="Balls Faced", ylab='Runs')


# Compute and  plot a linear regression lime
l <-lm(tendulkar$BF~tendulkar$Runs)
abline(l,lty=5,lwd=3,col="blue")

#Plot the histogram of runs for Tendulkar
hist(tendulkar$Runs, main="Tendulkar's frequency of runs vs  run ranges",
     xlab="Runs")


# A look package dplyr. One of the most useful package for manipulating data in
# data frames
#install.packages("dplyr")

#Call the library to the package to include dplyr
library(dplyr)

# Select columns
colnames(tendulkar)

# Key functions select, filter, arrange, pipe,mutate, summarise

# Subset specific columns by name of column. Note there is no $ sign or quotes to refer to
# columns
# Note there is no need for the $ to reference column names.
df1 <- select(tendulkar, Runs,Mins,BF)
head(df1)

# This can be also written as below, where %>% is known as the 'pipe'
df1 <- tendulkar %>% select(Runs,Mins,BF)
df1

#Subset rows where the RUns are > 50 and less than 101
df2 <- filter(tendulkar,Runs>50 & Runs < 101)
head(df2,5)
# Also as
# df2 <- tendulkar %>% filter(Runs>50 & Runs < 101)

# There are more interesting conditions with which you can filter and select rows
# columns. Check with ?select & ?filter

# Use the arrange function to arrange columns in descending order of Runs
descRuns <- arrange(tendulkar,desc(Runs))
head(descRuns)


# The Pipe function is extremely useful in dplyr
a <- group_by(tendulkar, Ground)
head(a)

# The following command in a single line does the follwoing
#1. Uses the data frame tendulkar (2nd parameter)
#2. Groups the runs scored by ground
#3. Computes the mean runs in each group
#4. Arranges in descending order

tendulkar1 <- tendulkar %>% group_by(Ground) %>% summarise(meanRuns= mean(Runs)) %>%
  arrange(desc(meanRuns))


# Plot the result as a barplot
barplot(tendulkar1$meanRuns,names=tendulkar1$Ground,las=2,ylab="Average Runs",
        col=rainbow(length(tendulkar1$meanRuns)),main="Tendulkar's average runs in Grounds",cex.names=0.8)


#### Grammar of Graphics
#### ggplot2
library(ggplot2)

p <- ggplot(tendulkar) + aes(x=Runs,y=BF) + geom_point()
p <- p + xlab("Runs") + ylab("Balls Faced") + ggtitle("Tendulkar - Runs vs Balls Faced")
p

ggplot(tendulkar,aes(x=Runs,y=BF))+ geom_point() +
  xlab("Runs") + ylab("Balls Faced") + ggtitle("Tendulkar - Runs vs Balls Faced")

# Fir a smoothed regression line
ggplot(tendulkar,aes(x=Runs,y=BF))+ geom_point() + geom_smooth(method="loess") +
  xlab("Runs") + ylab("Balls Faced") + ggtitle("Tendulkar - Runs vs Balls Faced") +
  theme(plot.title = element_text(size=16, face="bold",hjust=0.5))


## Going back to the Iris example
names(iris)
setosa <- iris %>% filter(Species == "setosa")
pairs(setosa)
a <- setosa %>% select(lengthOfSepal,widthOfSepal)
plot(a$lengthOfSepal,a$widthOfSepal,xlab="Length of Sepal",ylab="Width of Sepal",
     main="Length vs Width of Sepal of Setosa")
l <-lm(a$widthOfSepal~a$lengthOfSepal)
abline(l,lty=5,lwd=3,col="blue")


# This can be with ggplot as follows for all species
ggplot(iris,aes(x=lengthOfSepal,y=widthOfSepal,colours=Species)) + geom_point() +
  geom_smooth(method="loess") + facet_wrap(~Species) +
  xlab("Length of Sepal") + ylab("Width of Sepal")


# Package lubridate.
# This package is useful for handling date files in most formats
#dmy,ymd,dmyhhmmss,dd-mm-yy hh:mm:ss
#install.packages9"lubridate")
library(lubridate)
start<-ymd("20110604")
day(start)
month(start)
year(start)

end=mdy("08-04-2011")
timespan <- end-start
timespan
c <- end+5
c

# There is a  lot more that can be done with lubridate
head(tendulkar,5)

# Creating a moving average of runs for Tendulkar with ggplot
runs <- tendulkar %>% select(Runs,Start.Date)
runs$Start.Date <- dmy(runs$Start.Date)
head(runs)
ggplot(runs,aes(x=Start.Date,y=Runs)) + geom_line(colour="darkgrey") +
  geom_smooth(method="loess") + ggtitle("Tendulkar's moving average of runs") +
  theme(plot.title = element_text(size=16, face="bold",hjust=0.5))

#######################Package quantmod  ###
#install.packages("quantmod")
library(quantmod)


toCurrency <- c("INR","SGD","JPY","NZD")
fromcurrency <- c("USD")
b<- getQuote(paste0(fromcurrency, toCurrency, "=X"))
xchg <- b$Last
xchg


