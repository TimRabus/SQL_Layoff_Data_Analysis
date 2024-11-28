-- Data Cleaning

SELECT * FROM layoffs;

/* 	1. Remove duplicates without primaryID column
	2. Cleaning data
    3. Blank Values or Null Values
    4. Remove any unnecessary columns */
 
 
 
 -- Create a new table to not work on the RAW Data
CREATE TABLE layoffs_staging
LIKE layoffs;



-- Insert values from the RAW data into the staging Table
INSERT INTO layoffs_staging
SELECT * FROM layoffs;

SELECT * FROM layoffs_staging;



-- REMOVE DUPLICATES (without primaryID column)



-- Create row_numbers to see if there are any duplicate rows
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off,'date') AS row_num
FROM layoffs_staging;


-- Select the duplicates rows
WITH duplicate_cte AS
(
	SELECT *,
	ROW_NUMBER() OVER(
	PARTITION BY company, location, industry, total_laid_off, percentage_laid_off,'date', stage, country, funds_raised_millions) AS row_num
	FROM layoffs_staging
)
SELECT * 
FROM duplicate_cte
WHERE row_num > 1;


-- Create a new table to add the Row_num column to indicate the duplicates
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Insert data into our new table (incl. row_num)
INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off,'date') AS row_num
FROM layoffs_staging;

SELECT * FROM layoffs_staging2;


-- Identify the duplicated rows
SELECT * 
FROM layoffs_staging2
WHERE row_num > 1;


-- Delete the duplicated rows
DELETE
FROM layoffs_staging2
WHERE row_num > 1;





-- CLEANING DATA



-- TRIM
-- Select the column to trim
SELECT TRIM(company)
FROM layoffs_staging2;


-- Update the table with the trimmed column
UPDATE layoffs_staging2
SET company = TRIM(company);



-- STANDARDIZING THE DATA


-- Select the distinct industry to spot unstandardized values (e.g. Crypto, Crypto Currency, ...)
SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1;


-- Checking on the unstandardized values (Crypto, Crypto Currency, CryptoCurrency)
SELECT * 
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';



-- Cleaning/Updating the column with standardized values
UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';


-- Screen on unstandardized values in the country column (United States, United States.)
SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;


-- Remove the additional '.' from the 'United States.' value
SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_staging2
ORDER BY 1;



-- Update the table accordingly
UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';



-- CHANGE DATE COLUMN FROM TEXT TO DATE VALUES
-- Select the date format we want to have
SELECT date,
	str_to_date(date,'%m/%d/%Y')
FROM layoffs_staging2;


-- Update the date column
UPDATE layoffs_staging2
SET date = str_to_date(date,'%m/%d/%Y');


-- Change the column to an actual date formatted column in the table
ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;




-- NULL AND MISSING VALUES



-- Screening the data
SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';


-- Pick specific case and see if it is possible to populate missing values
SELECT *
FROM layoffs_staging2
WHERE company = 'Airbnb';


-- Standardize to NULL values when there is a missing values
UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';


-- Finding right data to populate by using a self-join
SELECT t1.industry, t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2 
	ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;


-- Update the data / Populate the table
UPDATE layoffs_staging2 t1
	JOIN layoffs_staging2 t2 
		ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;



-- Select and remove data that you cannot trust/that is not useful: here NULL in total_laid_off AND percentage_laid_off
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;


-- Remove the data
DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;



-- REMOVE ANY COLUMN THAT IS NOT NEEDED



-- Remove row_num column
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;


-- Final Table
SELECT * FROM layoffs_staging2;