-- 1 Create database
CREATE DATABASE company;

-- 2 Use the database
USE company;

--  3 Create employees table
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10,2),
    date_of_joining DATE
);

-- 4 Insert employee data
INSERT INTO employees (name, position, salary, date_of_joining) VALUES
('John Doe', 'Manager', 55000.00, '2020-01-15'),
('Jane Smith', 'Developer', 48000.00, '2019-07-10'),
('Alice Johnson', 'Designer', 45000.00, '2021-03-22'),
('Bob Brown', 'Developer', 50000.00, '2018-11-01');

-- 5 Retrieve all employees who are Developers
SELECT * FROM employees WHERE position = 'Developer';

-- 6 Update salary of Alice Johnson
set sql_safe_updates = 0;
UPDATE employees SET salary = 46000.00 WHERE name = 'Alice Johnson'; 

select * from employees;



-- 7 Delete employee record for Bob Brown
DELETE FROM employees WHERE name = 'Bob Brown';
select * from employees;

-- 8 Find employees with salary greater than 48000
SELECT * FROM employees WHERE salary > 48000;

-- 9 Add new column email
ALTER TABLE employees MODIFY COLUMN email VARCHAR(100);

select * from employees;

-- 10 Update email of John Doe
UPDATE employees SET email = 'john.doe@company.com' WHERE name = 'John Doe';

select * from employees;

-- 11 Retrieve only name and salary of all employees
SELECT name, salary FROM employees;

-- 12 Count employees who joined after January 1, 2020
SELECT COUNT(*) AS count FROM employees WHERE date_of_joining > '2020-01-01';

-- 13 Order employees by salary in descending order
SELECT * FROM employees ORDER BY salary DESC;

-- 14 Drop the email column
ALTER TABLE employees DROP COLUMN email;


-- 15 Find the employee with the highest salary
SELECT * FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

     
     
    
