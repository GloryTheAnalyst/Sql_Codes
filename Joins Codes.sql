SELECT * FROM parks_and_recreation.employee_salary
;

SELECT * FROM parks_and_recreation.employee_demographics
;

SELECT * 
FROM parks_and_recreation.employee_salary AS Dem
INNER JOIN parks_and_recreation.employee_demographics AS Sal
	ON Dem.employee_id = Sal.employee_id
    ;

--- Outer Joins

SELECT *
FROM parks_and_recreation.employee_salary AS Dem
LEFT JOIN parks_and_recreation.employee_demographics AS Sal
	ON Dem.employee_id = Sal.employee_id
    ; 
    
    SELECT *
FROM parks_and_recreation.employee_salary AS Dem
RIGHT JOIN parks_and_recreation.employee_demographics AS Sal
	ON Dem.employee_id = Sal.employee_id
    ; 
    
    ---- Self Join
    
      SELECT *
FROM parks_and_recreation.employee_salary AS emp1
JOIN parks_and_recreation.employee_salary AS emp2
	ON emp1.employee_id = emp2.employee_id
    ;
    
--- Joining multiple tables together
SELECT *
FROM parks_and_recreation.employee_salary AS Dem
INNER JOIN parks_and_recreation.employee_demographics AS Sal
	ON Dem.employee_id = Sal.employee_id
    ; 
    
SELECT *
FROM 
;
    

    
    