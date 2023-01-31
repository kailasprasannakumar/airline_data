-- 1. Ratio between canceled flights and airlines
select iata_code_reporting_airline, count(case when cancelled = 1 then 1 end)::decimal / count(*) as cancelled_ratio
from flight_data
join airline_dim on flight_data.airline_dim_id = airline_dim.id
join time_dim on flight_data.time_dim_id = time_dim.id
group by iata_code_reporting_airline order by cancelled_ratio desc;

--2. Ratio between delayed flights and airlines
select iata_code_reporting_airline, count(case when arrdelay > 0 then 1 else null end)::decimal / count(*) as delay_ratio
from flight_data
join airline_dim on flight_data.airline_dim_id = airline_dim.id
join time_dim on flight_data.time_dim_id = time_dim.id
group by iata_code_reporting_airline order by delay_ratio desc;

-- 3. Ratio between delayed flights and destination airports
select destairportid,destcityname, count(case when arrdelay > 0 then 1 else null end)::decimal / count(*) as delay_ratio
from flight_data
join dest_dim on flight_data.dest_dim_id = dest_dim.id
join time_dim on flight_data.time_dim_id = time_dim.id
group by destairportid,destcityname order by delay_ratio desc;

--4. Ratio between delayed flights and departure airports
select originairportid,origincityname, count(case when arrdelay > 0 then 1 else null end)::decimal / count(*) as delay_ratio
from flight_data
join origin_dim on flight_data.origin_dim_id = origin_dim.id
join time_dim on flight_data.time_dim_id = time_dim.id
group by originairportid,origincityname order by delay_ratio desc;

--5. Ratio between diverted flights and airlines
select iata_code_reporting_airline, count(case when diverted = 1 then 1 end)::decimal / count(*) as diverted_ratio
from flight_data
join airline_dim on flight_data.airline_dim_id = airline_dim.id
join time_dim on flight_data.time_dim_id = time_dim.id
group by iata_code_reporting_airline order by diverted_ratio desc;
