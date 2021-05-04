#First R code
"Hello, you!"

#integer
a <- 3L
typeof(a)

#double
b <- 2.0
typeof(b)

#complex
c <- 1 + 0i
typeof(c)

#character
d <- "hi"
typeof(d)

#logical
e <- T
typeof(e)

f <- FALSE
typeof(f) 


#subtraction
var1 <- 2
var2 <- 3

result1 <- var1 - var2
result1

#multiply
result2 <- var1 * var2
result2

root <- sqrt(var1)
root

#paste
greeting <- "Hallo"
name <- "Larissa"
message <- paste(greeting, name)
message


#logical operation
#==
#!=
#>
#<
#>=
#<=
#!
#&
#|
#isTRUE(x)

4 < 5
5 == 7
9 >= 8

result1 <- 4 < 5
result1
typeof(result1)

result2 <- !(5 == 5)
result2

isTRUE(result2)

result1 | result2
result1 & result2


#while loop

counter <- 0
while(counter<100){
  print(counter)
  counter <- counter + 1
}


#for loop

for (i in 3:10){
  print("Hi")
}


#if statement
rm(var1)
var1 <- 29L
if(var1 < 18){
  print("Not allowed to drink alcohol")
} else if(var1 <= 25){
  print("Allowed to drink alcohol but identification card need to be checked")
} else{
  print("Allowed to drink")
}

#norm distribution
rnorm(1)


#vector
a <- c(1, 20, 30, 2, 5)
a
is.numeric(a)
is.integer(a)
is.double(a)

b <- c(1L, 20L, 30L, 2L, 5L)
b
is.numeric(b)
is.integer(b)
is.double(b)

c <- c("a", "What", "J!")
c
is.character(c)
is.numeric(c)

#seq() --generate a sequence
#rep() --generate replicate

V1 <- seq(1, 15)
V1

V2 <- seq(1, 15, 3)
V2

V3 <- rep(V2, 3)
V3

rep(2, 20)
rep("Yes", 4)


#square bracket
V <- c("a", "b", "c", "d", "e")

V[1]
V[2]
V[5]
V[1:3]
V[3:5]
V[-1]
V[-3]
V[c(1, 3, 5)]
V[c(2, 4)]
V[c(-1, -2)]
V[c(-2:-4)]




#vector loop
x <- rnorm(5)
#conventional programming loop
for(i in 1:5){
  print(x[i])
}

#R-specific programming loop
for(j in x){
  print(j)
}


N <- 100
a <- rnorm(N)
b <- rnorm(N)

#vectorized approach
c <- a * b

#de-vectorized approach
d <- rep(NA, N)
for(i in 1:N){
  d[i] <- a[i] * b[i]
}


#function
#? help function
#?rnorm()
rnorm(5, mean=10, sd=3)

x <- c("a","b","c")
seq(from=1,to=100,by=10)
seq(from=1, to=100, length.out=19)
seq(from=1, to=100, along.with=x)

rep("hi", times=10)
rep(x, each=4)
rep(5:7, each=4)


install.packages("ggplot2")
#activate packages
library(ggplot2)
?qplot()
?diamonds

qplot(data=diamonds, carat, price, colour=clarity, facets=.~clarity)


#matrix/matrices
#matrix()
#rbind()
#cbind()

my.data <- 1:30
my.data

A <- matrix(my.data, 3, 10)
A
A[3,8]

B <- matrix(my.data, 3, 10, byrow=T)
B

v1 <- c("a", "f", "g")
v2 <- c("d", "d", "w")
v3 <- c(1, 2, 3)
M <- rbind(v1, v2, v3)
M

N <- cbind(v1, v2, v3)
N


#matrix name

#named vectors
Charlie <- 1:5
Charlie

names(Charlie) <- c("a", "b", "c", "d", "e")
Charlie
Charlie["b"]
names(Charlie)

#clear names
names(Charlie) <- NULL
Charlie

#matrix name dimension
score.vec <- rep(c("90","66","85"),each=3)
score.vec

score.data <- matrix(score.vec, 3, 3)
score.data

