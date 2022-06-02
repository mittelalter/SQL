-- SQL codes to analyze the airbnb data from New York in 2019

-- Generell info about Areas
SELECT 
	neighbourhood_group,
    room_type,
    COUNT(room_type) AS room_count,
    AVG(price) AS mean_price,
    COUNT(DISTINCT(neighbourhood)) AS neighbourhood_count,
    AVG(minimum_nights) AS min_nights,
    AVG(availability_365) AS avail_365,
    AVG(number_of_reviews) AS num_reviews,
    ROUND(SUM(reviews_per_month), 2) AS mon_reviews
FROM case_study.airbnb2019
GROUP BY neighbourhood_group, room_type
ORDER BY AVG(price) DESC;


-- Mean price of each neighbourhood
SELECT
	neighbourhood,
    AVG(price) AS mean_price,
    COUNT(neighbourhood) AS room_count
FROM case_study.airbnb2019
GROUP BY neighbourhood
ORDER BY mean_price DESC;


-- Count of Neighbourhoods from each Areas
SELECT
	neighbourhood_group,
    COUNT(DISTINCT(neighbourhood)) AS count_neighbourhood,
    AVG(price) AS mean_price,
    AVG(minimum_nights) AS mean_min_nights,
    AVG(availability_365) AS mean_available
FROM case_study.airbnb2019

WHERE neighbourhood_group = 'Manhattan'
		or neighbourhood_group = 'Brooklyn'
        or neighbourhood_group = 'Queens'
        
GROUP BY neighbourhood_group


-- Info about Neighbourhoods from Manhattan
SELECT
	neighbourhood,
    AVG(price) AS mean_price,
    AVG(minimum_nights) AS mean_min_nights,
    AVG(availability_365) AS mean_available,
    COUNT(neighbourhood) AS count_neighbourhood
    
FROM case_study.airbnb2019
WHERE neighbourhood_group = 'Manhattan'
GROUP BY neighbourhood
ORDER BY price DESC
