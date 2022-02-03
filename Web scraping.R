library(rvest)
library(dplyr)


link<- "https://www.imdb.com/chart/top/"
page=read_html(link)
page

name = page %>% html_nodes(".titleColumn a") %>% html_text()
name

year = page %>% html_nodes(".secondaryInfo") %>% html_text()
year

ratings = page %>% html_nodes("strong") %>% html_text()
ratings

movies = data.frame(name,year,ratings)
write.csv(movies, "movies.csv")

View(movies)
