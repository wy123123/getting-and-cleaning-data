#Q.1
#The American Community Survey distributes downloadable data about United States communities. 
#Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here: 
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 
#and load the data into R. The code book, describing the variable names is here: 
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 
#Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 worth 
#of agriculture products. Assign that logical vector to the variable agricultureLogical. 
#Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE. 
#which(agricultureLogical) What are the first 3 values that result?

url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url,"C:/Users/Lovebonito/Downloads/reading/getting clearn data/d.csv")
dt=read.csv("C:/Users/Lovebonito/Downloads/reading/getting clearn data/d.csv")

dt.1=dt[which(!is.na(dt$AGS) & !is.na(dt$ACR)),]
agricultureLogical=F
head(dt.1[which(dt.1$AGS==6 & dt.1$ACR==3),],3)

#Q2
#Using the jpeg package read in the following picture of your instructor into R 
#https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg 
##Use the parameter native=TRUE.
#What are the 30th and 80th quantiles of the resulting data? 
#(some Linux systems may produce an answer 638 different for the 30th quantile)

library(jpeg)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(url,"C:/Users/Lovebonito/Downloads/reading/getting clearn data/s.jpeg")
pic <- readJPEG("C:/Users/Lovebonito/Downloads/reading/getting clearn data/s.jpeg", native = T)
quantile(pic,c(0.3,0.8))

#Question 3
#Load the Gross Domestic Product data for the 190 ranked countries in this data set: 
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
#Load the educational data from this data set: 
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 
#Match the data based on the country shortcode. 
#How many of the IDs match? Sort the data frame in descending order by GDP rank (so United States is last). 
#What is the 13th country in the resulting data frame? 
#Original data sources: 
#http://data.worldbank.org/data-catalog/GDP-ranking-table 
#http://data.worldbank.org/data-catalog/ed-stats
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url,"C:/Users/Lovebonito/Downloads/reading/getting clearn data/s.csv")
url<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url,"C:/Users/Lovebonito/Downloads/reading/getting clearn data/sb.csv")
dt <- read.csv("C:/Users/Lovebonito/Downloads/reading/getting clearn data/s.csv",skip=4)
dt.1 <- read.csv("C:/Users/Lovebonito/Downloads/reading/getting clearn data/sb.csv")

library(data.table)
dt=dt[which(dt$X!=""),]
st <- data.table(merge(dt,dt.1,all=T,by.x="X",by.y="CountryCode"))
st$X.1=as.vector(st$X.1)
st[which(st$X.1=="" & !is.na(st$X.1)),]$X.1=NA
#Q4
sum(!is.na(unique(st$X.1)))
st[order(X.1,decreasing = TRUE),]$X.3[13]
dtt[order(rankingGDP,decreasing = TRUE),]$Long.Name.x[13]
st[,mean(as.numeric(X.1),na.rm=T),by=Income.Group]
mean(as.numeric(st[st$Income.Group=="High income: OECD",]$X.1))
#Q5
library(Hmisc)
st$X.1=cut2(as.numeric(as.character(st$X.1)),g=5)
table(st$X.1,st$Income.Group)


