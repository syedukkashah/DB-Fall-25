
--Q11 A company policy says no employee can have the same bonus amount. Add a UNIQUE constraint on bonus and test it with two records.
alter table employees modify bonus number(6,2) unique;
select * from employees;
insert into employees values(10001, 'John Doe', 6000, 100, 5000, 'Lahore', 20, 'uk@gmail.com');
insert into employees values(10002, 'Tom Smith', 6000, 100, 5000, 'Lahore', 20, 'uk@gmail.com');
select * from employees;

--Q12 Add a dob DATE column in staff and add a constraint that ensures employees must be at least 18 years old.
alter table employees add DOB date;

--Q13 Insert an employee with invalid date of birth (less than 18 years old) and check the error
insert into employees values(10003, 'Benedict Cabbage', 6000, 100, 5000, 'Lahore', 14, 'uk@gmail.com', '09-MAY-2025');

--Q14 Drop the dept_id foreign key and insert an employee with a non-existing department. Then re-add the constraint and check again.
alter table employees drop constraint fk_emp_dept;
insert into employees values(10004, 'Henry Cavill', 6060, 1034, 5050, 'Lahore', 19, 'uk3@gmail.com', '08-MAY-2025');
select * from employees;
alter table employees add constraint fk_emp_dept foreign key (dept_id);
insert into employees values(10005, 'Henry Cavill', 6070, 1034, 5050, 'Islamabad', 19, 'uk4@gmail.com', '03-MAY-2025');

--Q15 Drop age and city columns.
alter table employees drop (city, age);
select * from employees;

--Q16 Display departments and employees of that departments.
select dept_id, emp_id from employees order by dept_id;

--Q17 Rename the column salary to monthly_salary and ensure constraints remain intact
alter table employees rename column salary to monthly_salary;
select * from employees;

--Q18 Write a query to display all departments that have no employees.
select department_id, department_name, manager_id, location_id from hr.departments d where not exists (select 1 from hr.employees e where e.department_id = d.department_id) order by department_name;

--Q19 Write a query to empty the table of students .
truncate table employees;

--Q20
select * from (select department_id, count(employee_id) as employee_count from hr.employees group by department_id order by employee_count desc) where rownum = 1; 

