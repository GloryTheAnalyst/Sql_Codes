-- Triggers and Events

SELECT * 
FROM parks_and_recreation.employee_demographics;

SELECT * 
FROM parks_and_recreation.employee_salary;


DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON parks_and_recreation.employee_salary
    FOR each row 
BEGIN
	insert INTO parks_and_recreation.employee_demographics (parks_and_recreation.employee_id, first_name, last_name)
    values (New.employee_id, New.first_name, New.last_name);
END $$
DELIMITER ; 