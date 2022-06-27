 A) ATHENS CITY QUERIES
 
 1) Query1
  select l.property_type, l.beds, l.bedrooms, l.price, h.host_acceptance_rate, r.comments from listing_athens_df as l 
  join [dbo].[review_athens_df] as r
  on l.id = r.listing_id
  join dbo.host_athens_df as h
  on h.host_id = l.host_id
  order by l.beds; 

 2)Query-2
 select *, max(price) over (partition by property_type order by price desc) as Max_price from listing_athens_df;
   
                              							
 3)Query3
 select l.host_id, h.host_name, r.reviewer_name, r.comments from host_athens_df as h 
 join listing_athens_df as l
 on h.host_id = l.host_id
 join review_athens_df as r
 on l.id = r.listing_id;



 4)query4
  select  listing_id, sum(minimum_nights) as total_min_nights, sum(maximum_nights) as total_max_night from df_athens_availability
  where MONTH(date)= 12 and year(date)=2021
  group by listing_id
  order by listing_id;


  
5) query5 
  SELECT a.property_type, a.bedrooms, a.beds, b.host_name, b.host_acceptance_rate FROM listing_athens_df AS a
  JOIN host_athens_df AS b
  ON a.host_id = b.host_id
  GROUP BY a.property_type, a.bedrooms, a.beds, b.host_name, b.host_acceptance_rate
  ORDER BY b.host_acceptance_rate DESC;
 

6)query6 
  select property_type, max(review_scores_cleanliness) as max_scores_cleanliness from listing_athens_df
  group by property_type;


7) query7
  SELECT property_type, AVG(bedrooms) AS Avg_bedrooms, AVG(beds) AS Avg_beds FROM listing_athens_df
  GROUP BY property_type
  ORDER BY Avg_bedrooms DESC, Avg_beds;


8)query8
SELECT property_type, bedrooms, beds, AVG(price) as avg_price, review_scores_rating, CASE 
 WHEN review_scores_rating = 0 THEN 'VERY POOR'
 WHEN review_scores_rating BETWEEN 1 AND 2 THEN 'POOR'
 WHEN review_scores_rating BETWEEN 2 AND 3 THEN 'MODERATE'
 WHEN review_scores_rating BETWEEN 3 AND 4 THEN 'GOOD'
 WHEN review_scores_rating BETWEEN 4 AND 5 THEN 'VERY GOOD'
END AS Review_Category
FROM listing_athens_df
GROUP BY property_type,bedrooms,beds,review_scores_rating
ORDER BY Review_Category DESC;


                               
SELECT b.Review_Category, MAX(b.price) AS Max_price, AVG(b.price) AS Avg_Price, MIN(b.price) AS Min_Price FROM
(SELECT a.property_type, a.bedrooms, a.beds, a.price, a.review_scores_rating, 
CASE 
 WHEN a.review_scores_rating = 0 THEN 'VERY POOR'
 WHEN a.review_scores_rating BETWEEN 1 AND 2 THEN 'POOR'
 WHEN a.review_scores_rating BETWEEN 2 AND 3 THEN 'MODERATE'
 WHEN a.review_scores_rating BETWEEN 3 AND 4 THEN 'GOOD'
 WHEN a.review_scores_rating BETWEEN 4 AND 5 THEN 'VERY GOOD'
ELSE 'NA'
END AS Review_Category
FROM listing_athens_df AS a) AS b
group by Review_Category;


9) query9
SELECT name, latitude, longitude, property_type, accommodates, bedrooms, beds, price FROM listing_athens_df
ORDER BY price DESC;


B) THESSALONIKI CITY QUERIES

1)Query1

  select l.property_type, l.beds, l.bedrooms, l.price, h.host_acceptance_rate, r.comments from [SQL_Project].[dbo].[listing_thessaloniki_df] as l 
  join [SQL_Project].[dbo].[review_thessaloniki_df] as r
  on l.id = r.listing_id
  join  [SQL_Project].[dbo].[host_thessaloniki_df] as h
  on h.host_id = l.host_id
  order by l.beds; 

2)Query-2
select *, max(price) over (partition by property_type order by price desc) as Max_price from [SQL_Project].[dbo].[listing_thessaloniki_df];
 

