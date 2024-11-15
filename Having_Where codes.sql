--- Where and Having

SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
Group by gender
Having AVG(age) > 40 
;

SELECT Occupation, Avg(salary)
FROM parks_and_recreation.employee_salary
Where occupation Like '%manager%'
Group by Occupation
having avg(salary) > 75000
;