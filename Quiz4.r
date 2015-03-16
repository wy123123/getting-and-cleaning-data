url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
file=file.path(getwd(),".d.csv")
download.file(url,file)
dt=read.csv(file)
colnames(dt)
s=strsplit(colnames(dt),split="wgtp")
s[[123]]

url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
file=file.path(getwd(),".d.csv")
download.file(url,file)
dt=read.csv(file,skip=4,nrow=216)
dt=dt[dt$X!="",]
dt$X.4=as.character(dt$X.4)
dt$X.4=gsub(",","",dt$X.4)
dt$X.4=as.numeric(dt$X.4)
mean(dt$X.4,na.rm=T)

table(grepl("United",dt$X.3))

url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
file=file.path(getwd(),"s.csv")
download.file(url,file)
ds=read.csv(file)
dt=merge(dt,ds,all=T,by.x="X",by.y="CountryCode")
dt=dt[1:214,]
table(grepl('June 30',dt$Special.Notes))

install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

amzn$sampleTimes=strftime(sampleTimes, format = "%Y-%m-%d-%a", usetz = FALSE)
y=substr(amzn$sampleTimes,1,4)
d=substr(amzn$sampleTimes,12,14)
table((y=="2012" & d =="Mon")
