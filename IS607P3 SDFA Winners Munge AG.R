library(dplyr)
library(tidyr)
library(stringr)

sddat <- read.csv("https://raw.githubusercontent.com/pm0kjp/IS607_Project3/master/data/SDFilmAwards.csv", strip.white = TRUE, header=TRUE, sep=",")

sddat[,1:4] <- lapply(sddat[,1:4], trimws) #trim fore and aft white spaces (strip.white didn't work very well in read.csv)


baftatable <- baftadat %>% #tidy and re-form data for analysis
  gather("best_picture","pictures", 2:3) %>%
  filter(pictures !="NA") %>%
  mutate(best_picture = 1)

write.csv(baftatable, file = "tidybaftabestpicturewinners.csv")

head(sddat)
