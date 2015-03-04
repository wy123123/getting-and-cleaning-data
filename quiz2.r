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
