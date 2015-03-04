#Q1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile="C:/Users/Lovebonito/Downloads/data.csv")
dt<-read.csv("C:/Users/Lovebonito/Downloads/data.csv")
table(dt$VAL>23)

#Q3
library(xlsx)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx ",destfile="C:/Users/Lovebonito/Downloads/data.xlsx",mode='wb')
col <- 7:15
row <- 18:23
dt <- read.xlsx("C:/Users/Lovebonito/Downloads/data.xlsx",sheetIndex=1);head(dt)
dt <- read.xlsx("C:/Users/Lovebonito/Downloads/data.xlsx",sheetIndex=1,
                colIndex=col,rowIndex=row)
sum(dt$Zip*dt$Ext,na.rm=T) 

#Q4
library(XML)
library(RCurl)
library(data.table)
URL<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
dt<-xmlTreeParse(URL,useInternal=TRUE)
rootNode=xmlRoot(dt)
table(xpathSApply(rootNode,"//zipcode",xmlValue)=="21231")

#Q5
URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(URL,destfile="C:/Users/Lovebonito/Downloads/data.CSV")
DT<-fread("C:/Users/Lovebonito/Downloads/data.CSV")

system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))

system.time(mean(DT$pwgtp15,by=DT$SEX))

system.time((rowMeans(DT)[DT$SEX==1]))
system.time( rowMeans(DT)[DT$SEX==2])

system.time(DT[,mean(pwgtp15),by=SEX])

system.time(mean(DT[DT$SEX==1,]$pwgtp15))
system.time(mean(DT[DT$SEX==2,]$pwgtp15))

system.time(tapply(DT$pwgtp15,DT$SEX,mean))
