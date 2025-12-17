create database as7;
use as7;
CREATE TABLE emp (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    manager_id INT
);

INSERT INTO emp (emp_id, emp_name, department, salary, manager_id) VALUES
(1, 'Arjun', 'HR', 40000, NULL),
(2, 'Neha', 'IT', 65000, 5),
(3, 'Rohan', 'IT', 55000, 5),
(4, 'Meera', 'Finance', 70000, NULL),
(5, 'Suresh', 'IT', 90000, 4),
(6, 'Alia', 'HR', 45000, 1),
(7, 'Karan', 'Finance', 75000, 4),
(8, 'Rahul', 'Marketing', 30000, NULL),
(9, 'Priya', 'Marketing', 35000, 8),
(10, 'Varun', 'IT', 50000, 5);

select* from emp;

#1List employees earning more than the average salary.
SELECT * 
FROM emp
WHERE salary > (SELECT AVG(salary) FROM emp);

#2Find employees who earn the maximum salary.
SELECT * 
FROM emp
WHERE salary = (SELECT MAX(salary) FROM emp);

#3Find employees working in the same department as ‘Neha’.
SELECT * 
FROM emp
WHERE department = (SELECT department 
    FROM emp 
    WHERE emp_name = 'Neha');
    
#4List employees whose salary is higher than Suresh’s salary.
SELECT * 
FROM emp
WHERE salary > (
    SELECT salary 
    FROM emp 
    WHERE emp_name = 'Suresh'
);

#5Show departments where the minimum salary is less than 40,000.
SELECT department
FROM emp
GROUP BY department
HAVING MIN(salary) < 40000;

#6Find employees who do not have a manager.
SELECT * 
FROM emp
WHERE manager_id IS NULL;

#7Find employees who report to the same manager as Rohan.
SELECT * 
FROM emp
WHERE manager_id = (
    SELECT manager_id 
    FROM emp 
    WHERE emp_name = 'Rohan'
);

#8List employees in IT with salary above the IT average.
SELECT * 
FROM emp
WHERE department = 'IT'
AND salary > (
    SELECT AVG(salary) 
    FROM emp 
    WHERE department = 'IT'
);

#9Show employees whose salary is in the bottom 3.
SELECT * 
FROM emp
ORDER BY salary ASC
LIMIT 3;

#10Show employees whose salary is within the top 3.
SELECT * 
FROM emp
ORDER BY salary DESC
LIMIT 3;

#11Find employees earning more than HR department average salary.
SELECT * 
FROM emp
WHERE salary > (
    SELECT AVG(salary) 
    FROM emp 
    WHERE department = 'HR'
);

#12List employees having the same salary as Priya.
SELECT * 
FROM emp
WHERE salary = (
    SELECT salary 
    FROM emp 
    WHERE emp_name = 'Priya'
);

#13Count employees who earn below overall average.
SELECT COUNT(*) 
FROM emp
WHERE salary < (SELECT AVG(salary) FROM emp);

#14Show employees whose manager earns more than 70,000.
SELECT * 
FROM emp
WHERE manager_id IN (
    SELECT emp_id 
    FROM emp 
    WHERE salary > 70000
);

#15display employees in departments where more than 2 employees work.
SELECT * 
FROM emp
WHERE department IN (
    SELECT department 
    FROM emp
    GROUP BY department
    HAVING COUNT(*) > 2
);

#16Show departments where the average salary is above company average.
SELECT department
FROM emp
GROUP BY department
HAVING AVG(salary) > (SELECT AVG(salary) FROM emp);

#17Find the 2nd highest salary.
SELECT MAX(salary)
FROM emp
WHERE salary < (SELECT MAX(salary) FROM emp);

#18Employees with salary greater than the average salary of their manager’s team.
SELECT e.*
FROM emp e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM emp
    WHERE manager_id = e.manager_id
);

#19Show employees who work in a department where Suresh works.
SELECT * 
FROM emp
WHERE department = (
    SELECT department 
    FROM emp 
    WHERE emp_name = 'Suresh'
);

#20List employees whose manager earns the maximum salary.
SELECT * 
FROM emp
WHERE manager_id IN (
    SELECT emp_id 
    FROM emp 
    WHERE salary = (SELECT MAX(salary) FROM emp)
);

#21Show employees whose salaries appear more than once.
SELECT * 
FROM emp
WHERE salary IN (
    SELECT salary
    FROM emp
    GROUP BY salary
    HAVING COUNT(*) > 1
);

#22List employees earning less than the minimum IT salary.
SELECT * 
FROM emp
WHERE salary < (
    SELECT MIN(salary) 
    FROM emp 
    WHERE department = 'IT'
);

#23Show employees with salary higher than Finance average salary.
SELECT * 
FROM emp
WHERE salary > (
    SELECT AVG(salary)
    FROM emp
    WHERE department = 'Finance'
);

#24Find employees earning exactly the 3rd highest salary.
SELECT * 
FROM emp
WHERE salary = (
    SELECT DISTINCT salary
    FROM emp
    ORDER BY salary DESC
    LIMIT 1 OFFSET 2
);

#25List employees having salary in the same salary group as Meera’s department.
SELECT * 
FROM emp
WHERE salary IN (
    SELECT salary
    FROM emp
    WHERE department = (
        SELECT department 
        FROM emp 
        WHERE emp_name = 'Meera'
    )
);



