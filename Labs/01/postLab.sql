spool postLabOutput.txt
--Q11
prompt Q11 Output:
select * from employees where hire_date between date '2005-01-01' and date '2006-12-31';

--Q12
prompt Q12 Output:
select * from employees where manager_id is null;
--Q13
prompt Q13 Output:
select * from employees where salary < all( select salary from employees where salary > 8000);
--Q14
prompt Q14 Output:
select * from employees where salary > any(select salary from employees where department_id = 90);

--Q15
prompt Q15 Output:
select * from departments d where exists (select 1 from employees e where e.department_id = d.department_id);
--Q16
prompt Q16 Output:
select * from departments d where not exists (select 1 from employees e where e.department_id = d.department_id);

--Q17
prompt Q17 Output:
select * from employees where salary not between 5000 and 15000;
--Q18
prompt Q18 Output:
select * from employees where department_id in (10,20,30) and department_id <> 40;
--Q19
prompt Q19 Output:
select * from employees where salary < (select min(salary) from employees where department_id = 50);
--Q20
prompt 20 Output:
select * from employees where salary > (select max(salary) from employees where department_id = 90);
spool off