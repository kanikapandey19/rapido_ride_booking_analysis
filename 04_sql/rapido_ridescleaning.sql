CREATE TABLE rides (
    vehicle VARCHAR(20),
    pickup_time TIMESTAMP,
    dropoff_time TIMESTAMP,
    ride_status VARCHAR(20),
    passenger_count INT,
    pulocation INT,
    dolocation INT,
    duration INT,
    ride_id VARCHAR(50) PRIMARY KEY,
    distance DECIMAL(10,2),
    ride_charge DECIMAL(10,2),
    misc_charge DECIMAL(10,2),
    total_fare DECIMAL(10,2),
    payment_method VARCHAR(30)
);

##other cleaning queries
-- Handle missing passenger counts
UPDATE rides
SET passenger_count = 0
WHERE passenger_count IS NULL;

-- Handle missing ride charges
UPDATE rides
SET ride_charge = 0
WHERE ride_charge IS NULL;

-- Handle missing miscellaneous charges
UPDATE rides
SET misc_charge = 0
WHERE misc_charge IS NULL;

-- Handle missing total fare values
UPDATE rides
SET total_fare = 0
WHERE total_fare IS NULL;