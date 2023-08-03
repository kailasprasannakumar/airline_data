#!/bin/bash

# Clearing Screen
clear


echo "The top 5 most popular flight connections are :-"
docker exec postgres psql -U postgres metabase -c "SELECT Origin, Dest, COUNT(*) as Count
FROM flight_data
GROUP BY Origin, Dest
ORDER BY Count DESC
LIMIT 5;"

echo "10 most often cancelled flights are :-"
docker exec postgres psql -U postgres metabase -c "SELECT airline_dim.Flight_Number_Reporting_Airline ,reporting_airline, COUNT(*) as Cancellation_Count
FROM flight_data
INNER JOIN airline_dim on flight_data.airline_dim_id = airline_dim.id 
WHERE Cancelled = 1
GROUP BY Flight_Number_Reporting_Airline, reporting_airline
ORDER BY Cancellation_Count DESC
LIMIT 10;"

echo "Busiest days within the year :-"
docker exec postgres psql -U postgres metabase -c "select year,month, dayofmonth,count(*) from date_dim
group by year,month,dayofmonth
order by count desc limit 10;"

echo "Busiest weeks within the year :-"
docker exec postgres psql -U postgres metabase -c "select year,month, date_part('week',flightdate) as week ,count(*) from date_dim
inner join flight_data on flight_data.date_dim_id = date_dim.id
group by year,month,dayofmonth, week
order by count desc limit 10;"

echo "Average distance flown by an airline"
docker exec postgres psql -U postgres metabase -c "select reporting_airline,avg(distance) from flight_data
group by reporting_airline
order by avg desc limit 10;"