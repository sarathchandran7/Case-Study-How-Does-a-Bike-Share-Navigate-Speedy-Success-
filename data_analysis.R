### DATA ANALYSIS ###
## Importing the cleaned data ##
clean_trip_final <- read_csv("clean_trip_final_data.csv")
str(clean_trip_final)
names(clean_trip_final)

## Sorting the data based on month and weeekday ##
clean_trip_final$month <- ordered(clean_trip_final$month,levels=c("Dec_21","Jan_22","Feb_22","Mar_22", 
+                                                                    "Apr_22","May_22","Jun_22","Jul_22", 
+                                                                    "Aug_22","Sep_22","Oct_22","Nov_22"))

> clean_trip_final$week_day <- ordered(clean_trip_final$day_of_week, levels = c("Sunday", "Monday", "Tuesday", 
+                                                                            "Wednesday", "Thursday", 
+                                                                            "Friday", "Saturday"))

## Calculating Sumamry statistics ##
View(describe(clean_trip_final$ride_length_mins, fast=TRUE))

## examining the distribution of Cyclistic’s customers by membership type ##
View(table(clean_trip_final$customer_type))

## Total rides for each customer type in minutes ##
View(setNames(aggregate(ride_length_mins ~ customer_type, clean_trip_final, sum), c("customer_type", "total_ride_len_mins(mins)")))

## comparing the ride length patterns of annual members and casual riders. ##
View(clean_trip_final %>% 
+        group_by(customer_type) %>% 
+        summarise(min_length_mins = min(ride_length_mins), max_length_min = max(ride_length_mins),
+                  median_length_mins = median(ride_length_mins), mean_length_min = mean(ride_length_mins)))

## analyzing the average ride length of Cyclistic’s users by day of the week, as well as the total number of rides taken on each day of the week ##
View(clean_trip_final %>% 
+        group_by(day_of_week) %>% 
+        summarise(Avg_length = mean(ride_length_mins),
+ number_of_ride = n()))

## Average ride_length by months ##
View(clean_trip_final %>% 
+        group_by(month) %>% 
+        summarise(Avg_length = mean(ride_length_mins),
+                  number_of_ride = n()))

## Average ride length comparison by each week day according to each customer type ##
> View(aggregate(clean_trip_final$ride_length_mins ~ clean_trip_final$customer_type + 
+ clean_trip_final$day_of_week, FUN = mean))

> ## Average ride length comparison by each month according to each customer type ##
> View(aggregate(clean_trip_final$ride_length_mins ~ clean_trip_final$customer_type + 
+  clean_trip_final$month, FUN = mean))

> ## Analyze rider length data by customer type and weekday ##
> View(clean_trip_final %>% 
+        group_by(customer_type, day_of_week) %>% 
+        summarise(number_of_ride = n(),
+                  avgerage_duration = mean(ride_length_mins),
+                  median_duration = median(ride_length_mins),
+                  max_duration = max(ride_length_mins),
+                  min_duration = min(ride_length_mins)))

## Analyze rider length data by customer type and month ##
> View(clean_trip_final %>% 
+        group_by(customer_type, month) %>% 
+        summarise(number_of_ride = n(),
+                  avgerage_duration = mean(ride_length_mins),
+                  median_duration = median(ride_length_mins),
+                  max_duration = max(ride_length_mins),
+                  min_duration = min(ride_length_mins)))

## Saving the data analysis ##
write.csv(clean_trip_final,file = "clean_trip_final_tableau.csv",row.names = FALSE)
