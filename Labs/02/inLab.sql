spool inLabOutput.txt
--Q1
prompt Q1 Output: 
select sum(salary) from employees;
--Q2
prompt Q2 Output: 
select avg(salary) from employees;
--Q3
prompt Q3 Output: 
select manager_id, count(*) as employee_count from employees group by manager_id;
--Q10.Extract the first 5 characters from each employee’s last name.
prompt Q4 Output: 
select * from employees where salary = (select min(salary) from employees);
--Q5
prompt Q5 Output: 
select sysdate from dual;
--Q6
prompt Q6 Output: 
select to_char(sysdate, 'DAY MONTH YYYY') as current_date from dual;
--Q7
prompt Q7 Output: 
select * from employees where to_char(hire_date, 'DY') = 'WED';
--Q8
prompt Q8 Output: 
select MONTHS_BETWEEN(to_date('01-JAN-2025'), to_date('01-OCT-2024')) as months_between from dual;
--Q9
prompt Q9 Output: 
select employee_id, first_name, hire_date, floor(MONTHS_BETWEEN(sysdate, hire_date)) as months_worked from employees;
--Q10
prompt Q10 Output: 
select substr(last_name, 1, 5) as substring from employees;

spool off