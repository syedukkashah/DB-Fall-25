spool inLabOutput.txt

--Q1
prompt Q1 Output:
create table employees (emp_id number(5) primary key, emp_name varchar(50) not null, salary number(10,2) constraint chk_salary check (salary > 20000) , dept_id number, constraint fk_emp_dept foreign key(dept_id) references hr.departments (department_id)); 
select * from employees;

--Q2
prompt Q2 Output:
alter table employees rename column emp_name to full_name;
select * from employees;

--Q3
prompt Q3 Output:
alter table employees drop constraint chk_salary;
insert into employees values(10000, 'Syed Ukkashah', 5000, 100);
select * from employees;

--Q4
prompt Q4 Output:
create table departments (dept_id number(5) primary key, dept_name varchar(50) unique);
insert all into departments(dept_id, dept_name) values(90, 'Finance') into departments(dept_id, dept_name) values(100, 'Security') into departments(dept_id, dept_name) values(60, 'IT') select * from dual;
select * from departments;

--Q5
prompt Q5 Output:
alter table employees drop constraint fk_emp_dept;
alter table employees add constraint fk_emp_dept foreign key (dept_id) references departments(dept_id);

--Q6
prompt Q6 Output:
alter table employees add bonus number(6,2) default 1000;
select * from employees;

--Q7
prompt Q7 Output:
alter table employees add city varchar(50) default 'Karachi';
alter table employees add age number(3);
alter table employees add constraint adult check(age>18);
select * from employees;

--Q8
prompt Q8 Output:
delete from departments where dept_id in (90, 60);
select * from departments;

--Q9
prompt Q9 Output:
alter table employees modify (full_name varchar(20), city varchar(20)); 

--Q10
prompt Q10 Output:
alter table employees add email varchar(50) unique;
select * from employees;

