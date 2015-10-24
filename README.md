# IS607_Project3
##Scope of the Project
This project was undertaken as partial fulfillment of the requirements for IS 607, Data Acquisition and Management, at the City University of New York.  The [assignment] (Assignment_Description.pdf) was to use data to determine whether Best Film Editing is the best predictor of Best Picture in the Academy Awards (Oscars).

##Participants
This implementation was carried out by members of section 2 of the fall 2015 course, namely (and in alphabetical order by last name):

- Daina Bouquin
- Matthew Farris
- Robert Godbey
- Andrew Goldberg
- Nabila Hossain
- Srinivasa Illapani
- Sanjive Kumar 
- Joy Payton
- Veneranda Skrelja
- Maxwell Wagner 
- Karen Weigandt
- Youqing Xiang

##Methods
Research into the history and methods of the Oscars allowed us to create 
- A [list of awards](Oscar_Award_Category.csv)
- A [list of films](Film.csv)
- [Data showing which awards were given out in which years](Film_Oscar_Award.csv)
- A [list of levels of recognition](Oscar_Award_Type.csv)

Screen-scraping methods using R libraries were used to gather:
- [BAFTA data](IS607P3 Bafta BestPicture Winner Munge AG.R)
- Winners up to 2010  
- Winners from 2011 to 2014

This resulted in untidy .csv files that represent:
- [Oscar results up to 2010](unclean_2010.csv)
- [2011-2014 Oscar results](unclean_2014.csv)
- [San Diego Film Awards](data/SDFilmAwards.csv)


R libraries including dplyr and tidyr were used to create tidying scripts and tidy data:
- [San Diego Film Awards](data/tidysdfcsawinners.csv)
- [BAFTA awards](data/tidybaftabestpicturewinners.csv)
- [Oscar results](data/tidy_oscar_winners.csv)

Data design gave us the following tools:
- A [database plan](EER_screenshot.png)
- A [database structure] project3_database_EER.mwb	

A [visualization repository was created](/Visualization)

##Findings

Our team discovered that Best Editing is in fact not the best predictor of Best Picture.  Putting our efforts solely into the analysis of the Academy Award data and not (at this point) including other film awards, we discerned that Best Director is in fact the best predictor of Best Picture.
