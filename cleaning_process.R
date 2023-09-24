###Data Cleaning ###
##Libraries ##
library(tidyverse)

##Setting up Working directory and importing the dataset ##
setwd("G:/CapestoneProject1/CSV dataset")
bikeshare <- read.csv("G:/CapestoneProject1/CSV dataset/bikeshare_samp.csv")

## Checking the number of NA values ##
colSums(is.na(bikeshare))

## Removing Missing values and saving to a new data frame ##
final_bikedate <- bikeshare[complete.cases(bikeshare), ]

## Removing duplicate values ##
final_bikedate <- distinct(final_bikedate)

## Further refining and cleaning data using drop_na(), omit() ##
final_bikedate <- drop_na(final_bikedate)
final_bikedate <- na.omit(final_bikedate)

## Removing Data where value of started_at greater than ended_at ##
final_bikedate<- final_bikedate %>% 
  + filter(started_at < ended_at)

## Renaming column for better understanding ##
final_bikedate <- rename(final_bikedate, customer_type = member_casual, bike_type = rideable_type)

## Seperating Month,Date and year from started_date_onlymfor better analysis ##
final_bikedate$month <- format(as.Date(final_bikedate$started_date_only, format = "%d-%m-%Y"), "%b_%y")
final_bikedate$started_date_only <- as.Date(final_bikedate$started_date_only, format = "%d-%m-%Y")
final_bikedate$year <- format(final_bikedate$started_date_only, "%Y")

## creating a new coloumn for ime in %H%M format ##
final_bikedate$time <- as.POSIXct(final_bikedate$started_at, format = "%d-%m-%Y %H:%M")
final_bikedate$time <- format(final_bikedate$time, format = "%H:%M"

## Creating a ride length coloumn in minutes ##
final_bikedate$ride_length_mins <- as.numeric(difftime(final_bikedate$ended_time, final_bikedate$started_time, units = "mins"))

## Filtering out the coloumns that are gonna be used for analysis ##
final_bikedate <- final_bikedate %>% 
+   select(bike_type, customer_type, month, year, time, end_time, started_at, day_of_week, ride_length_mins)

                              
## Removing long rides where ride length> 1440 mins or ride length< 5 mins , as these ride might be considered as stolen or really small ##\
final_bikedate <- final_bikedate[!final_bikedate$ride_length>1440,] 
final_bikedate <- final_bikedate[!final_bikedate$ride_length_mins<5,]                               
                             
## Checking the cleaned data ##
colSums(is.na(final_bikedate))

 ## Exporting the cleaned Data ##
 write.csv(final_bikedate, file = "clean_trip_final_data.csv")                             
