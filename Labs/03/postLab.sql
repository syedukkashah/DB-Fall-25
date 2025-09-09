
--Q11
alter table employees modify bonus number(6,2) unique;
select * from employees;
insert into employees values(10001, 'John Doe', 6000, 100, 5000, 'Lahore', 20, 'uk@gmail.com');
insert into employees values(10002, 'Tom Smith', 6000, 100, 5000, 'Lahore', 20, 'uk@gmail.com');
select * from employees;

--Q12
alter table employees add DOB date;

--Q13
insert into employees values(10003, 'Benedict Cabbage', 6000, 100, 5000, 'Lahore', 14, 'uk@gmail.com', '09-MAY-2025');

--Q14
alter table employees drop constraint fk_emp_dept;
insert into employees values(10004, 'Henry Cavill', 6060, 1034, 5050, 'Lahore', 19, 'uk3@gmail.com', '08-MAY-2025');
select * from employees;
alter table employees add constraint fk_emp_dept foreign key (dept_id);
insert into employees values(10005, 'Henry Cavill', 6070, 1034, 5050, 'Islamabad', 19, 'uk4@gmail.com', '03-MAY-2025');

--Q15
alter table employees drop (city, age);
select * from employees;

--Q16
select dept_id, emp_id from employees order by dept_id;

--Q17
alter table employees rename column salary to monthly_salary;
select * from employees;

--Q18
select department_id, department_name, manager_id, location_id from hr.departments d where not exists (select 1 from hr.employees e where e.department_id = d.department_id) order by department_name;

--Q19
drop table employees;

--Q20
select * from (select department_id, count(employee_id) as employee_count from hr.employees group by department_id order by employee_count desc) where rownum = 1; 

