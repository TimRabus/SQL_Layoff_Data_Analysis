-- Exploratory Data Analysis

SELECT * FROM layoffs_staging2;



-- EXPLORING THE DATA


-- What was the maximal layoff as well as the percentage?
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;


-- What are the date ranges of our dataset?
SELECT MIN(date), MAX(date)
FROM layoffs_staging2;

SELECT COUNT(*) FROM layoffs_staging2;

-- Which company had to layoff 100% of their people?
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;


-- Which company had the biggest layoffs?
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;


-- Which industry had the biggest layoffs?
SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;


-- Which industry had the highest layoff percentage?
SELECT industry, ROUND(AVG(percentage_laid_off),2)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;


-- Which country had the biggest layoffs?
SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;


-- Which year was the worst year of layoffs?
SELECT YEAR(date), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(date)
ORDER BY 1 DESC;


-- At which stage are the companys that have the most layoffs?
SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;



-- Exploring the laid off percentage
SELECT company, SUM(percentage_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;


SELECT company, AVG(percentage_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;



-- ROLLING TOTAL LAYOFFS PER MONTH

-- Total Layoffs per Month
SELECT 
	SUBSTRING(date,1,7) AS MONTH,
	SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(date,1,7) IS NOT NULL
GROUP BY SUBSTRING(date,1,7)
ORDER BY 1 ASC;


-- Rolling Sum
WITH Rolling_Total AS
(
SELECT 
	SUBSTRING(date,1,7) AS MONTH,
	SUM(total_laid_off) AS TOTAL_OFF
	FROM layoffs_staging2
	WHERE SUBSTRING(date,1,7) IS NOT NULL
	GROUP BY SUBSTRING(date,1,7)
	ORDER BY 1 ASC
)
SELECT 
	MONTH, 
    TOTAL_OFF,
    SUM(TOTAL_OFF) OVER(ORDER BY MONTH) AS Rolling_total
FROM Rolling_Total;



-- WHICH COMAPNY LAID OFF THE MOST PEOPLE PER YEAR? TOP 5 BY YEAR

SELECT company, YEAR(date),SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(date)
ORDER BY 3 DESC;

-- Create the Partition by Year
WITH Company_Year (company, years, total_laid_off) AS
(
	SELECT company, YEAR(date),SUM(total_laid_off)
	FROM layoffs_staging2
	GROUP BY company, YEAR(date)
), Company_Year_Rank AS
	(SELECT *, DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
	FROM Company_Year
	WHERE years IS NOT NULL
	)
		SELECT *
		FROM Company_Year_Rank
		WHERE Ranking <= 5;

