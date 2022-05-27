-- SQL Views and Sentences to analyze the business data from Bike-Share-Company

-- Bike Tables Union
CREATE VIEW bike_union AS
SELECT * FROM bike202201
UNION ALL
SELECT * FROM bike202202
UNION ALL
SELECT * FROM bike202203
UNION ALL
SELECT * FROM bike202204


-- Null values check from columns
SELECT COUNT(*)
FROM bike_union
WHERE ride_id IS NULL
	OR rideable_type IS NULL
    OR started_at IS NULL
    OR ended_at IS NULL
    OR start_station_name IS NULL
    OR end_station_name IS NULL
    OR member_casual IS NULL
	OR ride_length IS NULL
    OR day_of_week IS NULL


-- Mean of Ride Length by Customer Types
SELECT
	member_casual,
	AVG(ROUND(TIME_TO_SEC(ride_length) / 60, 0)) AS ride_length_mean
    
FROM bike_union

GROUP BY member_casual


-- Count of bike types by annual members
SELECT
	rideable_type,
    COUNT(member_casual) AS 'Count of Bikes'
    
FROM bike_union

WHERE member_casual = 'member'

GROUP BY rideable_type


-- Count of bike types by casual riders
SELECT
	rideable_type,
    COUNT(member_casual) AS 'Count of Bikes'
    
FROM bike_union

WHERE member_casual = 'member'

GROUP BY rideable_type


-- Count of bike rides on the day of week by annual members
SELECT
	day_of_week,
	COUNT(member_casual)
    
FROM bike_union

WHERE member_casual = 'member'

GROUP BY day_of_week


-- Count of bike rides on the day of week by casual riders
SELECT
	day_of_week,
	COUNT(member_casual)
    
FROM bike_union

WHERE member_casual = 'casual'

GROUP BY day_of_week


-- Count of bike rides on months
SELECT 
	MONTH(started_at) AS Start_Month,
	COUNT(started_at) AS 'Count of Rides'
FROM bike_union

GROUP BY MONTH(started_at)


-- Count of bikes rides on months by annual members
SELECT 
	MONTH(started_at) AS Start_Month,
	COUNT(started_at) AS 'Count of Rides'
FROM bike_union

WHERE member_casual = 'member'

GROUP BY MONTH(started_at)


-- Count of bikes rides on months by casual riders
SELECT 
	MONTH(started_at) AS Start_Month,
	COUNT(started_at) AS 'Count of Rides'
FROM bike_union

WHERE member_casual = 'casual'

GROUP BY MONTH(started_at)


-- Count of bikes rides by start time
SELECT 
	HOUR(started_at) AS Start_Month,
	COUNT(started_at) AS 'Count of Rides'
FROM bike_union

GROUP BY HOUR(started_at)

ORDER BY COUNT(started_at) DESC


-- 