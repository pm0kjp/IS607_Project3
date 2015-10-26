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
Research into the history and methods of the Oscars allowed us to create an [Academy Award Metadata](Academy%20Award%20Metadata/) folder that includes
- A [list of awards](Academy%20Award%20Metadata/Oscar_Award_Category.csv)
- A [list of films](Academy%20Award%20Metadata/Film.csv)
- [Data showing which awards were given out in which years](Academy%20Award%20Metadata/Film_Oscar_Award.csv)
- A [list of levels of recognition](Academy%20Award%20Metadata/Oscar_Award_Type.csv)

Data Acquisition was largely from pre-existing tabular databases:
- [http://awardsdatabase.oscars.org/ampas_awards/BasicSearchInput.jsp](http://awardsdatabase.oscars.org/ampas_awards/BasicSearchInput.jsp)
- [https://www.aggdata.com/awards/oscar](https://www.aggdata.com/awards/oscar)
- BAFTA(https://en.wikipedia.org/wiki/BAFTA_Award_for_Best_Film) and PGA Award (https://en.wikipedia.org/wiki/Producers_Guild_of_America_Award) information was manually scraped
- Scripted page scraping was determined to be a counter-productive method due to page timeout issues

This resulted in untidy .csv files, found in the [Untidy Data](Untidy%20Data) Folder:
- [Oscar results up to 2010](Untidy%20Data/unclean_2010.csv)
- [2011-2014 Oscar results](Untidy%20Data/unclean_2014.csv)

The above data was then tidied ith the following code: 
- [Cleaning and Combining](IS607_Project3/Munging Scripts/Extraction data.R)
- [Gathering and Spreading](IS607_Project3/Munging Scripts/IS607P3 CombOscar Winner Munge AG.R)

Which resulted in the combined datasets:
- [Cleaned and Extracted Data](data/Oscar_data.csv)
- [ML Gathered and Tidied Data](data/tidyoscarnoms.csv)

R libraries including dplyr and tidyr were used to create tidying scripts and tidy data:
- [San Diego Film Awards](data/tidysdfcsawinners.csv)
- [BAFTA awards](data/tidybaftabestpicturewinners.csv)
- [Oscar results](data/tidy_oscar_winners.csv)

Data design gave us the following tools:
- A [database plan](Database%20Info/EER_screenshot.png)
- A [database structure](Database%20Info/project3_database_EER.mwb)	

A [visualization repository was created](/Visualization)

Some screenshots for our presentation can be found in the [Images for Presentation](Images%20for%20Presentation) folder.

##Findings

Our team discovered that Best Editing is in fact not the best predictor of Best Picture.  Putting our efforts solely into the analysis of the Academy Award data and not (at this point) including other film awards, we discerned that Best Director is in fact the best predictor of Best Picture.

##Future Directions

Given that we've pulled data from other awards sources, a logical next step would be to include this data in our analysis and machine learning in order to determine if some combination of awards (either a single factor or a combination of several) could be a still more accurate predictor than Best Director.  Additionally, a future direction could be a more robust project management model using tools like Slack.


