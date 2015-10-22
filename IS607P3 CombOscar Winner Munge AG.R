library(dplyr)
library(tidyr)
library(stringr)

comboscardat <- read.csv("https://raw.githubusercontent.com/mfarris9505/IS607_Project3/master/data/Oscar_data.csv", strip.white = TRUE, header=TRUE, sep=",")
comboscardat[,2:5] <- lapply(comboscardat[,2:5], trimws) #trim fore and aft white spaces (strip.white didn't work very well in read.csv)
comboscardat <- comboscardat[,2:5] #remove now defunct data key from csv
comboscardat[[2]][comboscardat[[2]] == "MUSIC (Original Song)"] <- "music (song)"
comboscardat[[2]][comboscardat[[2]] == "MUSIC (Original Score)"] <- "music (score)"
comboscardat[[2]][comboscardat[[2]] == "Music (Scoring)"] <- "music (score)"

comboscartab <- comboscardat %>% #tidy and re-form data for analysis
  filter(nchar(Nominee) < 75) %>% #removes special awards, and Borat, unfortunately
  mutate(Award = tolower(Award)) %>%
  distinct() %>%
  arrange(Year, Award, Nominee, desc(Winner)) %>% #sorts yes before no on winner column, where film nominated more than once for award
  distinct(Year, Award, Nominee) %>% #removes the no's
  spread(Award,Winner)

comboscartab[,3:21][comboscartab[,3:21] == "YES"] <- 1 #mark winners as 1's
comboscartab[,3:21][comboscartab[,3:21] == "Yes"] <- 1 #mark winners as 1's
comboscartab[,3:21][comboscartab[,3:21] == "NO"] <- 2 #mark losing nominees as 2's
comboscartab[,3:21][comboscartab[,3:21] == "No"] <- 2 #mark losing nominees as 2's
comboscartab[,3:21][is.na(comboscartab[,3:21])] <- 0 #mark non-nomiees as 0's
head(comboscartab, 10)
write.csv(comboscartab, file = "tidyoscarnoms.csv")
