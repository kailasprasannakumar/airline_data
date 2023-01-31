CREATE USER metabase WITH PASSWORD 'password';
CREATE DATABASE metabase;
GRANT ALL PRIVILEGES ON DATABASE metabase TO metabase;

\c metabase;

-- Create date_dim table
CREATE TABLE date_dim (
    id SERIAL PRIMARY KEY,
    Year INT,
    Month INT,
    DayofMonth INT,
    DayOfWeek INT,
    Quarter INT
);

-- Create airline_dim table
CREATE TABLE airline_dim (
    id SERIAL PRIMARY KEY,
    DOT_ID_Reporting_Airline INT,
    IATA_CODE_Reporting_Airline VARCHAR(255),
    Flight_Number_Reporting_Airline INT,
    Tail_Number VARCHAR(255)
);

-- Create origin_dim table
CREATE TABLE origin_dim (
    id SERIAL PRIMARY KEY,
    OriginAirportID INT,
    OriginAirportSeqID INT,
    OriginCityMarketID INT,
    OriginCityName VARCHAR(255),
    OriginState VARCHAR(255),
    OriginStateFips INT,
    OriginStateName VARCHAR(255),
    OriginWac INT
);

-- Create dest_dim table
CREATE TABLE dest_dim (
    id SERIAL PRIMARY KEY,
    DestAirportID INT,
    DestAirportSeqID INT,
    DestCityMarketID INT,
    DestCityName VARCHAR(255),
    DestState VARCHAR(255),
    DestStateFips INT,
    DestStateName VARCHAR(255),
    DestWac INT
);

-- Create time_dim table
CREATE TABLE time_dim (
    id SERIAL PRIMARY KEY,
    CRSDepTime INT,
    DepTime INT,
    DepDelay INT,
    DepDelayMinutes INT,
    DepDel15 INT,
    DepartureDelayGroups INT,
    DepTimeBlk VARCHAR(255),
    TaxiOut INT,
    WheelsOff INT,
    WheelsOn INT,
    TaxiIn INT,
    CRSArrTime INT,
    ArrTime INT,
    ArrDelay INT,
    ArrDelayMinutes INT,
    ArrDel15 INT,
    ArrivalDelayGroups INT,
    ArrTimeBlk VARCHAR(255)
);

-- Create flight_data table
CREATE TABLE flight_data (
    FlightDate DATE,
    Reporting_Airline VARCHAR(255),
    Origin VARCHAR(255),
    Dest VARCHAR(255),
    Cancelled INT,
    Diverted INT,
    Distance FLOAT,
    Airtime INT,
    date_dim_id INT,
    airline_dim_id INT,
    origin_dim_id INT,
    dest_dim_id INT,
    time_dim_id INT,
    FOREIGN KEY (date_dim_id) REFERENCES date_dim(id),
    FOREIGN KEY (airline_dim_id) REFERENCES airline_dim(id),
    FOREIGN KEY (origin_dim_id) REFERENCES origin_dim(id),
    FOREIGN KEY (dest_dim_id) REFERENCES dest_dim(id),
    FOREIGN KEY (time_dim_id) REFERENCES time_dim(id)
);