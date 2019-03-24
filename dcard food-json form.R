setwd("C:/Users/ASUS/Desktop/crawler")
install.packages("rvest")
library(rvest)
install.packages("magrittr")
library(magrittr)

#來爬Dcard的美食版
dcard_url_food<-"https://www.dcard.tw/f/food/"
dcard_food<-read_html(dcard_url_food,encoding = "UTF-8")

dcard_food_title<-dcard_food%>%html_nodes(".PostEntry_root_V6g0rd")%>%html_nodes(".PostEntry_unread_2U217-")%>%html_text()
dcard_food_title

#這時候發現Dcard沒有頁碼，往下拉到30個標題之後才會自己再跑下一頁的東西
#查看一下dcard的url，發現url預設就是30個標題(limit=30)，而且預設是抓取熱門文章(popular=true)
#此外，可以發現到說dcard是使用json的數據交換格式
#我們要做點小調整，就會有所有的格是跑出來，還是個表格格式呢!!

dcardurl<-"https://www.dcard.tw/_api/forums/"
board<-"relationship"
mainurl<-paste0(dcardurl,board,'/posts?popular=false&limit=100')
install.packages("httr")
library(httr)
install.packages("jsonlite")
library(jsonlite)
options(stringsAsFactors = FALSE)
options(encoding = "UTF-8")
resdata<-fromJSON(mainurl)
