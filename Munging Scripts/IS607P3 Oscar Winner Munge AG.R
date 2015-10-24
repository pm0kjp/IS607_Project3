library(dplyr)
library(tidyr)
library(stringr)

oscardat <- read.csv("https://raw.githubusercontent.com/mfarris9505/IS607_Project3/master/data/Combo_Oscar.csv", strip.white = TRUE, header=TRUE, sep=",")
oscardat[,3:11] <- lapply(oscardat[,3:11], trimws) #trim fore and aft white spaces (strip.white didn't work very well in read.csv)
oscardat <- oscardat[,2:11] #remove now defunct data key from csv

oscartable <- oscardat %>% #tidy and re-form data for analysis
  gather("won","pictures", 2:10) %>%
  spread(won,won) %>%
  filter(pictures !="NA")

oscartable[,2:11] <- lapply(oscartable[,2:11], as.character) #coerce columns to character so we can...
oscartable[,3:11][oscartable[,3:11] != "NA"] <- 1 #mark winners as 1's
oscartable[,3:11][is.na(oscartable[,3:11])] <- 0 #mark non-winners as 0's

write.csv(oscartable, file = "tidedoscarwinners.csv")

