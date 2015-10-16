library(stringr)

best_editing <- read.csv("data/best_editing.txt", header = FALSE, sep = "\n")
best_editing <- subset(best_editing, V1 != "*\t") # rem *
best_editing <- subset(best_editing, V1 != "FILM EDITING") # rem category
best_editing <- unlist(str_replace_all(best_editing$V1, " --.+", "")) # rem people
year <- 1934:2014
title <- as.character(best_editing[seq(2, length(best_editing), 2)]) # pull titles
best_editing <- data.frame(cbind(year, title))
write.csv(best_editing, file = "data/best_editing.csv")

best_picture <- read.csv("data/best_picture.txt", header = FALSE, sep = "\n")
best_picture <- subset(best_picture, V1 != "*\t")
best_picture <- subset(best_picture, V1 != "BEST PICTURE") 
best_picture <- subset(best_picture, V1 != "OUTSTANDING PRODUCTION")
best_picture <- subset(best_picture, V1 != "BEST MOTION PICTURE")
best_picture <- subset(best_picture, V1 != "OUTSTANDING MOTION PICTURE")
best_picture <- unlist(str_replace_all(best_picture$V1, " --.+", ""))
title <- as.character(best_picture[seq(2, length(best_picture), 2)])
best_picture <- data.frame(year, title)
write.csv(best_picture, file = "data/best_picture.csv")

best_editing_picture <- data.frame(cbind(best_editing, best_picture))
best_editing_picture$year.1 <- NULL
colnames(best_editing_picture) <- c("Year", "Best_Editing", "Best_Picture")
write.csv(best_editing_picture, file = "data/best_editing_picture.csv")