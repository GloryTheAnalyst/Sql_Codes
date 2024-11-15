---- Limits and Aliasing 


SELECT *
FROM parks_and_recreation.employee_demographics
Limit 3
;

SELECT *
FROM parks_and_recreation.employee_demographics
Order by age DESC
Limit 3
;


---- Aliasing
SELECT gender, avg(age) AS avg_age
FROM parks_and_recreation.employee_demographics
group by gender
having avg_age > 40
;