


SELECT * FROM parks_and_recreation.employee_demographics;

SELECT first_name, length(first_name)
FROM parks_and_recreation.employee_demographics
Order by 2
;

select Upper('sky');
select Lower('sky');
select Trim('      sky      ');


SELECT first_name, LEFT(First_name, 4)
FROM parks_and_recreation.employee_demographics;

SELECT first_name, 
LEFT(First_name, 4),
RIGHT (First_name, 4)
FROM parks_and_recreation.employee_demographics;

SELECT first_name, 
LEFT(First_name, 4),
RIGHT (First_name, 4),
substring(First_name, 3,2),
birth_date,
substring(birth_date,6,2) AS birth_month
FROM parks_and_recreation.employee_demographics;


SELECT first_name, Replace(First_name, 'a', 'z')
FROM parks_and_recreation.employee_demographics;

SELECT locate('x', 'Alexander')

SELECT first_name, last_name
CONCAT(fist_name,' ', last_name) 
FROM parks_and_recreation.employee_demographics;