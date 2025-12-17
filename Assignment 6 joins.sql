create database company;
 
use company;

create table employee(
emp_id int primary key,
emp_name varchar(50),
dept_id int,
salary decimal(10,2));

insert into employee values
(1,"John",101,50000),
(2,"Emma",101,65000),
(3,"Raj",102,45000),
(4,"Merra",103,70000),
(5,"Ravi",102,48000),
(6,"Naina",103,52000),
(7,"Alex",101,58000);

create table department(
dept_id int ,
dept_name varchar(100));

insert into department values 
(101,"Sales"),
(102,"Marketing"),
(104,"Finance"),
(104,"HR");
 
select * from department;
#1. Display employee name with their department name. 
select e.emp_name, d.dept_name
from employee e
join department d 
on e.dept_id=d.dept_id; 

#2. list all employee including those with no matching demartment. 
select e.emp_name, d.dept_name 
from employee e 
left join department d 
on e.dept_id=d.dept_id;

#3. list all department even if no employee.
select e.emp_name, d.dept_name 
from department d 
left join employee e
on d.dept_id=e.dept_id;

#4. show employee from sales department. 
select e.emp_name, d.dept_name 
from employee e 
join department d 
on d.dept_id=e.dept_id
where d.dept_name = 'sales'; 

#5. find top 3 highest paid employee.
 select e.emp_name, salary 
 from employee e 
 order by salary desc
 limit 3;
 
 # 6. find employee earning more than 50,000 from marketing. 
select e.emp_name, d.dept_name 
from employee e
join department d 
on d.dept_id=e.dept_id 
where dept_name = 'marketing'
and e.salary > 50000; 
 
#7. count employee in each department. 
select d.dept_name ,count(emp_id) as emp_count
from department d
left join employee e 
on d.dept_id=e.dept_id 
group by d.dept_name
order by emp_count desc; 

#8. show department having more than 2 employee.
select e.emp_name, count(dept_id)
from employee e 
inner join department d 
on e.emp_id=d.emp_id 
group by emp_name 
having count(dept_name >2);

#9. show highest  salary in each department. 
select d.dept_name, max(salary) as highest_salary
from employee e
join department d 
on e.dept_id=d.dept_id 
group by d.dept_name;

#10. show employee whose salary is above department average.
 
#11. show employee and their department sorted by department name. 
select e.emp_name, d.dept_name 
from employee e
join department d 
on e.dept_id=d.dept_id
order by d.dept_name; 

#12. list the 2 lowest paid employee with department names. 
select e.emp_name,d.dept_name 
from employee e
left join department d 
on e.dept_id=d.dept_id 
order by e.salary asc 
limit 2; 

#13. shoe total salary expenditure per department. 

 
 #14. show department where total salary spent is more than 150,000. 
 select d.dept_name, 
 sum(e.salary) as total_salary_spent 
 from employee e
 join department d 
 on e.dept_id=d.dept_id 
 group by d.dept_name 
 having sum(e.salary) > 150000; 
 
 #15. show employee who belong to department starting with 's'.
 select e.emp_name, d.dept_name 
 from employee e 
 join department d 
 on e.dept_id=d.dept_id 
 where d.dept_name like 's';
 
 #16. find employee whose salary is the highest in their department. 
	
#17. show employee and department sorted by salary descending. 
select e.emp_name,d.dept_name, salary  
from employee e
join department d 
on e.dept_id=d.dept_id 
order by e.salary desc; 

#18. count how many employee earn above 50,000 per department.

 