3)Query3
 select l.host_id, h.host_name, r.reviewer_name, r.comments from [SQL_Project].[dbo].[host_thessaloniki_df] as h 
 join [SQL_Project].[dbo].[listing_thessaloniki_df] as l
 on h.host_id = l.host_id
 join [SQL_Project].[dbo].[review_thessaloniki_df] as r
 on l.id = r.listing_id;


4)query4
  select  listing_id, sum(minimum_nights) as total_min_nights, sum(maximum_nights) as total_max_night from [SQL_Project].[dbo].[df_thessaloniki_availabilityy]
  where MONTH(date)= 12 and year(date)=2021
 group by listing_id
 order by listing_id;


5)query5
SELECT a.property_type, a.bedrooms, a.beds, b.host_name, b.host_acceptance_rate FROM [SQL_Project].[dbo].[listing_thessaloniki_df] AS a
JOIN [SQL_Project].[dbo].[host_thessaloniki_df] AS b
ON a.host_id = b.host_id
GROUP BY a.property_type, a.bedrooms, a.beds, b.host_name, b.host_acceptance_rate
ORDER BY b.host_acceptance_rate DESC;

SELECT a.property_type, a.bedrooms, a.beds, a.price, AVG(a.review_scores_rating) AS Property_Rating, COUNT(a.review_scores_rating) AS No_of_Reviews_by_Ratings, COUNT(b.comments) AS No_of_Reviews_by_Comments FROM listing_thessaloniki_df AS a
LEFT JOIN review_thessaloniki_df AS b
ON a.id = b.listing_id
GROUP BY a.property_type, a.bedrooms, a.beds, a.price, review_scores_rating
ORDER BY Property_Rating DESC, No_of_Reviews_by_Ratings DESC, No_of_Reviews_by_Comments DESC;


6)Query6
select property_type, max(review_scores_cleanliness) as max_scores_cleanliness from [SQL_Project].[dbo].[listing_thessaloniki_df]
 group by property_type;


7)query7
SELECT property_type, AVG(bedrooms) AS Avg_bedrooms, AVG(beds) AS Avg_beds FROM [SQL_Project].[dbo].[listing_thessaloniki_df]
GROUP BY property_type
ORDER BY Avg_bedrooms DESC, Avg_beds;


8)query8- review category acc to review scoring rate
SELECT property_type, bedrooms, beds, AVG(price) as avg_price, review_scores_rating, CASE 
 WHEN review_scores_rating = 0 THEN 'VERY POOR'
 WHEN review_scores_rating BETWEEN 1 AND 2 THEN 'POOR'
 WHEN review_scores_rating BETWEEN 2 AND 3 THEN 'MODERATE'
 WHEN review_scores_rating BETWEEN 3 AND 4 THEN 'GOOD'
 WHEN review_scores_rating BETWEEN 4 AND 5 THEN 'VERY GOOD'
END AS Review_Category
FROM [SQL_Project].[dbo].[listing_thessaloniki_df]
GROUP BY property_type,bedrooms,beds,review_scores_rating
ORDER BY Review_Category DESC;


                              
SELECT b.Review_Category, MAX(b.price) AS Max_price, AVG(b.price) AS Avg_Price, MIN(b.price) AS Min_Price FROM
(SELECT a.property_type, a.bedrooms, a.beds, a.price, a.review_scores_rating, 
CASE 
 WHEN a.review_scores_rating = 0 THEN 'VERY POOR'
 WHEN a.review_scores_rating BETWEEN 1 AND 2 THEN 'POOR'
 WHEN a.review_scores_rating BETWEEN 2 AND 3 THEN 'MODERATE'
 WHEN a.review_scores_rating BETWEEN 3 AND 4 THEN 'GOOD'
 WHEN a.review_scores_rating BETWEEN 4 AND 5 THEN 'VERY GOOD'
ELSE 'NA'
END AS Review_Category
FROM [SQL_Project].[dbo].[listing_thessaloniki_df] AS a) AS b
group by Review_Category;


9)query9
SELECT name, latitude, longitude, property_type, accommodates, bedrooms, beds, price FROM [SQL_Project].[dbo].[listing_thessaloniki_df]
ORDER BY price DESC;



​

