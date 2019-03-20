install.packages("rvest")
library(rvest)
install.packages("magrittr")
library(magrittr)

ettoday<-"https://www.ettoday.net/news/news-list.htm"
ettoday_news<-read_html(ettoday,encoding = "UTF-8")

ettoday_title<-ettoday_news%>%html_nodes(".part_list_2 h3")%>%html_text()
ettoday_title

ettoday_time<-ettoday_news%>%html_nodes(".date")%>%html_text()
ettoday_time

ettoday_text<-ettoday_news%>%html_nodes(".part_list_2 a")%>%html_text()
ettoday_text

ettoday_crawler<-data.frame(time=ettoday_time,title=ettoday_text)
