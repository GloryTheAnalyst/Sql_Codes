-- Data Cleaning

Skills Used: CTEs, Creating Views, Formatting. 

SELECT *
FROM layoffs;

-- 1. Remove Duplicates
-- 2. Standardize the Data
-- 3. Null or blank Values
-- 4. Remove unnecessary rows and columns 

CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *
FROM layoffs_staging;

INSERT layoffs_staging
SELECT *
FROM layoffs;

SELECT *,
row_number() OVER(
partition by company, industry, total_laid_off, `date`) AS row_num
FROM layoffs_staging;

WITH duplicate_cte AS
(
SELECT *,
row_number() OVER(
partition by company, industry, total_laid_off, `date`, Stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;








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
  `ROW_NUM` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT *
FROM layoffs_staging2
WHERE row_num = 1;

INSERT INTO layoffs_staging2
SELECT *,
row_number() OVER(
partition by company, industry, total_laid_off, `date`, Stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging;

SELECT *
FROM layoffs_staging2
WHERE row_num > 1;

DELETE
FROM layoffs_staging2
WHERE row_num > 1;

SELECT *
FROM layoffs_staging2;


-- Standardizing Data

SELECT distinct(Trim(Company))
FROM layoffs_staging2;

SELECT Company, Trim(Company)
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = Trim(Company);

SELECT distinct industry
FROM layoffs_staging2
Order by 1;

SELECT *
FROM layoffs_staging2
Where industry Like 'Crypto%';

UPDATE layoffs_staging2
SET industry = 'Crypto'
Where industry Like 'Crypto%';

SELECT *
FROM layoffs_staging2
Where Country Like 'United States%';

UPDATE layoffs_staging2
SET Country = 'United States'
Where Country Like 'United States'; 


-- DATE FORMATTING 

SELECT `date`
FROM layoffs_staging2;
 
 
 update layoffs_staging2
 SET `date` = str_to_date(`date`, '%m/%d/%Y');
 
 ALTER TABLE layoffs_staging2
 MODIFY  COLUMN `date` DATE;
 
 
 SELECT*
 FROM layoffs_staging2
 WHERE total_laid_off is NULL
 AND percentage_laid_off is NULL;
 
 update layoffs_staging2
 SET industry = NULL
 WHERE industry = '';
 
 SELECT*
FROM layoffs_staging2
WHERE Industry is NULL
OR industry = '';

SELECT*
FROM layoffs_staging2
WHERE company = 'Airbnb';

SELECT *
FROM layoffs_staging2  t1
JOIN layoffs_staging2  t2
	ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;


UPDATE layoffs_staging2 t1
JOIN layoffs_staging2  t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE (t1.industry IS NULL)
AND t2.industry IS NOT NULL;



-- 4. remove any columns and rows 

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL;

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- Delete Useless data we can't really use
DELETE FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging2;

ALTER TABLE layoffs_staging2
 DROP COLUMN ROW_NUM;
