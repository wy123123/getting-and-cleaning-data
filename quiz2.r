library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications;
#    Use any URL you would like for the homepage URL (http://github.com is fine)
#    and http://localhost:1410 as the callback url
#
#    Insert your client ID and secret below - if secret is omitted, it will
#    look it up in the GITHUB_CONSUMER_SECRET environmental variable.
myapp <- oauth_app("github", "4e34c3d9a4c43cca0b24","62cbf248b31a7776ef1733af75167bc1b0aa253c")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos")
stop_for_status(req)
a=content(req)

#find the position of the repo
for(i in 1 : 30){
if(a[[i]]$name=="datasharing"){
	print(i)
}
}
#find name of object in the list
name(a[[5]])
a[[5]]$created_at


url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv" 
download.file(url,"C:/Users/Lovebonito/Downloads/reading/getting clearn data/h.csv")
acs=read.csv("C:/Users/Lovebonito/Downloads/reading/getting clearn data/h.csv")
library(sqldf)
sqldf("select pwgtp1 from acs")
sqldf("select pwgtp1 from acs where AGEP < 50")
sqldf("select * from acs where AGEP < 50 and pwgtp1")
sqldf("select * from acs where AGEP < 50")

unique(acs$AGEP)
sqldf("select unique * from acs")
sqldf("select unique AGEP from acs")
sqldf("select AGEP where unique from acs")
sqldf("select distinct AGEP from acs")

#Q4
con=url("http://biostat.jhsph.edu/~jleek/contact.html")
html=readLines(con)
close(con)
nchar(html[c(10,20,30,100)])

#Q5
url="https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(url,"C:/Users/Lovebonito/Downloads/reading/getting clearn data/h.fwf")
dt=read.fwf("C:/Users/Lovebonito/Downloads/reading/getting clearn data/h.fwf",widths=c(12, 7,4, 9,4, 9,4, 9,4),skip=4)
class(dt$V4)
sum(dt$V4)
