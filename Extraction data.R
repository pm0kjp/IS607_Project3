library(tidyr)
library(stringr)
library(dplyr)
library(RCurl)
library(magrittr)
un_2010 <-getURL("https://raw.githubusercontent.com/mfarris9505/IS607_Project3/master/data/cleaner_2010.csv")
un_2014 <- getURL("https://raw.githubusercontent.com/mfarris9505/IS607_Project3/master/data/cleaner_2014.csv")
unclean_2014 <- read.csv(textConnection(un_2014), header = TRUE, strip.white = TRUE)
unclean_2010 <- read.csv(textConnection(un_2010), header = TRUE, strip.white = TRUE)

#Removing excessive rows
unclean_2014$V6<- NULL
unclean_2014$V5<- NULL
unclean_2014$X<- NULL
names(unclean_2014)<-c("Year","Award","Nominee","Winner")

#Cleaning Columns 2014
unclean_2014$Year <- str_replace(unclean_2014$Year, "\\(.*\\)", "")
unclean_2014$Nominee <- str_replace_all(unclean_2014$Nominee, "\\{.*\\}", "")
unclean_2014$Nominee <- str_split_fixed(unclean_2014$Nominee, "--",2)
unclean_2014$Nominee2<-unclean_2014$Nominee[,2]
unclean_2014$Nominee1<-unclean_2014$Nominee[,1]
head(unclean_2014)

#Awards we need: 
title_2014 <-c("ACTOR IN A LEADING ROLE", 
     "ACTOR IN A SUPPORTING ROLE",
     "ACTRESS IN A LEADING ROLE",
     "ACTRESS IN A SUPPORTING ROLE",
     "ART DIRECTION",
     "BEST PICTURE",
     "CINEMATOGRAPHY",
     "COSTUME DESIGN",
     "DIRECTING",
     "FILM EDITING",
     "MAKEUP",
     "MUSIC (Original Score)",
     "MUSIC (Original Song)",
     "SOUND EDITING",
     "SOUND MIXING",
     "VISUAL EFFECTS",
     "WRITING (Adapted Screenplay)",
     "WRITING (Original Screenplay)")

#subset to remove unneeded rows in 2014: 
cleaner_2014 <- subset(unclean_2014, unclean_2014$Award %in% title_2014)
actor_2014<-c("ACTOR IN A LEADING ROLE", 
     "ACTOR IN A SUPPORTING ROLE",
     "ACTRESS IN A LEADING ROLE",
     "ACTRESS IN A SUPPORTING ROLE")

rest_2014 <-c("ART DIRECTION",
        "BEST PICTURE",
        "CINEMATOGRAPHY",
        "COSTUME DESIGN",
        "DIRECTING",
        "FILM EDITING",
        "MAKEUP",
        "MUSIC (Original Score)",
        "MUSIC (Original Song)",
        "SOUND EDITING",
        "SOUND MIXING",
        "VISUAL EFFECTS",
        "WRITING (Adapted Screenplay)",
        "WRITING (Original Screenplay)")

cleaner_2014$Nominee<-"NA"
for (i in 1:length(cleaner_2014$Award)){
  if(cleaner_2014$Award[i] %in% actor_2014){
   cleaner_2014$Nominee[i] <- cleaner_2014$Nominee2[i]
  }else{
    cleaner_2014$Nominee[i] <- cleaner_2014$Nominee1[i]
  }
}

#Removing excess Data
cleaner_2014$Nominee2<- NULL
cleaner_2014$Nominee1<- NULL


#Repeat for 2010 Data
#Removing excessive rows 
unclean_2010$X<- NULL
unclean_2010$X.1<- NULL
unclean_2010$X.2<- NULL
unclean_2010$X.3<- NULL
unclean_2010$X.4<- NULL
unclean_2010$X.5<- NULL


#Cleaning Columns 2010
unclean_2010$Year <- str_replace(unclean_2010$Year, "\\(.*\\)", "")
unclean_2010$Additional.Info <- str_replace_all(unclean_2010$Additional.Info, "\\{.*\\}", "")
unclean_2010$Additional.Info <- str_replace_all(unclean_2010$Additional.Info, "\\[.*\\]", "")
names(unclean_2010)<-c("Year","Award","Nominee1","Nominee2","Winner")
unclean_2010$Nominee1<-as.character(unclean_2010$Nominee1)
cleaner_2010$Nominee<-"NA"

#Rows we need
title_2010 <-c("Actor -- Leading Role",
     "Actor -- Supporting Role",
     "Actress -- Leading Role",
     "Actress -- Supporting Role",
     "Art Direction",
     "Best Picture",
     "Cinematography",
     "Costume Design",
     "Directing",
     "Film Editing",
     "Makeup",
     "Music (Scoring)",
     "Music (Song)",
     "Sound Editing",
     "Sound",
     "Visual Effects",
     "Writing")

#subset to remove unneeded rows in 2014: 
cleaner_2010 <- subset(unclean_2010, unclean_2010$Award %in% title_2010)
actor_2010 <-c("Actor -- Leading Role",
     "Actor -- Supporting Role",
     "Actress -- Leading Role",
     "Actress -- Supporting Role")

rest_2010 <-c("Art Direction",
     "Cinematography",
     "Costume Design",
     "Directing",
     "Film Editing",
     "Makeup",
     "Music (Scoring)",
     "Music (Song)",
     "Best Picture",
     "Sound",
     "Sound Editing",
     "Visual Effects",
     "Writing")



for (i in 1:length(cleaner_2010$Award)){
  if(cleaner_2010$Award[i] %in% actor_2010){
    cleaner_2010$Nominee[i] <- cleaner_2010$Nominee2[i]
  }else if(cleaner_2010$Award[i] %in% rest_2010){
    cleaner_2010$Nominee[i] <- cleaner_2010$Nominee1[i]
  }
}

#Remove excces columns
cleaner_2010$Nominee2<- NULL
cleaner_2010$Nominee1<- NULL

#To replace row names: 
for( i in 1:16){
  cleaner_2010$Award <-gsub(title_2010[i], title_2014[i], cleaner_2010$Award)
}

#Removing excess years (1934-2010 needed)
cleaner_2010$Year <-as.numeric(cleaner_2010$Year)
clean_2010 <- na.omit(cleaner_2010)

#Combining Data 
Oscar_data <- rbind(cleaner_2014,clean_2010)


#write CSV Codes 
write.csv(Oscar_data,"Oscar_data.csv")

