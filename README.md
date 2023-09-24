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







