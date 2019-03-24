setwd("C:/Users/ASUS/Desktop/crawler")
install.packages("rvest")
library(rvest)
install.packages("magrittr")
library(magrittr)

imdb<-"https://www.imdb.com/chart/top?ref_=nv_wl_img_3"
imdbweb<-read_html(imdb,encoding = "UTF-8")

#這邊會發現抓下來的電影都有多一筆空的列
imdb_movie<-imdbweb%>%html_nodes("#main a")%>%html_text()
imdb_movie<-as.data.frame(imdb_movie)
#在這邊要把空格列刪除
imdb_movie<-imdb_movie[imdb_movie!=" "]
#發現還是多兩筆，是第一筆跟最後一筆資料
imdb_movie<-as.data.frame(imdb_movie)
imdb_movie<-imdb_movie[c(2:251),]
imdb_movie
#抓上映年份
imdb_year<-imdbweb%>%html_nodes(".secondaryInfo")%>%html_text()
imdb_year
#抓評價
imdb_rate<-imdbweb%>%html_nodes("strong")%>%html_text()
imdb_rate<-as.data.frame(imdb_rate)
imdb_rate<-imdb_rate[5:254,]

#把所有訊息做成一份表格
imdb_list<-data.frame(name=imdb_movie,year=imdb_year,rate=imdb_rate)
write.csv(imdb_list,file = "imdb_list.csv")

#試看看抓取圖片
imdb_pic<-imdbweb%>%html_nodes(".posterColumn")%>%html_nodes("img")%>%html_attr("src")
head(imdb_pic,10)
#先新增一個資料夾放要照片的
dir.create("C:/Users/ASUS/Desktop/crawler/pic/")
install.packages("downloader")
library(downloader)
#使用for迴圈把所有的照片下載下來
for(i in 1:length(imdb_pic))
{
  download(imdb_pic[i],paste("C:/Users/ASUS/Desktop/crawler/pic/pic",i,".jpg",sep = ""),mode="wb")
  }

