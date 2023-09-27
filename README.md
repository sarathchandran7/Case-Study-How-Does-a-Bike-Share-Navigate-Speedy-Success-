# Case-Study-How-Does-a-Bike-Share-Navigate-Speedy-Success-
This case study was done as a part of  Capstone project for Google Big data analytics professional certificate.
In this case study, I have performed data analysis for a fictional bike-share company in order to help them attract more riders. 

## Introduction ##
Cyclistic is a bike-sharing program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two=-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day. As part of an analysis project, I have obtained a data set of all Cyclistic trips taken from january 2021 to June 2021.I was given the opportunity to conduct a case study on Cyclistic to analyze the data and provide insights on the users’ behavior.

## About the company ##
In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are
geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to
any other station in the system anytime.
Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One 
approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and
annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who
purchase annual memberships are Cyclistic members.

## Goal of case study/ASK ##
Moreno : The director of marketing, has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do
that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual
riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in
analyzing the Cyclistic historical bike trip data to identify trends.
Ask
Three questions will guide the future marketing program:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

## Data Source ##
The [dataset](https://divvy-tripdata.s3.amazonaws.com/index.html) used in this case study is actual public data [view license](https://divvybikes.com/data-license-agreement) made available by Motivate International Inc. who operates the City of Chicago’s Divvy bicycle sharing service. The data contains following colomns.
![pic](https://github.com/sarathchandran7/Case-Study-How-Does-a-Bike-Share-Navigate-Speedy-Success-/assets/43676904/ab6a5ef4-b910-4d6a-8f2a-618ad66d3598)

## Data preparation ##
In order to gain an understanding of the data and its potential for analysis, a review was conducted to assess the content of the variables, the format of the data, and the integrity of the data. This initial review provided an overview of the data and helped to identify any potential issues or challenges that would need to be addressed in the preparation and analysis process.

Data review involved the following:

Checking column names across all the 12 original files.
Checking for missing values.
Checking of white spaces.
Checking of duplicate records.
Other data anomalies.
Results of the review found following things:

Duplicate record of ID numbers.
Records with missing start or end station name.
Records with very short or very long ride duration.
Records for trips starting or ending at an administrative station (repair or testing station).

### Data Validation ###
 R in R Studio was mainly used to clean and manipulate the data.
 Data for each month was present in seperate csv files, so the multiple csv files had to be combines into a single file.
 All the data cleaning and manipulating process is saved as [cleaning_process.R](https://github.com/sarathchandran7/Case-Study-How-Does-a-Bike-Share-Navigate-Speedy-Success-/blob/main/cleaning_process.R) with comments. The libraries we used are the following:
 ```
library(tidyverse)
library(readr)
library(psych)
library(dplyr)

```
After unzipping the data of 5 most recent months, I aggregated them into one single dataframe and stored it into bikeshare_samp.csv. At this stage,there were several missing values, i.e., NA, within the aggregated data. Missing values can potentially raise issues.Hence, we will omit those rows from our analysis.
To prepare for our analysis, we created three new variables:
day_of_week: Day of a week of the ride (Mon-Sun)
started_date_only: extracted start date from started_at without specific time (yyyy-mm-dd format)
ride_length: Total ride length in minutes.

## Data Analysis ##
In  the Data analysis stage, I explored the data in order to gain a better understanding of its characteristics and patterns. I have created charts, graphs, and other types of visualizations to help visualize the data and identify trends. Different kind of measures and
calulations has been done on the cleaned data which is saved as [data_analysis.R](https://github.com/sarathchandran7/Case-Study-How-Does-a-Bike-Share-Navigate-Speedy-Success-/blob/main/data_analysis.R).

## Data Visulaizations and Summary ##
### Visualization 1 ###
![visualisation_1](https://github.com/sarathchandran7/Case-Study-How-Does-a-Bike-Share-Navigate-Speedy-Success-/assets/43676904/a7e01fd9-5376-472c-ba8f-b034c16e7bb2)
This visualization shows the total number of rides per day of the week for each customer type. We can see that
* There are more annual members during the weekdays (Mon-Fri), which could potentially be related to commuting to work/school, etc.
* It appears that casual riders have the highest number of rides on Saturdays and Sundays, potentially indicating leisurely use of the bikes on the weekends. 
* Saturday has the maximum number of bike-share users  followed by Sunday

### Visualization 2 ###
![image](https://github.com/sarathchandran7/Case-Study-How-Does-a-Bike-Share-Navigate-Speedy-Success-/assets/43676904/3f800e91-1ff8-4edd-88c2-75497984501b)
Next, we can take a look at the rider distribution by month, from Jan 2021 to June 2021.Here we can see that:
* It appears that there is a higher demand for bike usage during the summer months for both customer types, with casual riders showing a slightly less demand.
*  annual members continue to use the service at a relatively consistent rate throughout the year.
This further supports our analysis that annual members may rely on the bike sharing service for their regular commute, while casual riders may use it more for leisure and recreational purposes.

### Visulaization 3 ###
![image](https://github.com/sarathchandran7/Case-Study-How-Does-a-Bike-Share-Navigate-Speedy-Success-/assets/43676904/b3841387-bdc8-47c7-b9b5-a3d6cdfc2b66)

In this graph between the Avg. Ride duration and Week days, It is clear that: 
* casual riders tend to use the bike share service primarily on weekends for leisure or recreational purposes
* while annual members use the service more consistently throughout the week, possibly for commuting to work or other daily activities.
This information could be useful for Cyclistic in terms of understanding how to target marketing efforts and potentially adjusting pricing or membership plans to better meet the needs of these different customer groups.

### Visualization 4 ###
![image](https://github.com/sarathchandran7/Case-Study-How-Does-a-Bike-Share-Navigate-Speedy-Success-/assets/43676904/c8648f2b-1722-490e-b590-81d993a22d98)

In this graph between the Avg. Ride duration and Month, It is clear that: 
* Annual members tend to use the bikes for their regular commutes, with a steadier usage throughout the week and year.
* Casual riders, on the other hand, tend to use the bikes more for leisure, with higher usage on weekends and in the summer months
* Additionally, the average ride length for casual riders was found to be longer than that of annual members.

### Visualization 5 ###

![image](https://github.com/sarathchandran7/Case-Study-How-Does-a-Bike-Share-Navigate-Speedy-Success-/assets/43676904/8babeaa4-acba-4012-aaf9-84d03af356fd)



The analysis of bike type usage showed that:
* members prefer classic bikes over electric and docked bikes
*  while casual riders have similar usage of electric bikes and a slightly higher preference for docked bikes.

### Visualization 6 ###
![image](https://github.com/sarathchandran7/Case-Study-How-Does-a-Bike-Share-Navigate-Speedy-Success-/assets/43676904/0b10df3f-fde1-42ee-ab3e-16a79bbe1c5a)

This graph shows that annual members tend to use the bikes more frequently during rush hour,mainly for coming and going to work. On the other hand, casual riders show a more steady increase in usage throughout the day, with maximum around 6pm and a steady decrease thereafter. This suggests that casual riders may be using the bikes more for leisure activities. 

## Summary ##
### Key Takeaways ###
* Ride duration of casual riders tend to be longer, averaging around 50% longer than annual members
* Both annual members and casual riders favor classic bikes over the other two types of bikes offered.
* Annual members use bikes usually during weekdays
* Compared to casual rides, members have a consistent use of the service throughout the week and the year.
* Annual members primarily use the bike-sharing service for commuting purposes, while casual riders tend to use it for leisure, particularly on weekends and in the summer months.

### Recommendation ##
* Increase marketing initiatives aimed at leisure riders, particularly in the summer and on weekends, to promote bike use and revenue.
* To encourage yearly members to utilise the bikes more frequently during the week and year, think about providing discounts or rewards.
* Since classic bikes are the most well-liked among annual members and casual riders, put your attention on enhancing the fleet.
* On weekends, when usage is nearly twice as high as during the middle of the week, casual riders prefer to use Cyclistic bikes.Create a weekend membership programme that allows members to book rides at a discounted rate on weekdays while include rides on the weekends in the base price.








