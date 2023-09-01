# Ford GoBike 02-2019 Analysis Project
## by (Antonio Perez)

Bay Area Bike Share (which later became **Ford GoBike**) is a system launched by the city of San Francisco with $11.2M of public funds managed by Bay Area Air Quality Management District. 

## Dataset

The dataset contains information of 180k+ rides with start time on 02-2019.  
Data source: [fordgobike-tripdata.csv](https://video.udacity-data.com/topher/2023/July/64ac0039_fordgobike-tripdata/fordgobike-tripdata.csv)

The data contained is arranged on the following columns:  
<pre>
'duration_sec'..............Bike ride duration in seconds.  
'start_time'................Time at the ride started.
'end_time'..................Time at the ride ended.
'start_station_id'..........Id of the station where the ride started.
'start_station_name'........Name of the station, street and number or streets crossing.
'start_station_latitude'....Float representing latitude coordinate of the station.
'start_station_longitude'...Float representing longitude coordinate of the station.
'end_station_id'............Id of the station where the ride ended.
'end_station_name'..........Name of the station, street and number or streets crossing.
'end_station_latitude'......Float representing latitude coordinate of the station.
'end_station_longitude'.....Float representing longitude coordinate of the station.
'bike_id'...................Id of the bike used for the trip.
'user_type'.................Can be Customer or subscriber.
'member_birth_year'.........Id of the station where the ride ended.
'member_gender'.............Can be Male, Female or Other, also can be blank.
'bike_share_for_all_trip'...Members with low income special discount.
</pre>
## Summary of Findings

Most of the riders are young people. Mode for users age by gender is 31yr for males, 29yr for females.
The service is most active during weekdays by double, 7.2k trips on weekdays vs 3.6k trips on weekends.
The most active hours of the service is at 8am and 5pm. 


## Key Insights for Presentation

Most of the rides are by young people around 30 years old, these users are most active during weekdays which suggests that the service is used for work related transportation, also to complement this theory we can see that the service is most active when job hours start the most (8am) and when labour journey ends (5pm).