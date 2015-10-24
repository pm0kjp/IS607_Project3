library(dplyr)
library(tidyr)
library(stringr)

sddat <- read.csv("C:/Users/Andrew/Documents/GitHub/IS607_Project3/data/SDFilmAwards.csv", strip.white = TRUE, header=TRUE, sep=",")
sddat[,1:4] <- lapply(sddat[,1:4], trimws) #trim fore and aft white spaces (strip.white didn't work very well in read.csv)

sddat
sdtable <- sddat %>% #tidy and re-form data for analysis
  select(Award, Year, Movie) %>%
  spread(Award, Award) %>%
  separate(Year, c("Year", "Tie"), 5) %>%
  select(Year, Movie, `Best Actor`, `Best Actress`, `Best Film`, Cinemtography, Directors, Editing)

sdtable[,3:8][sdtable[,3:8] != "NA"] <- 1 #mark winners as 1's
sdtable[,3:8][is.na(sdtable[,3:8])] <- 0 #mark non-winners as 0's
colnames(sdtable) <- c("year", "movie", "best_actor", "best_actress", "best_film", "best_cinematography", "best_director", "best_editing")

write.csv(sdtable, file = "tidysdfcsawinners.csv")

