-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT);

-- Create table with # of helpful_votes / total_votes >= 50%
SELECT *
INTO vine_helpful
FROM vine_total
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5;


-- View vine_total
SELECT *
from vine_total


-- Count of vine_total
SELECT COUNT(*)
from vine_total


-- Create table with # of helpful_votes / total_votes >= 50%
SELECT *
INTO vine_helpful
FROM vine_total
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5;

-- Count of vine_helpful
SELECT COUNT(*)
from vine_helpful



-- Create table with paid reviews (vine=='Y')
SELECT *
INTO vine_yes
FROM vine_helpful
WHERE vine = 'Y';

-- count of vine_yes
SELECT COUNT(*)
FROM vine_yes;




-- Create table with unpaid reviews (vine=='N')
SELECT *
INTO vine_no
FROM vine_helpful
WHERE vine = 'N';

-- count of vine_no
SELECT COUNT(*)
FROM vine_no;



-- Create table with NonSubscriber 5 star Ratings
SELECT *
INTO vine_no_5star
FROM vine_no
WHERE star_rating = 5;

-- count of vine_no 5 star
SELECT COUNT(*)
FROM vine_no_5star;



-- Create table with Subscriber 5 star Ratings
SELECT *
INTO vine_yes_5star
FROM vine_yes
WHERE star_rating = 5;

-- count of vine_yes 5 star
SELECT COUNT(*)
FROM vine_yes_5star;



-- Create table with All 5 star Ratings
SELECT *
INTO vine_all_5star
FROM vine_helpful
WHERE star_rating = 5;

--count of Total All 5 Star Ratings
SELECT COUNT(*)
FROM vine_all_5star;


-- 5-Star Percentage of Vine vs. Non-Vine 
-- Reviews to All Filtered 5-Star Reviews
SELECT  ((No5_A.count/Five_star_rev.count::float)*100) 
      as no_percentage,
      ((Yes5_A.count/Five_star_rev.count::float)*100) 
      as yes_percentage
FROM 

(SELECT COUNT(*)
FROM vine_yes_5star) AS Yes5_A,

(SELECT COUNT(*)
FROM vine_no_5star) AS No5_A,

(SELECT COUNT(*)
FROM vine_all_5star) AS Five_star_rev;



-- Percentage of 5-star Ratings Compared to Total Reviews
-- for Vine Subscribers and Non-Subscribers
SELECT  ((no5.count/totalrev.count::float)*100) as no_percentage,
    ((yes5.count/totalrev.count::float)*100) as yes_percentage

FROM 

(SELECT COUNT(*)
FROM vine_yes_5star) AS Yes5,

(SELECT COUNT(*)
FROM vine_no_5star) AS No5,

(SELECT COUNT(*)
FROM vine_all_5star) AS totalrev
;


--Count of all Vine Ratings Unfiltered
SELECT COUNT(*) 
FROM vine_table
WHERE VINE='Y';


-- Percentage of Vine Ratings Compared to Total Reviews
SELECT ((AllYes.count/totalrev.count::float)*100) 
AS yes_percentage

FROM 

(SELECT COUNT(*) 
FROM vine_table
WHERE VINE='Y') AS AllYes,

(SELECT COUNT(*)
FROM vine_table) AS totalrev
;