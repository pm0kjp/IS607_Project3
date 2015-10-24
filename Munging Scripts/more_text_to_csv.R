library(stringr)
library(dplyr)
setwd(C:/Users/Matts42/Documents/IS607)

best_Song <- read.csv("data/Song.txt", header = FALSE, sep = "\n")
best_Song <- subset(best_Song, V1 != "*\t") # rem *
best_Song <- subset(best_Song, V1 != "MUSIC (Song)") #rem category
best_Song <- subset(best_Song, V1 != "MUSIC (Original Song)") #rem category
best_Song <- subset(best_Song, V1 != "MUSIC (Song--Original for the Picture)") #rem category
best_Song <- str_replace_all(best_Song$V1, "--.+", "") # rem part
best_Song <- str_replace_all(best_Song, ".+from", "") # rem part
year <- 1934:2014
title <- as.character(best_Song[seq(2,length(best_Song), 2)]) # pull titles
best_Song <- data.frame(year, title)
names(best_Song) <- c("Year", "Best_Song")

best_Sound <- read.csv("data/Sound.txt", header = FALSE, sep = "\n")
best_Sound <- subset(best_Sound, V1 != "*\t") # rem *
best_Sound <- subset(best_Sound, V1 != "SOUND RECORDING") #rem category
best_Sound <- subset(best_Sound, V1 != "SOUND") #rem category
best_Sound <- subset(best_Sound, V1 != "SOUND MIXING") #rem category
best_Sound <- str_replace_all(best_Sound$V1, "--.+", "") # rem part
year <- 1934:2014
title <- as.character(best_Sound[seq(2,length(best_Sound), 2)]) # pull titles
best_Sound <- data.frame(year, title)
names(best_Sound) <- c("Year", "Best_Sound")

best_directing <- read.csv("data/Directing.txt", header = FALSE, sep = "\n")
best_directing <- subset(best_directing, V1 != "*\t") # rem *
best_directing <- subset(best_directing, V1 != "DIRECTING") #rem category
best_directing <- str_replace_all(best_directing$V1, "--.+", "") # rem part
year <- 1934:2014
title <- as.character(best_directing[seq(2,length(best_directing), 2)]) # pull titles
best_directing <- data.frame(year, title)
names(best_directing) <- c("Year", "Best_Directing")

best_support_actress <- read.csv("data/Supporting Actress.txt", header = FALSE, sep = "\n")
best_support_actress <- subset(best_support_actress, V1 != "*\t") # rem *
best_support_actress <- subset(best_support_actress, V1 != "ACTRESS IN A SUPPORTING ROLE") #rem category
best_support_actress <- str_replace_all(best_support_actress$V1, ".+--", "") # rem part
best_support_actress <- str_replace_all(best_support_actress, "\\{.+", "") # rem part
year <- 1936:2014
title <- as.character(best_support_actress[seq(2,length(best_support_actress), 2)]) # pull titles
best_support_actress <- data.frame(year, title)
names(best_support_actress) <- c("Year", "Best_Supporting_Actress")

best_support_actor <- read.csv("data/Supporting Actor.txt", header = FALSE, sep = "\n")
best_support_actor <- subset(best_support_actor, V1 != "*\t") # rem *
best_support_actor <- subset(best_support_actor, V1 != "ACTOR IN A SUPPORTING ROLE") #rem category
best_support_actor <- str_replace_all(best_support_actor$V1, ".+--", "") # rem part
best_support_actor <- str_replace_all(best_support_actor, "\\{.+", "") # rem part
year <- 1936:2014
title <- as.character(best_support_actor[seq(2,length(best_support_actor), 2)]) # pull titles
best_support_actor <- data.frame(year, title)
names(best_support_actor) <- c("Year", "Best_Supporting_Actor")

best_actress <- read.csv("data/Actress.txt", header = FALSE, sep = "\n")
best_actress <- subset(best_actress, V1 != "*\t") # rem *
best_actress <- subset(best_actress, V1 != "ACTRESS") # rem category
best_actress <- subset(best_actress, V1 != "ACTRESS IN A LEADING ROLE") #rem category
best_actress <- str_replace_all(best_actress$V1, ".+--", "") # rem part
best_actress <- str_replace_all(best_actress, "\\{.+", "") # rem part
year <- 1934:2014
title <- as.character(best_actress[seq(2,length(best_actress), 2)]) # pull titles
best_actress <- data.frame(year, title)
names(best_actress) <- c("Year", "Best_Actress")

best_actor <- read.csv("data/Actor.txt", header = FALSE, sep = "\n")
best_actor <- subset(best_actor, V1 != "*\t") # rem *
best_actor <- subset(best_actor, V1 != "ACTOR") # rem category
best_actor <- subset(best_actor, V1 != "ACTOR IN A LEADING ROLE") #rem category
best_actor <- str_replace_all(best_actor$V1, ".+--", "") # rem partbest_actor
best_actor <- str_replace_all(best_actor, "\\{.+", "") # rem part
year <- 1934:2014
title <- as.character(best_actor[seq(2,length(best_actor), 2)]) # pull titles
best_actor <- data.frame(year, title)
names(best_actor) <- c("Year", "Best_Actor")

best_editing <- read.csv("data/best_editing.txt", header = FALSE, sep = "\n")
best_editing <- subset(best_editing, V1 != "*\t") # rem *
best_editing <- subset(best_editing, V1 != "FILM EDITING") # rem category
best_editing <- unlist(str_replace_all(best_editing$V1, " --.+", "")) # rem people
year <- 1934:2014
title <- as.character(best_editing[seq(2, length(best_editing), 2)]) # pull titles
best_editing <- data.frame(year, title)
names(best_editing) <- c("Year", "Best_Editing")


best_picture <- read.csv("data/best_picture.txt", header = FALSE, sep = "\n")
best_picture <- subset(best_picture, V1 != "*\t")
best_picture <- subset(best_picture, V1 != "BEST PICTURE") 
best_picture <- subset(best_picture, V1 != "OUTSTANDING PRODUCTION")
best_picture <- subset(best_picture, V1 != "BEST MOTION PICTURE")
best_picture <- subset(best_picture, V1 != "OUTSTANDING MOTION PICTURE")
best_picture <- unlist(str_replace_all(best_picture$V1, " --.+", ""))
year <- 1934:2014
title <- as.character(best_picture[seq(2, length(best_picture), 2)])
best_picture <- data.frame(year, title)
names(best_picture) <- c("Year", "Best_Picture")


combo_oscar_data <- best_picture
combo_oscar_data <- left_join(combo_oscar_data,best_editing, by="Year",copy = TRUE)
combo_oscar_data <- left_join(combo_oscar_data,best_directing, by="Year",copy = TRUE)
combo_oscar_data <- left_join(combo_oscar_data,best_actor, by="Year",copy = TRUE)
combo_oscar_data <- left_join(combo_oscar_data,best_support_actor, by="Year",copy = TRUE)
combo_oscar_data <- left_join(combo_oscar_data,best_actress, by="Year")
combo_oscar_data <- left_join(combo_oscar_data,best_support_actress, by="Year",copy = TRUE)
combo_oscar_data <- left_join(combo_oscar_data,best_Sound, by="Year",copy = TRUE)
combo_oscar_data <- left_join(combo_oscar_data,best_Song, by="Year",copy = TRUE)

write.csv(combo_oscar_data, "data\combo_data")