SELECT gender, AVG(salary), max(salary), min(salary), count(salary)
 FROM parks_and_recreation.employee_demographics dem
 JOIN parks_and_recreation.employee_salary
	ON dem.employee_id = sal.employee_id 
 ;
 
 WITH CTE_EXAMPLE AS
 (
 SELECT gender, AVG(salary) avg_sal, max(salary) max_sal, min(salary) min_sal, count(salary) count_sal
 FROM parks_and_recreation.employee_demographics dem
 JOIN parks_and_recreation.employee_salary sal
	ON dem.employee_id = sal.employee_id 
GROUP BY gender
)
SELECT AVG(avg_sal)
FROM CTE_EXAMPLE
 ;
 
SELECT AVG(avg_sal)
FROM (SELECT gender, AVG(salary) avg_sal, max(salary) max_sal, min(salary) min_sal, count(salary) count_sal
 FROM parks_and_recreation.employee_demographics dem
 JOIN parks_and_recreation.employee_salary sal
	ON dem.employee_id = sal.employee_id 
GROUP BY gender
) example_subquery
 ;