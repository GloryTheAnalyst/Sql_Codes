-- Exploratory Data Analysis 

Skills used: Joins, Aggregate Functions. 

SELECT * 
FROM layoffs_staging2;


SELECT * 
FROM layoffs_staging2;

SELECT max(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

SELECT * 
FROM layoffs_staging2
where percentage_laid_off
ORDER BY total_laid_off desc;

SELECT * 
FROM layoffs_staging2
where percentage_laid_off
ORDER BY funds_raised_millions desc;

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 desc;

SELECT MIN(`date`), max(`date`)
FROM layoffs_staging2



