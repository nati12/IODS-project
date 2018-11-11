#Data wrangling
#1. 
#Natalia Timofeeva
#/11/2018
#Week 2
#
#2.
data <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)
dim(data)
str(data)
head(data)
summary(data)
#The data has 60 variables with 180 observations. The data is made from students' survey.
#
#3. 
#
library(dplyr)
#
# questions related to deep, surface and strategic learning
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")
#
# select the columns related to deep learning and create column 'deep' by averaging
deep_columns <- select(data, one_of(deep_questions))
data$deep <- rowMeans(deep_columns)
#
# select the columns related to surface learning and create column 'surf' by averaging
surface_columns <- select(data, one_of(surface_questions))
data$surf <- rowMeans(surface_columns)
#
# select the columns related to strategic learning and create column 'stra' by averaging
strategic_columns <- select(data, one_of(strategic_questions))
data$stra <- rowMeans(strategic_columns)
#
# choose a handful of columns to keep
keep_columns <- c("gender","Age","Attitude", "deep", "stra", "surf", "Points")
#
# select the 'keep_columns' to create a new dataset
analysis <- select(data, one_of(keep_columns))
analysis <- filter(analysis, Points > 0)
#
# see the stucture of the new dataset
str(analysis)
#
#4. 
setwd("~/Documents/GitHub/IODS-project/")
write.csv(analysis,"learning2014.csv", row.names = F)
learning2014 <- read.csv("learning2014.csv", header = T , sep = "," )
#
