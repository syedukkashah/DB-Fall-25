spool inLabOutput.txt
--Q1
prompt Q1 Output:
select * from employees where department_id <> 100;

--Q2
prompt Q2 Output:
select * from employees where salary in (10000,12000,15000);

--Q3
prompt Q3 Output:
select first_name, salary from employees where salary <= 25000;

--Q4
prompt Q4 Output:
select * from employees where department_id <> 60;

--Q5
prompt Q5 Output:
select * from employees where department_id between 60 and 80;

--Q6
prompt Q6 Output:
select * from departments;

--Q7
prompt Q7 Output:
select * from employees where first_name = 'Steven';

--Q8
prompt Q8 Output:
select * from employees where salary between 15000 and 25000 and department_id = 80;

--Q9
prompt Q9 Output:
select * from employees where salary < any( select salary from employees where department_id = 100);

--Q10
prompt Q10 Output:
select * from employees e where (select count(*) from employees where department_id = e.department_id) = 1;

spool off