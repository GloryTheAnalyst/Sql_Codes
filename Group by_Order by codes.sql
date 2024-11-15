--- Group By

SELECT * 
FROM parks_and_recreation.employee_demographics;

SELECT gender
FROM parks_and_recreation.employee_demographics
group by gender
;

SELECT gender, avg(age)
FROM parks_and_recreation.employee_demographics
group by gender
;

SELECT gender, avg(age), min(age), max(age), count(age)
FROM parks_and_recreation.employee_demographics
group by gender
;

--- Order by ---

SELECT*
fROM employee_demographics
;

SELECT*
fROM employee_demographics
ORDER BY First_name
;