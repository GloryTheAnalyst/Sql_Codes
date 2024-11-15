-- Case Statements

SELECT first_name, 
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 and 50 THEN 'Old'
    WHEN age >= 50 THEN 'On deaths door'
END AS Age_Bracket
FROM parks_and_recreation.employee_demographics;


-- Pay Increase
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus


Select first_name, last_name, salary,
CASE
	WHEN salary < 50000  THEN salary + (salary * 0.05)
    WHEN salary > 50000  THEN salary + (salary * 0.07)
    WHEN dept_id = 6 THEN salary + (salary * 0.1)
END as New_Salary
FROM parks_and_recreation.employee_salary;
