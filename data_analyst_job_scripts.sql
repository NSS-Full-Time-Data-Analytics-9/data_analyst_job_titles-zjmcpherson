SELECT *
FROM data_analyst_jobs;

--How many rows are in the data_analyst_jobs table?
	--Right-clicked data_analyst_jobs and went to COUNT ROWS
			--1793

--Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
SELECT *
FROM data_analyst_jobs
LIMIT 10;
			--ExxonMobil

--How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
SELECT COUNT(company)
FROM data_analyst_jobs
WHERE location = ('TN');
			--21
SELECT COUNT(company)
FROM data_analyst_jobs
WHERE location = ('TN')
	OR location = ('KY');
			--27	

--How many postings in Tennessee have a star rating above 4?
SELECT COUNT(company)
FROM data_analyst_jobs
WHERE location = ('TN')
		AND star_rating >4;
			--3
				
--How many postings in the dataset have a review count between 500 and 1000?
SELECT COUNT(company)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
			--151

--Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. 
--Which state shows the highest average rating?
SELECT location, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating DESC;
			--NEBRASKA

--Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT COUNT(DISTINCT (title))
FROM data_analyst_jobs;
			--881

--How many unique job titles are there for California companies?
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE location = ('CA');
			--230

--Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. 
--How many companies are there with more that 5000 reviews across all locations?
SELECT company, (AVG(star_rating))
FROM data_analyst_jobs
WHERE review_count >5000
GROUP BY company;
			--40

--Add the code to order the query in #9 from highest to lowest average star rating.
--Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT company, (AVG(star_rating)) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count >5000
GROUP BY company
ORDER BY avg_star_rating DESC;
			-- GENERAL MOTORS-- avg_star_rating = 4.1999998090000000

--Find all the job titles that contain the word ???Analyst???. How many different job titles are there?
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE title ILIKE ('%Analyst%');
			--1669

--How many different job titles do not contain either the word ???Analyst??? or the word ???Analytics???? What word do these positions have in common?
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE NOT title LIKE ('%Analy%');
			--39

--BONUS--
--You want to understand which jobs requiring SQL are hard to fill.
--Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.
	--Disregard any postings where the domain is NULL.
	--Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top.
	--Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?
	
SELECT domain, COUNT(title)
FROM data_analyst_jobs
WHERE skill LIKE ('%SQL%')
		AND domain IS NOT NULL
		AND days_since_posting >21
GROUP BY domain
ORDER BY COUNT(title) DESC
LIMIT 4;

--Internet and Software 62
--Banks and Financial Services 61
--Consulting and Business Services 57
--Health Care 52