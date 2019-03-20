setwd("C:/Users/ASUS/Desktop/crawler")
#主要做網路爬蟲的套件:rvest
install.packages("rvest")
library(rvest)
install.packages("magrittr")
library(magrittr)

#從apple news的最新消息做練習
appleweb<-"https://tw.appledaily.com/new/realtime/"
applenews<-read_html(appleweb,encoding = "UTF-8")

#抓取新聞的時間
time<-applenews%>%html_nodes("time")%>%html_text()
time

#抓取新聞的title
title<-applenews%>%html_nodes("h1")%>%html_text()
title

#抓取新聞的類別
category<-applenews%>%html_nodes("h2")%>%html_text()
category



