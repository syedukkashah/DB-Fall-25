spool inLabOutput.txt
--Q1
select * from employees where department_id <> 100;

--Q2
select * from employees where salary in (10000,12000,15000);

--Q3
select first_name, salary from employees where salary <= 25000;

--Q4
select * from employees where department_id <> 60;

--Q5
select * from employees where department_id between 60 and 80;

--Q6
select * from departments;

--Q7
select * from employees where first_name = 'Steven';

--Q8
select * from employees where salary between 15000 and 25000 and department_id = 80;

--Q9
select * from employees where salary < any( select salary from employees where department_id = 100);

--Q10
SELECT *
FROM employees e
WHERE (SELECT COUNT(*) 
       FROM employees 
       WHERE department_id = e.department_id) = 1;
       
--Q11
select * from employees e where (select count(*) from employees where department_id = e.department_id) = 1;

spool off