
##What are total no. of rides
SELECT COUNT(*) AS total_rides
FROM rides;
## What are total no.  of bookings
SELECT COUNT(*) AS Total_Bookings
FROM rides;
## What is the total revenue generated?
SELECT SUM(total_fare) AS Revenue
FROM rides
## What are the total booking by hour

SELECT EXTRACT(HOUR FROM pickup_time) AS Hour,
       COUNT(*) AS Bookings
FROM rides
GROUP BY Hour
ORDER BY Bookings DESC;
## What are the total completed and cancelled rides?
SELECT ride_status,
       COUNT(*) AS total_rides
FROM rides
GROUP BY ride_status;
##What is the cancellation_rate?
SELECT
ROUND(
    SUM(CASE WHEN ride_status = 'Cancelled' THEN 1 ELSE 0 END)*100.0
    / COUNT(*),
    2
) AS cancellation_rate
from rides;

## what is the average distance travelled by each vehicle?
SELECT vehicle,
       ROUND(AVG(distance),2) AS avg_distance
FROM rides
GROUP BY vehicle;
## What is the revenue contribution of each vehicle and its contribution percentage?
SELECT vehicle,
       SUM(total_fare) AS revenue,
       ROUND(
           SUM(total_fare)*100.0/
           SUM(SUM(total_fare)) OVER(),
           2
       ) AS contribution_pct
FROM rides
GROUP BY vehicle
ORDER BY revenue DESC;
## Which payment method is used most?

SELECT payment_method,
       COUNT(*) AS total_transactions
FROM rides
GROUP BY payment_method
ORDER BY total_transactions DESC;
##What are the total no of bookings according to time period?
SELECT
    CASE
        WHEN EXTRACT(HOUR FROM pickup_clock) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM pickup_clock) BETWEEN 12 AND 17 THEN 'Afternoon'
        WHEN EXTRACT(HOUR FROM pickup_clock) BETWEEN 18 AND 22 THEN 'Evening'
        ELSE 'Night'
    END AS time_period,
    COUNT(*) AS bookings
FROM rides
GROUP BY time_period;
