-- Exploratory Data Analysis 

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

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR (`date`)
ORDER BY 1 desc;

SELECT MIN(`date`), max(`date`)
FROM layoffs_staging2;

SELECT substring(`date`, 6,2) as MONTH
FROM layoffs_staging2;

SELECT substring(`date`, 1,7) as `MONTH`, sum(total_laid_off)
FROM layoffs_staging2
WHERE substring(`date`, 1,7)  IS NOT NULL
group by `MONTH`
ORDER BY 1 ASC;

WITH Rolling_total AS 
(
SELECT substring(`date`, 1,7) as `MONTH`, sum(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE substring(`date`, 1,7)  IS NOT NULL
group by `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, total_off
,sum(total_off) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_total;

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 desc;

SELECT company, year(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, year(`date`)
order by 3 DESC;

WITH Company_Year(company, years, total_laid_off) AS
(
SELECT company, year(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, year(`date`)
), Company_Year_Rank AS
(
SELECT*, 
DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <= 5;