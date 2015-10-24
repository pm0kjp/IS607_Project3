library(dplyr)
library(tidyr)
library(stringr)

baftadat <- read.csv("https://raw.githubusercontent.com/karenweigandt/IS607/master/BAFTA.csv", strip.white = TRUE, header=TRUE, sep=",")
str(baftadat)
head(baftadat)
baftadat
baftadat[,2:3] <- lapply(baftadat[,2:3], trimws) #trim fore and aft white spaces (strip.white didn't work very well in read.csv)
baftadat$dblwinner[baftadat$Winner2 != "NA"] <- 1
baftadat$dblwinner[is.na(baftadat$Winner2)] <- 0

baftatable <- baftadat %>% #tidy and re-form data for analysis
  gather("best_picture","pictures", 2:3) %>%
  filter(pictures !="NA") %>%
  mutate(best_picture = 1)

write.csv(baftatable, file = "tidybaftabestpicturewinners.csv")