colnames(score.data) <- c("math", "English", "art")
rownames(score.data) <- c("Martin", "Jan", "Ben")
score.data

score.data["Martin", "English"] <- 10
score.data

colnames(score.data) <- NULL
score.data



#matplot
?matplot
matplot(t(FieldGoalAttempts/Games),type="b",pch =7:11, col=c(1:4,6))
legend("topright", inset=0.02, legend=Players, col=c(1:4,6), pch=7:11,horiz=F)


#subsetting
Salary
Salary[1:4,2:3]
Salary[c(1,10),c(2,7)]
Salary[1,,drop=F]
Salary[4,4,drop=F]

#visualizing subset
data.subset <- Salary[2,,drop=F]
data.subset
matplot(t(data.subset), type="b", pch= 7:11, col=c(1:4,6))
legend("topright", inset=0.05,legend=Players[2], col=c(1:4,6),pch=7:11,horiz=F)


#creating function

myplot <- function(data, rows=1:5){
  data.subset <- data[rows,, drop=F]
  matplot( t(data.subset) ,type= "b", pch= 7:11, col=c(1:6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:6), pch= 7:11, horiz=F)
}

myplot(Games, 1:3)




#import dataset

#method 1: Select The File Manually
stats <- read.csv(file.choose())
stats

#method 2: Set WD and Read Data
getwd()

#Windows:
setwd("C:\\Users\\XINAN\\Desktop\\R")

#Mac
setwd("/Users/xinan/Documents/program/R")
getwd()

rm(stats)
stats <- read.csv("DemographicData.csv")
stats


# explore the dataset
nrow(stats)
ncol(stats)
head(stats)
head(stats, n=10)
tail(stats)
tail(stats, n=11)
#structure of the dataframe
str(stats) 

summary(stats)


#using the $ sign
head(stats)

# two equivalent methods
stats$Birth.rate
stats[,"Birth.rate"]

#explore levels
levels(stats$Income.Group)

#---------------------------- Basic Operations with a DF
stats[1:10,] #subsetting
stats[3:9,]
stats[c(4,100),]

#Datafram - colunm and row
is.data.frame(stats[1,])

is.data.frame(stats[,1])
#not a dataframe
stats[,1,drop=F]
is.data.frame(stats[,1,drop=F])

#multiply columns
head(stats)
stats$Birth.rate * stats$Internet.users

#add a column
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
head(stats)

#test of knowledge
stats$xyz <- 1:5
#filled with insufficient lines
head(stats, n=10)

stats$xyz <- 1:4
#error, not a multiper of the number of rows

#-remove a column
stats$MyCalc <- NULL
stats$xyz <- NULL
head(stats)

#-------------Filtering Data Frames
head(stats)
filter <- stats$Internet.users > 60
stats[filter,]

stats[stats$Birth.rate < 10,]
stats[stats$Birth.rate < 10 & stats$Internet.users > 50,]
stats[stats$Income.Group == "High income",]
levels(stats$Income.Group)

stats[stats$Country.Name == "Netherlands",]

#-------Introduction to qplot()
#?qplot
# otherwise install.packages("ggplot2")
#library("ggplot2")
qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3))
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3), colour=I("blue"))
qplot(data=stats, x=Income.Group, y=Birth.rate,geom="boxplot")

#visualizing what we need
qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(5), colour=I("yellow"))
qplot(data=stats, x=Internet.users, y=Birth.rate, colour=Income.Group, size=I(3))


#--------------------creating data frames
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)
head(mydf)
colnames(mydf) <- c("Country", "Code", "Region")
head(mydf)

#alternative
rm(mydf)
mydf <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset, Region=Regions_2012_Dataset )
head(mydf)
tail(mydf)


#------------merging data frames
head(stats)
head(mydf)

merged <- merge(stats, mydf, by.x= "Country.Code", by.y= "Code")
head(merged)

merged$Country <- NULL
str(merged)
tail(merged)


#-----Visualizing with new split
#shape, transparency, title
qplot(data= merged, x=Internet.users, y=Birth.rate, colour=Region, size= I(5), shape=I(18), alpha=I(0.5),
      main = "Internet users vs Birth rate")
