library(stringr)
library(rvest)
library(robotstxt)

link <- 'https://www.imdb.com/list/ls036417104/'

browser<- read_html(link)
View(browser)

name_of_the_Anime <- browser %>% html_nodes('.lister-item-header a') %>% html_text()
View(name_of_the_Anime
     )
Year_of_publishing <- browser %>% html_nodes('.text-muted.unbold') %>% html_text()
View(Year_of_publishing)

Duration <- browser %>% html_nodes('.runtime') %>% html_text()
View(Duration)

Genre <- browser %>% html_nodes('.genre') %>% html_text()
View(Genre)

Votings <- browser %>% html_nodes('.text-small+ .text-small') %>% html_text()
View(Votings)

stars <- browser %>% html_nodes('.text-small:nth-child(5)') %>% html_text()
View(stars)

description <- browser %>% html_nodes('.ipl-rating-widget+ p') %>% html_text()
View(description)

Anime_description=data.frame(name_of_the_Anime,Genre,Votings,stars,description)

View(Anime_description)

write.csv(Anime_description,"Top 50 anime.csv")

str(Anime_description)
