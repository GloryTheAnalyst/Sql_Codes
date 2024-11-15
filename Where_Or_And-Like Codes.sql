SELECT * 
FROM parks_and_recreation.employee_salary
WHERE first_name = 'Leslie'
;

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary > '50000'
;


SELECT * 
FROM parks_and_recreation.employee_demographics
Where Gender = 'Female'
;

SELECT * 
FROM parks_and_recreation.employee_demographics
Where Gender != 'Female'
;

-- AND OR NOT -- Logical Operators

SELECT * 
FROM parks_and_recreation.employee_demographics
Where Gender = 'Female'
AND Birth_date > 1985-01-01
; 

SELECT * 
FROM parks_and_recreation.employee_demographics
Where Birth_date > 1985-01-01
OR gender = 'male'
; 

SELECT * 
FROM parks_and_recreation.employee_demographics
Where Birth_date > 1985-01-01
OR NOT gender = 'male'
; 

SELECT * 
FROM parks_and_recreation.employee_demographics
Where (first_name = 'Leslie' AND age = 44) OR age > 55 
;

--- LIKE Statement --

SELECT * 
FROM parks_and_recreation.employee_demographics
Where first_name LIKE '%er%'
;

SELECT * 
FROM parks_and_recreation.employee_demographics
Where first_name LIKE 'A___'
;

