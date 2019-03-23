install.packages("rvest")
library(rvest)
install.packages("magrittr")
library(magrittr)

imdb<-"https://www.imdb.com/chart/top?ref_=nv_wl_img_3"
imdbweb<-read_html(imdb,encoding = "UTF-8")

imdb_movie<-imdbweb%>%html_nodes("#main a")%>%html_text()
imdb_movie
